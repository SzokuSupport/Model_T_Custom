import cookie from '../modules/common/cookie'
import cookieConsentBar from '../modules/common/cookieConsentBar'
import hideLoading from '../utils/hideLoading'
import footerMenuItems from './_footerMenuItems'

$(function () {
  // hide loading img
  hideLoading('.J-loading-overLayout')
  //  first visit cookie
  cookie('footer');
  // cookie consent bar
  cookieConsentBar();

  footerMenuItems();
});