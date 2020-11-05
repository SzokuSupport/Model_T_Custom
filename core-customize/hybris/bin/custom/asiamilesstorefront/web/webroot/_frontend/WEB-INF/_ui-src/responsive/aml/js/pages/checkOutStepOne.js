import './_header'
import './_footer'

import inputFocus from '../modules/checkOut/InputFocus'
import localToggle from '../modules/checkOut/localToggle'
import expand from '../modules/checkOut/expand'
import navPopup from '../modules/checkOut/navPopup'
import countryCode from '../modules/checkOut/countryCode'
import need from '../modules/checkOut/need'
import removeMenu from '../modules/common/removeMenu'


$(function () {
  removeMenu()
  expand('.J-detail');
  inputFocus('.J-input-transform');
  localToggle('.J-toggle-local');
  navPopup('.J-step-one-show');
  countryCode();
  need();
});

