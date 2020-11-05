import masonry from './masonry'
import isIESvg from '../../utils/isIESvg'

//  init order list data
export default function init() {
  let url,
    pageSize,
    baseUrl = $('#J-initOrderListUrl').val(),
    $orderList = $('.J-order-list');

  pageSize = 20

  let url_from = location.search; // 获取url中"?"符后的字串
  if (url_from.indexOf('?') != -1) {
    let str = url_from.substr(1);
    url = `${baseUrl}?page=0&${str}`
  } else {
    url = `${baseUrl}?page=0&pageSize=${pageSize}`
  }
  let flag = $('#resFlag').val();
  if (flag === 'true') {
    $('#resFlag').val('false');
    $.ajax({
      url: url,
      type: 'get',
      dataType: 'html',
      async: true,
      success: function success(data) {
        $orderList.html(data);
        isIESvg();
        $('#resFlag').val('true');
        masonry()
      },
      error: function error() {
        return false
      }
    })
  }
}