import isTabEnter from '../../utils/isTabEnter'
export default function skipContent() {
  let $skip = $('#skipContent');
  $skip.on('focus', function () {
    $(this).css({'opacity': '1', 'zIndex': '11'})
  });
  $skip.on('blur', function () {
    $(this).css({'opacity': '0', 'zIndex': '9'})
  });
  $skip.on('click', function () {
    let $content = $('.J-topBanner').length > 0 ? ($('.J-topBanner').find('.slick-current').find('.content').length > 0 ?
      $('.J-topBanner').find('.slick-current').find('.content').eq(0) : $('.content').eq(0) ) :
      $('.content').eq(0);
    $content.focus()
  });
  isTabEnter('#skipContent', function () {
    $(this).trigger('click')
  })
}