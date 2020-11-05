import isSmallScreen from '../../utils/isSmallScreen';
import isTabEnter from '../../utils/isTabEnter';

export default function shareThis() {
  let $shareThis = $('.J-shareThis'),
    $shareBar = $('.J-share-bar'),
    $shareClose = $('.J-share-close'),
    $overLayout = $('.J-share-bar-overLayout')
  
  //  share bar display
  let shareThisClickEvent = function () {
    $shareBar.slideDown(300);
    if (isSmallScreen()) {
      $overLayout.addClass('active');
    }
  }
  // mouseover event
  $shareThis.on('mouseover', shareThisClickEvent);
  // keydown event enter
  isTabEnter('.J-shareThis', shareThisClickEvent);
  // share bar hide
  let shareCloseClickEvent = function () {
    $shareBar.slideUp(300);

    if (isSmallScreen()) {
      setTimeout(function () {
        $overLayout.removeClass('active')
      }, 300)
    }
  }
  // close icon click event
  $shareClose.on('click', shareCloseClickEvent);
  // close icon keydown event enter
  isTabEnter('.J-share-close', shareCloseClickEvent);
}