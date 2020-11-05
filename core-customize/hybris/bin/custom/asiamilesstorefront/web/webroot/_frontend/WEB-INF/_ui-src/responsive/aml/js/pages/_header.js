/*
 * call svg for ie
 * */
import isIESvg from '../utils/isIESvg'
import isIEImg from '../utils/isIEImg'
import lazyloadNew from '../modules/pics/lazyloadNew'
import showSearch from '../utils/showSearch'

/*
 ** drop down in sort-by component
 */
import isDropdown from '../utils/isDropdown';
import deliverAndlanguage from '../modules/header/deliverAndlanguage'
import applyDeliverLanguageURL from '../modules/header/applyDeliverLanguageURL'
import logoutMobile from '../modules/header/logoutMobile'
import navigation from '../modules/common/navigation'
import initDeliveryZone from '../modules/header/initDeliveryZone'
import livechat from '../modules/common/livechat'
import getDevice from '../modules/common/getDevice'
import dataLayer from '../modules/common/dataLayer'
import keepalive from '../modules/common/keepalive'
import skipContent from '../modules/common/skipContent'
import replaceNavigationUrl from '../modules/common/replaceUrl'


$(function () {
  skipContent()
  isIESvg()
  isIEImg()
  livechat()
  lazyloadNew()
  showSearch();
  isDropdown()
  deliverAndlanguage()
  getDevice()
  dataLayer()
  applyDeliverLanguageURL()
  logoutMobile()
  initDeliveryZone()
  navigation('.J-navigation__tablet')
  keepalive()
  replaceNavigationUrl()
  $(window).resize(function () {
    navigation('.J-navigation__tablet');
    livechat();
  })
  // when asm show ,use is js
  $(window).on('scroll', function () {
    if ($('#_asm').length > 0) {
      if ($(this).scrollTop() > 10) {
        $('.content-fixed').addClass('asm-fixed');
      } else {
        $('.content-fixed').removeClass('asm-fixed');
      }
    }
  })
});