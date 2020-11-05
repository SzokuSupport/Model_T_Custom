import validate from './validate';
import error from './error';
import isTabEnter from '../../utils/isTabEnter'

export default function init() {
  let $mySelf = $('#mySelf'),
    $other = $('#other'),
    type = $('#formType').val(),
    $radio = $('.J-radio-item');
    // Add different states depending on the type
  if (type === 'self') {
    $radio.removeClass('selected');
    $radio.eq(0).addClass('selected');
    $mySelf.show();
    $other.hide();
    validate('#mySelf');
    error('#mySelf');
  } else {
    $radio.removeClass('selected');
    $radio.eq(1).addClass('selected');
    $mySelf.hide();
    $other.show();
    validate('#other');
    error('#other');
  }
  isTabEnter('.J-radio-item', function () {
    $(this).trigger('click')
  })
}