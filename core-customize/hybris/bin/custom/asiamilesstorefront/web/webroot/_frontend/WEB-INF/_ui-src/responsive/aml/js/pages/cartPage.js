import './_header'
import './_footer'

/*
* when fo
* */
import inputFocus from '../modules/checkOut/InputFocus'

/*
* remove cart item
* */

import popup from '../utils/popup';

import promotion from '../modules/cart/promotion'
import promotionMultiple from '../modules/cart/promotionMultiple'
import removeMenu from '../modules/common/removeMenu'
import bubbling from '../modules/common/bubbling'

$(function () {
  removeMenu()
  bubbling()
  inputFocus('.input-component');
  popup('.J-removeCartPopup', '.J-close-popup');
  popup('.J-show-discount', '.J-close-tooltip')
  promotion('.J-promo-popup', '.J-close-tooltip')

  promotionMultiple('.J-promo-popup-multiple');
});