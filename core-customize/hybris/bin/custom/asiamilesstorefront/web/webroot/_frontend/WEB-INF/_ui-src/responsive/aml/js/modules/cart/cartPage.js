/**
 * optimized
 * level 1
 * @description cartpage ajax call
 * usage:
 *
 * @param {string} selector
 * selector:
 * $('.cartPage')
 *
 * */

import cartMileCashSlider from './cartMilesSlide';
import initCart from './initCart';
import isTabEnter from '../../utils/isTabEnter';

export default function cartPage() {

  let $mpcSliderMask = $('.mpc-slider-mask'),
    $mpcSlider = $('.mpc-slider'),
    height = $mpcSlider.length > 0 ? $mpcSlider[0].offsetHeight + 'px' : '0px'
  $mpcSliderMask.css('height', height);

  // reduce item
  $('.cartPage').on('click', '.J-lowerButton', function () {
    let $this = $(this),
      url = $this.data('url'),
      entryNumber = $this.siblings('.J-entryNumber').data('entrynumber'),
      quantity = $this.siblings('.J-entryNumber').text(),
        productCode = $this.siblings('.J-productCode').text()
    _changeQuantity(entryNumber, url, parseInt(quantity) - 1),
        ACC.track.trackUpdateCart(productCode, parseInt(quantity), parseInt(quantity) - 1)
  })
  // Add to item
  $('.cartPage').on('click', '.J-plusButton', function () {
    let $this = $(this),
      url = $this.data('url'),
      entryNumber = $this.siblings('.J-entryNumber').data('entrynumber'),
      quantity = $this.siblings('.J-entryNumber').text(),
        productCode = $this.siblings('.J-productCode').text()
    _changeQuantity(entryNumber, url, parseInt(quantity) + 1),
        ACC.track.trackUpdateCart(productCode, parseInt(quantity), parseInt(quantity) + 1)
  })

  // remove cart item
  $(document).on('click', '.J-remove-cartItem', function () {
    let $this = $(this),
      url = $this.data('url'),
        quantity = $this.siblings('.J-entryNumber').text(),
        productCode = $this.siblings('.J-productCode').text();
    _removeItem(url),
        ACC.track.trackRemoveFromCart(productCode, parseInt(quantity));
  })

  initCart()

  $(document).on('click', '.J-cart-agree', function () {
    let flag = $(this).is(':checked')
    if (!flag) {
      $('.J-go-to-checkOut').addClass('disabled')
      $('.J-go-to-checkOut').prop('disabled', true)
      $('.J-agreeCheckbox').attr('aria-label', $.trim($('.J-agreeForm').text()) + '- checkbox Not checked.')
    } else {
      $('.J-agreeCheckbox').attr('aria-label', $.trim($('.J-agreeForm').text()) + '- checkbox checked.')
      if ($('.cartPage-error').length === 0) {
        $('.J-go-to-checkOut').removeClass('disabled')
        $('.J-go-to-checkOut').prop('disabled', false)
      } else {
        $('.J-go-to-checkOut').addClass('disabled')
        $('.J-go-to-checkOut').prop('disabled', true)
      }
    }
    // flag = !flag
  })
  // keypress Enter agreeCheckbox event
  isTabEnter('.J-agreeCheckbox', function () {
    $('.J-cart-agree').trigger('click');
  })

  $(document).on('click', '.J-remove-code', function () {
    let code = $(this).data('code'),
      url = $(this).data('url');
    promo(url, code)
  })

  $(document).on('keypress', '#promo-code', function (event) {
    let code = $(this).val(),
      url = $('.J-add-promo').data('url'),
      flag = $('.J-add-promo').attr('flag');

    if (event.keyCode == '13' && flag === 'true' && code) {
      // event.preventDefault();
      promo(url, code, flag)
    }
    return
  })

  // add promo code
  $(document).on('click', '.J-add-promo', function () {
    let code = $('#promo-code').val(),
      url = $(this).data('url'),
      removeUrl = $(this).data('remove-url'),
      flag = $(this).find('.J-icon-add').hasClass('disappear'),
      removeFlag = $(this).data('remove-code');

    if (flag) {
      if (removeFlag) {
        promo(removeUrl, code, flag)
        return
      }
      $('#promo-code').val('')
      $('.J-input-placeholder').css({'fontSize': '16px', 'top': '20px'})
      $('.J-warnning-promo').hide()
      $('.J-icon-close').addClass('disappear')
      $('.J-icon-add').removeClass('disappear')
      $('.J-add-promo').attr('flag', 'true')
      $('#promo-code').prop('disabled', false)
      return
    } else {
      if (!code) {
        return
      }
      promo(url, code, flag)

    }

  })

  $(document).on('click', '.J-go-to-checkOut', function () {
    let url = $(this).data('url')
    window.location.href = url
  })

  _removeAlertMessage()
}

// Send requests when the quantity of goods changes
function _changeQuantity(entryNumber, url, quantity) {
  $.ajax({
    type: 'POST',
    url: url,
    data: {
      'entryNumber': entryNumber,
      'CSRFToken': ACC.config.CSRFToken,
      'quantity': quantity
    },
    dataType: 'html',
    async: true,
    success: function (data) {
      if (data && data[0] === '{') {
        data = JSON.parse(data);
        if (data.code && data.code === 9999) {
          window.location.href = data.redirectUrl;
          return;
        }
      }

      $('.cartPage').html(data);
      initCart()
      cartMileCashSlider();
    },
    error: function () {
      return false
    }
  });
}

// Delete selected items
function _removeItem(url) {
  $.ajax({
    type: 'POST',
    url: url,
    data: {
      'CSRFToken': ACC.config.CSRFToken,
    },
    dataType: 'html',
    async: true,
    success: function (data) {
      $('.cartPage').html(data);
      initCart()
      cartMileCashSlider();
    },
    error: function () {
      return false
    }
  });
}
// del success show message
function _removeAlertMessage() {
  let $cartPageError = $('.cartPage-error'),
    $cartPageAlert = $('.cartPage-alert');

  $('.cartPage').on('click', '.J-removeAlertMessage', function () {
    if ($cartPageError.length || $cartPageAlert.length) {
      $('.cartPage-removed').remove()
    } else {
      $('.cartPage-error-message').remove()
    }
  })
  // enter key event tracking
  $('.cartPage').bind('keypress', '.J-removeAlertMessage', function (e) {
    if (e.keyCode == '13') {
      if ($cartPageError.length || $cartPageAlert.length) {
        $('.cartPage-removed').remove()
      } else {
        $('.cartPage-error-message').remove()
      }
    }
  })
}


function promo(url, code) {
  $.ajax({
    method: 'post',
    url: url,
    data: {
      'CSRFToken': ACC.config.CSRFToken,
      'voucherCode': code,
    },
    dataType: 'html',
    success: function (data) {
      if (data && data[0] === '{') {
        data = JSON.parse(data);
        if (data.code && data.code === 9999) {
          window.location.href = data.redirectUrl;
          return;
        }
      }

      $('.cartPage').html(data);
      initCart(code)
      cartMileCashSlider();
    },
    error: function () {
      return false
    }
  })
}
