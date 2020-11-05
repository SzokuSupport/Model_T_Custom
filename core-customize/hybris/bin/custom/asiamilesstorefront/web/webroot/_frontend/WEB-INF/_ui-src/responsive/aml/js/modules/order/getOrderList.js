import joinParams from '../../utils/joinParams'
import masonry from './masonry'
import isIESvg from '../../utils/isIESvg'

/*
 * 1.Get each page of data
 */

export default function getOrderList( params) {
  let url,
    orderListUrl = $('#J-initOrderListUrl').val(),
    baseUrl,
    orderList = $('.J-order-list'),
    search,
    loadingImg = $('.J-loadingImg'),
    totalPage = $('#J-totalPage').val();

  baseUrl = orderListUrl;
  search = joinParams(params);
  url = `${baseUrl}?${search}`;

  // show  loading  image
  loadingImg.show();

  $.ajax({
    url: url,
    type: 'get',
    dataType: 'html',
    async: true,
    success: function (data) {
      orderList.append(data);
      isIESvg()
      if (params.page < 1) {
        $('#resFlag').val('true');
      } else {
        $('#resFlag').val('false');
      }
      if (params.page == totalPage - 1 ) {
        $('#J-loadMore').hide();
      }
      loadingImg.hide();
      $('#J-getCurrentPage').val(params.page);
      masonry()
      // AA  datalayer update
      window.dataLayer = window.dataLayer || {}
      let arr = []
      for (let i = 0; i < $('.J-item-list').length; i++) {
        let obj = {}
        obj.order_date = $('.J-order-date').eq(i).text() ? $('.J-order-date').eq(i).text() : ''
        obj.order_number = $('.J-order-number').eq(i).text() ? $('.J-order-number').eq(i).text() : ''
        obj.order_value_total_cash = $('.J-total-cash').eq(i).text() ? $('.J-total-cash').eq(i).text() : ''
        obj.order_value_total_miles = $('.J-total-miles').eq(i).text() ? $('.J-total-miles').eq(i).text() : ''
        arr.push(obj)
      }
      window.dataLayer.orders = arr
    },
    error: function () {
      return false
    }
  })
}