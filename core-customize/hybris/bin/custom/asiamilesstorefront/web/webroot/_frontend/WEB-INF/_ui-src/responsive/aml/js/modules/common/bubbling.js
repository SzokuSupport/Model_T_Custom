// popup
import isLargeScreen from '../../utils/isLargeScreen'
import isTabEnter from '../../utils/isTabEnter';

export default function bubbling() {
  let $bubbling = $('.bubbling'),
    $beforeText = $('.J-bubbling-before'),
    $bubblingIcon = $('.J-bubbling-icon'),
    beforeLength = $beforeText.width(),
    left;
  if (isLargeScreen()) {
    let appendStr = "<style>.bubbling:before,:after{left:'0'}</style>"
    left = beforeLength - 10;
    $bubbling.append(appendStr);
    $bubbling.css('left', `${left}px`);
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
    left = beforeLength + 4;
    let appendStr = `<style>.bubbling:before,:after{left:${left}px}</style>`;
    $bubbling.append(appendStr);
    $bubblingIcon.on('click', function () {
      $bubbling.toggle();
    });
    isTabEnter('.J-bubbling-icon', function () {
      $bubbling.toggle();
    });
  }
}