import isSmallScreen from '../../utils/isSmallScreen';
export default function cookie() {
  let $overLayout = $('.J-overlayout')
  if (!getCookie('FIRST_VISIT_COUNTRY_CODE_KEY') || !getCookie('FIRST_VISIT_LANGUAGE_CODE_KEY')) {
        
    $('html,body').addClass('ovfHiden')


    if (isSmallScreen()) {
      $overLayout.slideDown(300)
    } else {
      $overLayout.addClass('active')
    }
  }
  // setCookie
  function setCookie(key, value) {
    document.cookie = key + '=' + value + ';expires=Fri, 31 Dec 9999 23:59:59 GMT;path=/;'
  }

  // getCookie
  function getCookie(name) {
    var arr, reg = new RegExp('(^| )' + name + '=([^;]*)(;|$)');

    if (arr = document.cookie.match(reg))

      return unescape(arr[2]);
    else
      return null;
  }

  $(document).on('click', '.J-close-fisrt-setcookie', function () {
    $('html,body').removeClass('ovfHiden');

    if (isSmallScreen()) {
      $overLayout.slideUp(300)
    } else {
      $overLayout.removeClass('active')
    }
  })
  $(document).on('click', '.J-first-cookie-apply', function () {
    let $this = $(this)
    let language = $this.parent().siblings('.deliver-tabs').find('.J-radioBox.select').data('language')
    let country = isSmallScreen() ? $this.siblings('.dropdown-group').find('option:selected').val() :
      $this.siblings('.dropdown-group').find('.option.selected').data('deliver')
    let url = window.location.href,
      path = window.location.pathname,
      search = window.location.search,
      currentLanguage = path.split('/')[1],
      langData = ['en', 'zh', 'ja', 'ko', 'zh_TW']

    if (country && language) {
      setCookie('FIRST_VISIT_COUNTRY_CODE_KEY', country)
      setCookie('FIRST_VISIT_LANGUAGE_CODE_KEY', language)
      if (langData.indexOf(currentLanguage) > -1) {
        url = '/' + language + path.substring(path.indexOf(currentLanguage) + currentLanguage.length) + search;
      } else {
        url = '/' + language + path;
      }
      url += url.indexOf('?') > -1 ? '&country=' + country : '?country=' + country + search;
    }
    window.location.href = url;
  })
}