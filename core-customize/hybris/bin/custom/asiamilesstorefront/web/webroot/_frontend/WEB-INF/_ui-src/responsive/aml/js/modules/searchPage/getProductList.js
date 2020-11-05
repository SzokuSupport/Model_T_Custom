import joinParams from '../../utils/joinParams'
import isIESvg from '../../utils/isIESvg'
import isIEImg from '../../utils/isIEImg'
export default function getProductList(onlyGetProductList, params) {
  let url,
    productListUrl = $('#J-initProductUrl').val(),
    filterProductUrl = $('#J-filterProductUrl').val(),
    baseUrl,
    productList = $('.J-product-list'),
    plpMainContent = $('.J-plp-main-content'),
    search,
    loadingImg = $('.J-loadingImg');

  baseUrl = onlyGetProductList ? productListUrl : filterProductUrl;
  search = joinParams(params);
  url = `${baseUrl}?${search}`;

  if (!onlyGetProductList) {
    window.location.href = url;
    return false;
  }
  loadingImg.show();

  $.ajax({
    url: url,
    type: 'get',
    dataType: 'html',
    async: true,
    success: function (data) {
      onlyGetProductList ? productList.html(data) : plpMainContent.html(data);
      isIESvg();
      isIEImg();
      loadingImg.hide();
      $('#resFlag').val('true')
    },
    // error: function (data) {
    //   console.log(data, 'error')
    // }
  })
}