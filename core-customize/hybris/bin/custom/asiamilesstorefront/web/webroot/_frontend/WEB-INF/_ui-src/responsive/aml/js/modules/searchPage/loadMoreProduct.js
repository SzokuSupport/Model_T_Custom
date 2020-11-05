import getProductList from './getProductList'

function fetchProduct(isScroll) {
  let totalPage = $('#J-totalPage').val(),
    page = $('#J-getCurrentPage').val(),
    pageSize = $('#J-getCurrentPageSize').val(),
    brand = $('#J-q').val(),
    sort = $('#J-sort').val()

  // load more than total page , scroll event lose efficacy
  if (parseInt(page) >= parseInt(totalPage)) return

  // load more than 5 , scroll event lose efficacy
  if (isScroll && page > 5) return

  // url params json
  let params = {
    page: page,
    pageSize: pageSize,
    q: brand,
    sort: sort,
  }

  getProductList(true, params)
}

export default function loadMoreProduct() {
  // when scroll at bottom

  $(window).on('scroll', function () {
    let scrollTop = $(this).scrollTop(),
      scrollHeight = $(document).height(),
      windowHeight = $(this).height(),
      footerHeight = $('footer').height();
    if (scrollHeight - windowHeight - scrollTop < (100 + footerHeight)) {
      let flag = $('#resFlag').val()
      if (flag === 'true') {
        $('#resFlag').val('false')
        fetchProduct(true)
      }
    }
  })

  // when click load more button
  $('body').unbind('click').on('click', '#J-loadMore', function () {
    let flag = $('#resFlag').val()
    if (flag) {
      $('#resFlag').val('false')
      fetchProduct(false)
    }

  })
}