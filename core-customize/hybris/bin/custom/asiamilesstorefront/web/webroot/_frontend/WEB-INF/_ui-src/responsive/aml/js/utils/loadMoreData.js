import getMoreData from './getMoreData'

function fetchOrder(isScroll) {
  let totalPage = $('#J-totalPage').val(),
    page = $('#J-getCurrentPage').val(),
    pageSize = $('#J-getCurrentPageSize').val(),
    brand = $('#J-q').val(),
    loadMoreBnt = $('J-loadMore');

  if (parseInt(page) >= parseInt(totalPage)) {
    loadMoreBnt.hide();
    return;
  }

  if (isScroll && page > 4) return;


  page++

  let params = {
    page: page,
    pageSize: pageSize,
    q: brand
  }

  getMoreData(params)
}

export default function loadMoreData(pageName) {
  // when scroll at bottom

  $(window).on('scroll', function () {
    let scrollTop = $(this).scrollTop(),
      scrollHeight = $(document).height(),
      windowHeight = $(this).height();
    if ( scrollHeight - windowHeight - scrollTop < 100) {
      let flag = $('#resFlag').val()
      if (flag === 'true') {
        $('#resFlag').val('false')
        fetchOrder(true)
      }
    }
  })

  // when click load more button
  $('body').unbind('click').on('click', '#J-loadMore', function () {
    let flag = $('#resFlag').val()
    if (flag) {
      $('#resFlag').val('false')
      fetchOrder(false, pageName)
    }

  })
}