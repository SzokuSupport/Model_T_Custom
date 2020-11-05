import inputFocus from '../checkOut/InputFocus'
import isIESvg from '../../utils/isIESvg'
import isIEImg from '../../utils/isIEImg'

export default function initCart(params) {
  // go to checkOut button disabled
  function addDisabled() {
    let flag = !$('.J-cart-agree').eq(0).is(':checked')
    if ($('.cartPage-error').length > 0 || flag) {
      $('.J-go-to-checkOut').addClass('disabled')
      $('.J-go-to-checkOut').prop('disabled', true)
    }
  }
  // change header cart quantity
  function _miniCartAddItems() {
    var $miniQuity = $('#miniQuity'),
      $headerCart = $('.J-header-cart'),
      num = $miniQuity.val() ? $miniQuity.val() > 99 ? '99+' : $miniQuity.val() : '0';
    $headerCart.length > 0 ? $headerCart[0].innerHTML = num : function () {
      return
    };
  }
  $('.J-agreeCheckbox').find('a').prop('tabindex', '0')
  $('.J-agreeCheckbox').attr('aria-label', $.trim($('.J-agreeForm').text()) + '- checkbox Not checked.')
  $('.J-agreeCheckbox').find('a').attr('aria-label', 'Asia Miles Terms & Conditions- link opens in a new window')
  $('.J-agreeCheckbox').focus(function () {
    $('.J-agreeForm').attr('aria-hidden', 'true')
  })
  $('.J-agreeCheckbox').blur(function () {
    $('.J-agreeForm').attr('aria-hidden', 'false')
  })
  addDisabled()
  _miniCartAddItems()
  inputFocus('.input-component')
  isIESvg()
  isIEImg()
  if (params) {
    if ($('.J-warnning-promo').length > 0) {
      $('.J-warnning-promo').find('span').focus()
    }
  }
}