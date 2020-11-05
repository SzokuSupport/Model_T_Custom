export default function pushData() {
  window.dataLayer = window.dataLayer || {}
  let arr = window.location.search.substring(1).split('&'),
    arrData,
    brandArr = [],
    sortby = [],
    keyword = [],
    categoryArr = [];
  for (let i = 0; i < arr.length; i++) {
    if (arr[i].indexOf('q=') !== -1) {
      arrData = arr[i].split(':')
    }
    if (arr[i].indexOf('sort=') !== -1) {
      sortby = arr[i].split('=')
    }
    if (arr[i].indexOf('text=') !== -1) {
      keyword = arr[i].split('=')
    }
  }
  if (arrData instanceof Array) {
    for (let i = 0; i < arrData.length; i++) {
      if (arrData[i].indexOf('brandName') !== -1) {
        brandArr.push(arrData[i + 1])
      }
      if (arrData[i].indexOf('categoryLevel') !== -1) {
        categoryArr.push(arrData[i] + '_' + arrData[i + 1])
      }
    }
  }
    
   
  window.dataLayer.product_category_filter = categoryArr.join('|');
  window.dataLayer.product_keyword_filter = keyword.length > 0 ? keyword[1] : '';
  window.dataLayer.product_brand_filter = brandArr.join('|');
  window.dataLayer.product_sortby_filter = sortby.length > 0 ? sortby[1] : 'onlineDate-desc';
}