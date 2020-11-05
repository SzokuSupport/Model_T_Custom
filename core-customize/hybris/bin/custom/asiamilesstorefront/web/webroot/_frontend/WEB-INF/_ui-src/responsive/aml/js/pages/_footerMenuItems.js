import { getCookie } from '../modules/common/cookieUtils'

export default function footerMenuItems() {
  let $footerMenuItems = $('.J-footer-menu-items');
  const currentCountryCode = $footerMenuItems.data('currentCountryCode');
  // window.console.log('currentCountryCode: ', currentCountryCode);

  const geoLocation = getCookie('geoLocation');
  // window.console.log('cookie "geoLocation": ', geoLocation);

  $footerMenuItems.children().each(function () {
    const countryList = $(this).data('countryList');
    const geolocationList = $(this).data('geolocationList');
    // window.console.log('countryList: ', countryList);
    // window.console.log('geolocationList: ', geolocationList);

    if (countryList && !geolocationList) {
      const countryListArr = countryList.split(',');
      if (countryListArr.indexOf(currentCountryCode) === -1) {
        $(this).remove();
      }
    } else if (!countryList && geolocationList) {
      const geolocationListArr = geolocationList.split(',');
      if (!geoLocation || geolocationListArr.indexOf(geoLocation) === -1) {
        $(this).remove();
      }
    } else if (countryList && geolocationList) {
      const countryListArr = countryList.split(',');
      const geolocationListArr = geolocationList.split(',');
      if (
        (countryListArr.indexOf(currentCountryCode) === -1)
        || (!geoLocation || geolocationListArr.indexOf(geoLocation) === -1)
      ) {
        $(this).remove();
      }
    }
  });
}
