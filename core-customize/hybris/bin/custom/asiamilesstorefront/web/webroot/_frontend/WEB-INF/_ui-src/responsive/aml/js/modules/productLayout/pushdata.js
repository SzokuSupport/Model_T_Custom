// adobe analysis datalayer date
import '../../plugins/jQuery.nstSlider'
import mileCashSlider from './mileCashSlider'
import isSmallScreen from '../../utils/isSmallScreen'

export default function pushData() {
  let $mileSlider = $('.J-mile-cash-slider'),
    $mileInput = $('.J-input-miles'),
    maxMile = $mileSlider.attr('data-range_min'),
    minMile = $mileSlider.attr('data-range_max');
  window.dataLayer = window.dataLayer || {}
  //  get datalayer variance
  if ($('.J-variance-color').length > 0) {
    let color = $.trim($('.J-variance-color').text()).split(':')
    window.dataLayer.product_variance1 = color[0] + ':' + color[1]
    window.dataLayer.product_variance2 = ''
    if ($('.J-variance')) {
      let varianceValue = $.trim($('.J-variance').eq(0).text()),
        varianceType = $.trim($('.J-variance').eq(0).parent().siblings('.dropdown-label').text());
      window.dataLayer.product_variance2 = varianceType + ':' + varianceValue
    }
  } else if ($('.J-variance').length === 1) {
    let varianceValue = $.trim($('.J-variance').eq(0).text()),
      varianceType = $.trim($('.J-variance').eq(0).parent().siblings('.dropdown-label').text());
    window.dataLayer.product_variance1 = `${varianceType}:${varianceValue}`
    window.dataLayer.product_variance2 = ''
  } else if ($('.J-variance').length === 2) {
    let varianceValue1 = $.trim($('.J-variance').eq(0).text()),
      varianceType1 = $.trim($('.J-variance').eq(0).parent().siblings('.dropdown-label').text()),
      varianceValue2 = $.trim($('.J-variance').eq(1).text()),
      varianceType2 = $.trim($('.J-variance').eq(1).parent().siblings('.dropdown-label').text());
    window.dataLayer.product_variance1 = `${varianceType1}:${varianceValue1}`
    window.dataLayer.product_variance2 = `${varianceType2}:${varianceValue2}`
  } else {
    window.dataLayer.product_variance1 = ''
    window.dataLayer.product_variance2 = ''
  }
  // datalayer quantity change
  if (isSmallScreen()) {
    $('#J-quantity').find('.J-selectedControlMobile').on('change', function () {
      let quantity = $.trim($(this).find('option:selected').text())
      window.dataLayer.product_quantity = quantity
      $mileSlider.nstSlider('set_range', maxMile * quantity, minMile * quantity);
      $mileSlider.nstSlider('set_position', maxMile * quantity, maxMile * quantity);
      $mileInput.attr('min', -minMile * quantity);
      $mileInput.attr('max', -maxMile * quantity);
      $('.J-miles-min').text(-minMile * quantity);
    })
  } else {
    $('#J-quantity').on('click', '.option', function () {
      let quantity = $.trim($(this).text());
      window.dataLayer.product_quantity = quantity;
      $mileSlider.nstSlider('set_range', maxMile * quantity, minMile * quantity);
      $mileSlider.nstSlider('set_position', maxMile * quantity, maxMile * quantity);
      $mileInput.attr('min', -minMile * quantity);
      $mileInput.attr('max', -maxMile * quantity);
      $('.J-miles-min').text(-minMile * quantity);
    })
  }
  // $(".product-img").on("click", ".slick-slide", slickSlideClickEvent);
  // isTabEnter('.product-img', slickSlideClickEvent);
}
