/**
* optimized @9 May, linda.zhu
* level 1
* @description product detail images zoom in slick
* usage:
*
* @param {string} selector
* selector:
* $('.J-zoomInImages')
*
* */


import isSmallScreen from '../../utils/isSmallScreen';

function _closePopup(selectorClosePopup) {
  let $selectorClosePopup = $(selectorClosePopup),
    $overLayout = $('.J-overlayout')

  $selectorClosePopup.on('click', function () {
    $('html,body').removeClass('ovfHiden');
    
    if (isSmallScreen()) {
      $overLayout.slideUp(300)
    } else {
      $overLayout.removeClass('active')
    }
  })
}

function popup(selectorShowPopup, selectorClosePopup, callback) {
  let $overLayout = $('.J-overlayout');

  $(document).on('click', selectorShowPopup, function (event) {
    event.preventDefault()
    event.stopPropagation()

    let data = $('.J-promotion-popup').length > 0 ? $('.J-promotion-popup').eq(0).prop('outerHTML') : '';

    if (data) {
      $overLayout.html(data)
      $overLayout.find('.J-promotion-popup').length === 1 ? $overLayout.find('.J-promotion-popup').removeClass('disappear') : '';
      $('html,body').addClass('ovfHiden')

      _closePopup(selectorClosePopup)

      if (callback) {
        callback();
      }


      // productImagesSlidesZoomIn()

      if (isSmallScreen()) {
        $overLayout.slideDown(300)
      } else {
        $overLayout.addClass('active')
      }
    }

    
  })
}

export default popup