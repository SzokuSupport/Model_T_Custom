// popup
import isLargeScreen from '../../utils/isLargeScreen'
import isTabEnter from '../../utils/isTabEnter';

export default function bubblingStatic(selector) {
  $(selector).each(function () {
    let $bubbling = $(this).find('.bubbling-static');
    let $bubblingIcon = $(this).find('.J-bubbling-static-icon');

    if (isLargeScreen()) {
      $bubblingIcon.hover(function () {
        $bubbling.show();
      }, function () {
        $bubbling.hide();
      });
      $bubblingIcon.on('focus', function () {
        $bubbling.show();
      });
      $bubblingIcon.on('blur', function () {
        $bubbling.hide();
      })
    } else {
      $bubblingIcon.on('click', function () {
        $bubbling.toggle();
      });
      isTabEnter(null, function () {
        $bubbling.toggle();
      }, $bubblingIcon);
    }
  });
}