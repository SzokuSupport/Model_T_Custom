import init from '../modules/checkOut/init'
import radioSelect from '../modules/checkOut/radioSelect'

function initEarnMilesDetailsCollapse() {
  let $selectorEarnMilesDetailsCollapse = $('.J-expand-earn-miles-details'),
    $selectorEarnMilesDetailsWrapper = $('.J-earn-miles-content-details-wrapper'),
    $selectorEarnMilesTitleTotalWrapper = $('.J-earn-miles-title-total-wrapper');
  $selectorEarnMilesDetailsCollapse.on('click', function () {
    if ($selectorEarnMilesDetailsWrapper.hasClass('earn-miles-content-details-wrapper--hide')) {
      $selectorEarnMilesTitleTotalWrapper.css('visibility', 'hidden');
      $selectorEarnMilesDetailsCollapse.addClass('icon-dropdown--open');
      $selectorEarnMilesDetailsWrapper.removeClass('earn-miles-content-details-wrapper--hide');
    } else {
      $selectorEarnMilesTitleTotalWrapper.css('visibility', 'visible');
      $selectorEarnMilesDetailsCollapse.removeClass('icon-dropdown--open');
      $selectorEarnMilesDetailsWrapper.addClass('earn-miles-content-details-wrapper--hide');
    }
  })
}

$(document).ready(function () {
  init();
  radioSelect('.J-radio-item');

  initEarnMilesDetailsCollapse();
})