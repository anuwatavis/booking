<?php
/**
 * @filesource modules/booking/views/settings.php
 *
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 *
 * @see http://www.kotchasan.com/
 */

namespace Booking\Settings;

use Kotchasan\Html;

/**
 * module=booking-settings.
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class View extends \Gcms\View
{

  /**
   * ฟอร์มตั้งค่า person.
   *
   * @return string
   */
  public function render()
  {
    // form
    $form = Html::create('form', array(
        'id' => 'setup_frm',
        'class' => 'setup_frm',
        'autocomplete' => 'off',
        'action' => 'index.php/booking/model/settings/submit',
        'onsubmit' => 'doFormSubmit',
        'ajax' => true,
        'token' => true,
    ));
    $fieldset = $form->add('fieldset', array(
      'title' => '{LNG_size of} {LNG_Image}',
    ));
    // booking_w
    $fieldset->add('text', array(
      'id' => 'booking_w',
      'labelClass' => 'g-input icon-width',
      'itemClass' => 'item',
      'label' => '{LNG_Width}',
      'comment' => '{LNG_Image size is in pixels} ({LNG_resized automatically})',
      'value' => isset(self::$cfg->booking_w) ? self::$cfg->booking_w : 500,
    ));
    $fieldset = $form->add('fieldset', array(
      'class' => 'submit',
    ));
    // submit
    $fieldset->add('submit', array(
      'class' => 'button save large icon-save',
      'value' => '{LNG_Save}',
    ));

    return $form->render();
  }
}