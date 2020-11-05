import isSmallScreen from '../../utils/isSmallScreen'
import isMediumScreen from '../../utils/isMediumScreen'
import isLargeScreen from '../../utils/isLargeScreen'
import isIESvg from '../../utils/isIESvg'
import isIEImg from '../../utils/isIEImg'

export default function init() {
  // sort style
  let sortWidth = $('.J-plpSort').width();
  let sortByWidth = $('.J-plpSort').find('.sort-by').width();
  $('.J-plpSort').find('.sort-dropdown').css('width', `${sortWidth - sortByWidth}`);
  // event_value
  let value = $('.J-plpSort').find('.dropdown-selected-text').text()
  $('.J-plpSort').attr('event_value', `Sort By:${value}`)
  let url,
    pageSize,
    baseUrl = $('#J-initProductUrl').val(),
    $productList = $('.J-product-list')

  if (isSmallScreen()) {
    pageSize = 8
  }

  if (isMediumScreen()) {
    pageSize = 6
  }

  if (isLargeScreen()) {
    pageSize = 9
  }

  let url_from = location.search; // 获取url中"?"符后的字串
  if (url_from.indexOf('?') != -1) {
    let str = url_from.substr(1);
    if (str.indexOf('page=') !== -1) {
      str = str.substring(0, 5) + '0' + str.substring(str.indexOf('&'))
    } else {
      str = 'page=0&pageSize=' + pageSize + '&' + str
    }
    url = `${baseUrl}?${str}`
  } else {
    url = `${baseUrl}?page=0&pageSize=${pageSize}`
  }

  // flag  control request and response
  let flag = $('#resFlag').val()
  if (flag === 'true') {
    $('#resFlag').val('false')
    $.ajax({
      url: url,
      type: 'get',
      dataType: 'html',
      async: true,
      success: function success(data) {
        $productList.html(data);
        isIESvg()
        isIEImg()
        $('#resFlag').val('true')
      },
      error: function error(data) {
        console.log(data, 'error');

      }
    })
  }
}