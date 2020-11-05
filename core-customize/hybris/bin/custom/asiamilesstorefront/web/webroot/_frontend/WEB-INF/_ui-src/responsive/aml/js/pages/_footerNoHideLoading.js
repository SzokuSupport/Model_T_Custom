import cookie from '../modules/common/cookie'
import cookieConsentBar from '../modules/common/cookieConsentBar'
import footerMenuItems from './_footerMenuItems'

$(function () {
  //  first visit cookie
  cookie('footer');
  // cookie consent bar
  cookieConsentBar();

  footerMenuItems();
});