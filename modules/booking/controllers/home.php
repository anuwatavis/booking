<?php
/**
 * @filesource modules/booking/controllers/home.php
 *
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 *
 * @see http://www.kotchasan.com/
 */

namespace Booking\Home;

use Gcms\Login;
use Kotchasan\Html;
use Kotchasan\Http\Request;
use Kotchasan\Language;

/**
 * module=booking-home.
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class Controller extends \Gcms\Controller
{
    /**
     * หน้าแรก ปฏิทินการจอง.
     *
     * @param Request $request
     *
     * @return string
     */
    public function render(Request $request)
    {
        // ข้อความ title bar
        $this->title = Language::get('Booking calendar');
        // เลือกเมนู
        $this->menu = 'booking-home';
        // สมาชิก
        if ($login = Login::isMember()) {
            // แสดงผล
            $section = Html::create('section', array(
                'class' => 'content_bg',
            ));
            // breadcrumbs
            $breadcrumbs = $section->add('div', array(
                'class' => 'breadcrumbs',
            ));
            $ul = $breadcrumbs->add('ul');
            $ul->appendChild('<li><span class="icon-calendar">{LNG_Home}</span></li>');
            $section->add('header', array(
                'innerHTML' => '<h2 class="icon-event">'.$this->title.'</h2>',
            ));
            // แสดงตาราง
            $section->appendChild(createClass('Booking\Home\View')->render($request, $login));

            return $section->render();
        }
        // 404

        return \Index\Error\Controller::execute($this);
    }
}
