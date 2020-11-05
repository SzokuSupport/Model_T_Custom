import isSmallScreen from '../../utils/isSmallScreen';

function _closePopup(selectorClosePopup) {
  let $overLayout = $('.J-overlayout')

  $overLayout.find(selectorClosePopup).on('click', function () {
    $('html,body').removeClass('ovfHiden');
    
    if (isSmallScreen()) {
      $overLayout.slideUp(300)
    } else {
      $overLayout.removeClass('active')
    }
  })
}

function popup($targetShowPopup, selectorPopupContentElement, selectorClosePopup, callback) {
  let $overLayout = $('.J-overlayout');

  $targetShowPopup.on('click', function (event) {
    event.preventDefault()
    event.stopPropagation()

    let data = $(selectorPopupContentElement).length > 0 ? $(selectorPopupContentElement).eq(0).prop('outerHTML') : '';
    
    if (data) {
      $overLayout.html(data)
      $overLayout.find(selectorPopupContentElement).length === 1 ? $overLayout.find(selectorPopupContentElement).removeClass('disappear') : '';
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

function bonusMilesMultiplePopups(selectorBtns) {
  $(selectorBtns).each(function () {
    let correspondingPopupContentIdSelector = '#' + $(this).attr('data-popup-content-id');
    let correspondingCloseBtnIdSelector = '#' + $(this).attr('data-popup-close-btn-id');
    
    popup(
      $(this),
      correspondingPopupContentIdSelector,
      correspondingCloseBtnIdSelector
    )
  });
}

export default bonusMilesMultiplePopups
