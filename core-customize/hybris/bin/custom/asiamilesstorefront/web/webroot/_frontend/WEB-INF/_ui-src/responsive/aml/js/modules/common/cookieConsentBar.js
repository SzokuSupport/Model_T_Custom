export default function cookieConsentBar() {
  let currentLanguage = $('#curentLanguage').val();

  /* Initiate cookie consent bar, set current language code as local */
  window.amlcc.initialize({
    locale: getLanguageCode(),
    checkLocation: false
  });

  /*
	* Get the current language code from page,
	* and transform it to corresponding code in cookie-consent-bar.js
	* set 'en' as default language code
	*/
  function getLanguageCode() {
    switch (currentLanguage) {
      case 'zh':
        currentLanguage = 'sc';
        break;
      case 'zh_TW':
        currentLanguage = 'zh';
        break;
      case 'ja':
        currentLanguage = 'ja';
        break;
      case 'ko':
        currentLanguage = 'ko';
        break;
    }
    return currentLanguage ? currentLanguage : 'en';
  }
}
