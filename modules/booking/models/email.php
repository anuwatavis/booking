<?php
/**
 * @filesource modules/booking/models/email.php
 *
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 *
 * @see http://www.kotchasan.com/
 */

namespace Booking\Email;

use Gcms\Line;
use Kotchasan\Date;
use Kotchasan\Language;

/**
 * ส่งอีเมลไปยังผู้ที่เกี่ยวข้อง.
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class Model extends \Kotchasan\KBase
{
    /**
     * ส่งอีเมลแจ้งการทำรายการ
     *
     * @param string $mailto อีเมล
     * @param string $name   ชื่อ
     * @param array  $order ข้อมูล
     */
    public static function send($mailto, $name, $order)
    {
        // สถานะการจอง
        $status = Language::find('BOOKING_STATUS', '', $order['status']);
        // ข้อความ
        $msg = array(
            '{LNG_Book a meeting} ['.self::$cfg->web_title.']',
            '{LNG_Contact name}: '.$name,
            '{LNG_Topic}: '.$order['topic'],
            '{LNG_Date}: '.Date::format($order['begin']).' - '.Date::format($order['end']),
            '{LNG_Status}: '.$status,
            '{LNG_Reason}: '.$order['reason'],
        );
        $msg = Language::trans(implode("\n", $msg));
        // ข้อความของแอดมิน
        $admin_msg = $msg."\nURL: ".WEB_URL."index.php?module=booking-order&id=".$order['id'];
        // ส่ง Line
        Line::send($admin_msg);
        if (self::$cfg->noreply_email != '') {
            // ส่งอีเมล
            $subject = '['.self::$cfg->web_title.'] '.Language::get('Book a meeting').' '.$status;
            // ข้อความของสมาชิก
            $msg = nl2br($msg."\nURL: ".WEB_URL."index.php?module=booking");
            // ส่งอีเมลไปยังผู้ทำรายการเสมอ
            \Kotchasan\Email::send($mailto.'<'.$name.'>', self::$cfg->noreply_email, $subject, $msg);
            // อีเมลของมาชิกที่สามารถอนุมัติได้ทั้งหมด
            $query = \Kotchasan\Model::createQuery()
                ->select('username', 'name')
                ->from('user')
                ->where(array(
                    array('social', 0),
                    array('active', 1),
                    array('username', '!=', $mailto),
                ))
                ->andWhere(array(
                    array('status', 1),
                    array('permission', 'LIKE', '%,can_approve_room,%'),
                ), 'OR')
                ->cacheOn();
            foreach ($query->execute() as $item) {
                \Kotchasan\Email::send($item->username.'<'.$item->name.'>', self::$cfg->noreply_email, $subject, $admin_msg);
            }
        }
        // คืนค่า

        return Language::get('Your message was sent successfully');
    }
}
