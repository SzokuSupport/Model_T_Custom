import isSmallScreen from '../../utils/isSmallScreen'

export default function navPopup(className) {
  if (isSmallScreen()) {
    let $overLayout = $('.J-overlayout');
    $(className).on('click', function () {
      let data = $(this).siblings('.J-nav-popup-mobile').html()
      $overLayout.html(data)
      $('html,body').addClass('ovfHiden');
      $overLayout.slideDown(300)
    })
    $(document).on('click', '.J-close-tooltip', function () {
      $('html,body').removeClass('ovfHiden');
      $overLayout.slideUp(300, function () {
        $overLayout.html('')
      })
    })
  }
}