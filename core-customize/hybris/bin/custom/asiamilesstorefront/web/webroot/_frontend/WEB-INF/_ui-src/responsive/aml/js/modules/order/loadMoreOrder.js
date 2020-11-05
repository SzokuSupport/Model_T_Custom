import getOrderList from './getOrderList'

function fetchOrder(isScroll) {
  let totalPage = $('#J-totalPage').val(),
    page = $('#J-getCurrentPage').val(),
    pageSize = $('#J-getCurrentPageSize').val(),
    loadMoreBnt = $('#J-loadMore');

  // hide load more button

  if (parseInt(page) >= parseInt(totalPage)) {
    loadMoreBnt.hide();
    return;
  }

  page++;

  let params = {
    page: page,
    pageSize: pageSize
  }


  // show  load more  button

  if (isScroll && (parseInt(page) + 1) >= 2 && parseInt(totalPage) > 2) {
    loadMoreBnt.show();
    $('#resFlag').val('false')
  }

  //   get  data
  getOrderList(params)
}

export default function loadMoreOrder() {
  // when scroll at bottom

  $(window).on('scroll', function () {
    let scrollTop = $(this).scrollTop(),
      scrollHeight = $(document).height(),
      windowHeight = $(this).height();
    if ( scrollHeight - windowHeight - scrollTop < 100) {
      let flag = $('#resFlag').val();
      if (flag === 'true') {
        $('#resFlag').val('false');
        fetchOrder(true)
      }
    }
  })

  // when click load more button
  $('body').unbind('click').on('click', '#J-loadMore', function () {
    let flag = $('#resFlag').val();
    if (flag) {
      $('#resFlag').val('false');
      fetchOrder(false)
    }

  })
}