import joinParams from '../utils/joinParams'

export default function getMoreData(params, pageName) {
  let url,
    getDataUrl,
    baseUrl,
    listContent,
    search,
    loadingImg = $('.J-loadingImg');

  if (pageName && pageName === 'orderList') {
    getDataUrl = $('#J-initOrderListUrl').val();
    listContent = $('.J-order-list');
  }

  if (pageName && pageName == 'wishlist') {
    getDataUrl = $('#J-initWishListUrl').val();
    listContent = $('.J-wishlist-list');
  }

  baseUrl = getDataUrl;
  search = joinParams(params);
  url = `${baseUrl}?${search}`;

  loadingImg.show();

  $.ajax({
    url: url,
    type: 'get',
    dataType: 'html',
    async: true,
    success: function (data) {
      listContent.html(data)
      loadingImg.hide()
      $('#resFlag').val('true')
    },
    error: function () {
      return false
    }
  })
}