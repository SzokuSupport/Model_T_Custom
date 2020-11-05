import '../../plugins/jQuery.nstSlider'
import formatPrice from '../../utils/formatPrice'
import decimalAdjust from '../../utils/decimalAdjust'

export default function mileCashSlider() {

  let $selectorMileCashSlider = $('.J-mile-cash-slider'),
    $selectorMileReminder = $('.J-miles-reminder'),
    $selectorInputMiles = $('.J-input-miles'),
    $selectorSliderPrice = $('.J-mile-cash-slider-price'),
    $selectorTotalMilesToEarn = $('.J-total-miles-to-earn'),
    rate = $selectorMileCashSlider.attr('data-rate'),
    earnMilesRate = $selectorMileCashSlider.attr('data-earn_miles_rate'),
    currency = $('.J-mile-cash-slider-currency').text(),
    inputMileValue;

  $('.leftGrip').attr('tabindex', '-1'),
  $('.rightGrip').attr('tabindex', '-1'),
  $selectorMileCashSlider.nstSlider({
    'left_grip_selector': '.leftGrip',
    'right_grip_selector': '.rightGrip',
    'value_bar_selector': '.bar',
    'crossable_handles': false,
    'value_changed_callback': function (cause, leftValue, rightValue) {
      $('.J-input-miles').val(-rightValue);
      let cashSpending = (rightValue - leftValue) * rate;
      let milesToEarn = decimalAdjust('floor', cashSpending / earnMilesRate, 0);
      // window.console.log('rightValue:', rightValue, '; leftValue:', leftValue);
      // window.console.log('cashSpending:', cashSpending, '; milesToEarn:', milesToEarn);
      if (cashSpending > 0) {
        $('.J-no-offers').addClass('J-no-offers--hide');
        $('.J-earn-miles-offer').removeClass('J-earn-miles-offer--hide');
      } else {
        $('.J-no-offers').removeClass('J-no-offers--hide');
        $('.J-earn-miles-offer').addClass('J-earn-miles-offer--hide');
      }
      $selectorSliderPrice.text(formatPrice(cashSpending, currency));
      $selectorTotalMilesToEarn.text(formatPrice(milesToEarn, currency, 0));
      window.dataLayer.Product_miles = -rightValue
      $(this).attr('event_value', -rightValue)
    },
  })

  $selectorInputMiles.on('blur', function () {
    if (parseInt($(this).val()) < parseInt($('.J-miles-min').text())) {
      $selectorMileReminder.css('display', 'block')
    } else {
      $selectorMileReminder.css('display', 'none')
    }
    // check if input value is digital, if not, empty input and return false
    if (!(/[\d]/.test($('.J-input-miles').val()))) {
      $('.J-input-miles').val('')
      return false
    }
    let min = $(this).attr('min'),
      max = $(this).attr('max');
    // set mile slider position and price according to input value
    inputMileValue = $('.J-input-miles').val();
    if (inputMileValue - max > 0 ) {
      $('.J-input-miles').val(max)
      inputMileValue = max
    }
    if (inputMileValue - min < 0 ) {
      $('.J-input-miles').val(min)
      inputMileValue = min
    }
    let maxMile = $selectorMileCashSlider.nstSlider('get_range_min');
    $selectorMileCashSlider.nstSlider('set_position', maxMile, -inputMileValue /* min */ );
    let cashSpending = (-inputMileValue - maxMile) * rate;
    let milesToEarn = decimalAdjust('floor', cashSpending / earnMilesRate, 0);
    // window.console.log('rightValue:', rightValue, '; leftValue:', leftValue);
    // window.console.log('cashSpending:', cashSpending, '; milesToEarn:', milesToEarn);
    if (cashSpending > 0) {
      $('.J-no-offers').addClass('J-no-offers--hide');
      $('.J-earn-miles-offer').removeClass('J-earn-miles-offer--hide');
    } else {
      $('.J-no-offers').removeClass('J-no-offers--hide');
      $('.J-earn-miles-offer').addClass('J-earn-miles-offer--hide');
    }
    $selectorSliderPrice.text(formatPrice(cashSpending, currency));
    $selectorTotalMilesToEarn.text(formatPrice(milesToEarn, currency, 0));
    window.dataLayer.Product_miles = $('.J-input-miles').val()
    $('.J-mile-cash-slider').attr('event_value', inputMileValue)
  }).on('keypress', function (e) {
    // validate input value when pressing
    if (!String.fromCharCode(e.keyCode).match(/[\d]/)) {
      return false;
    }
  })

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