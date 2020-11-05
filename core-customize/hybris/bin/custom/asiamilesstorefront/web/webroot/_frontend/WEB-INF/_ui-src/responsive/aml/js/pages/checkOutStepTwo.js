import './_header'
import './_footer'

import navPopup from '../modules/checkOut/navPopup'
import inputFocus from '../modules/checkOut/InputFocus';
import countDown from '../modules/checkOut/countDown'
import sendCode from '../modules/checkOut/sendCode'
import verification from '../modules/checkOut/verification'
import removeMenu from '../modules/common/removeMenu'
import autoMargin from '../modules/common/autoMargin'

$(function () {
  removeMenu()
  inputFocus('.J-input-transform');
  navPopup('.J-step-two-show');
  countDown('.J-count-down');
  sendCode('.J-send-btn');
  verification()
  autoMargin('.step-two')
})