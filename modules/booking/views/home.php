<?php
/**
 * @filesource modules/booking/views/home.php
 *
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 *
 * @see http://www.kotchasan.com/
 */

namespace Booking\Home;

use Gcms\Login;
use Kotchasan\Html;

/**
 * หน้า Home.
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class View extends \Gcms\View
{
    /**
     * หน้า Home.
     *
     * @param object $index
     * @param array  $login
     *
     * @return string
     */
    public function render($index, $login)
    {
        /* คำสั่งสร้างฟอร์ม */
        $form = Html::create('div', array(
            'class' => 'setup_frm',
        ));
        $form->add('div', array(
            'id' => 'booking-calendar',
            'class' => 'margin-left-right-bottom-top',
        ));
        /* Javascript */
        $form->script('initBookingCalendar();');

        return $form->render();
    }
}
