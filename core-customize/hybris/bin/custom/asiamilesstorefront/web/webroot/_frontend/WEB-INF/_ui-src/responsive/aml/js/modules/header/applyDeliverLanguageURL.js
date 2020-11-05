import isSmallScreen from '../../utils/isSmallScreen'
import isTabEnter from '../../utils/isTabEnter'
export default function applyDeliverLanguageURL() {

  /* When click the apply button,
    * add current language and country code to url,
    * and refresh the page
    */
  $('.J-apply-button').on('click', function () {
    let $this = $(this);
    let language = $this.parent().siblings('.deliver-tabs').find('.J-radioBox.select').data('language');
    let country = isSmallScreen() ? $this.siblings('.dropdown-group').find('option:selected').val() :
      $this.siblings('.dropdown-group').find('.option.selected').data('deliver');
    let url = window.location.href,
      path = window.location.pathname,
      search = window.location.search,
      currentLanguage = path.split('/')[1],
      langData = ['en', 'zh', 'ja', 'ko', 'zh_TW'];

    if (country && language) {
      if (langData.indexOf(currentLanguage) > -1) {
        url = '/' + language + path.substring(path.indexOf(currentLanguage) + currentLanguage.length) + search;
      } else {
        url = '/' + language + path + search;
      }
      url += url.indexOf('?') > -1 ? '&country=' + country : '?country=' + country;
    }
    window.location.href = url;
  });
  isTabEnter('.J-apply-button', function () {
    $(this).trigger('click');
  })
}