<?php
/**
 * @filesource Gcms/Line.php
 *
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 *
 * @see http://www.kotchasan.com/
 */

namespace Gcms;

use Kotchasan\Curl;

/**
 *  LINE Notify Class
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class Line extends \Kotchasan\KBase
{
    /**
     * เมธอดส่งข้อความไปยังไลน์
     * คืนค่าข้อความว่างถ้าสำเร็จ หรือ คืนค่าข้อความผิดพลาด
     *
     * @param string $message      ข้อความที่จะส่ง
     * @param string $line_api_key
     *
     * @return string
     */
    public static function send($message, $line_api_key = null)
    {
        if (empty($line_api_key)) {
            $line_api_key = empty(self::$cfg->line_api_key) ? '' : self::$cfg->line_api_key;
        }
        if ($line_api_key == '') {
            return 'API key can not be empty';
        } elseif ($message == '') {
            return 'message can not be blank';
        } else {
            $ch = new Curl();
            $ch->setHeaders(array(
                'Authorization' => 'Bearer '.$line_api_key,
            ));
            $result = $ch->post('https://notify-api.line.me/api/notify', array('message' => $message));
            if ($ch->error()) {
                return $ch->errorMessage();
            } else {
                $result = json_decode($result, true);
                if ($result['status'] != 200) {
                    return $result['message'];
                }
            }
        }

        return '';
    }
}
