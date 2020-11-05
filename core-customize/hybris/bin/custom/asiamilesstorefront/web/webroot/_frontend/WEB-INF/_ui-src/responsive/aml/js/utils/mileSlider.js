import '../plugins/jquery.nstSlider'
import formatPrice from './formatPrice'
import getProductList from '../modules/plp/getProductList'

export default function mileSlider() {
  $('.leftGrip').attr('tabindex', '-1'),
  $('.rightGrip').attr('tabindex', '-1'),
  $('.nstSlider').nstSlider({
    'left_grip_selector': '.leftGrip',
    'right_grip_selector': '.rightGrip',
    'value_bar_selector': '.bar',
    'crossable_handles': false,
    'value_changed_callback': function (cause, leftValue, rightValue) {
      $(this).parent().find('.mile-slider-label span').text(`${formatPrice(leftValue, 'none')} - ${formatPrice(rightValue, 'none')}`);
    },
    'user_mouseup_callback': function (vmin, vmax) { //
      let page = $('#J-getCurrentPage').val(),
        pageSize = $('#J-getCurrentPageSize').val(),
        brand = $('#J-q').val(),
        sort = $('#J-sort').val(),
        text = $('#J-text').val(),
        indexOfZonePrice = brand.indexOf('zonePrice')

      if (indexOfZonePrice !== -1) {
        let arr = brand.split(':'),
            index;
        for (let i = 0; i < arr.length; i++) {
          if (arr[i] === 'zonePrice') {
            index = i;
            arr[i + 1] = `${vmin}_${vmax}`
          }
        }
        if (!index) {
          arr.push('zonePrice')
          arr.push(`${vmin}_${vmax}`)
        }
        brand = arr.join(':')
      } else {
        brand = `${brand}:zonePrice:${vmin}_${vmax}`
      }
      
      let params = {
          page: page,
          pagesize: pageSize,
          q: brand,
          sort: sort,
          text: text,
        },
        paramsNoText = {
          page: page,
          pagesize: pageSize,
          q: brand,
          sort: sort
        }

      // get product data
      if ($('#J-text').length > 0) {
        getProductList(false, params)
      } else {
        getProductList(false, paramsNoText)
      }
    }
  })

  let min = $('.nstSlider').attr('data-range_min'),
    max = $('.nstSlider').attr('data-range_max')

  if (min === max) {
    $('.nstSlider > .bar').css('width', '100%')
    $('.nstSlider > .rightGrip').css('left', '100%')
  }
}