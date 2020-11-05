import isSmallScreen from '../../utils/isSmallScreen'


export default function logoutMobile() {
  let isMediumScreen = window.innerWidth < 1023
  // medium screen logout

  if (isMediumScreen) {
    $('.J-headerLogout').on('click', function () {
      let showLogoutMobile = 'show-logout-mobile',
        $headerForLogoutMobile = $('.J-headerForLogoutMobile'),
        $hideIconUser = $('.J-hideIconUser'),
        $showIconClose = $('.J-showIconClose'),
        $headerLogoutMobile = $('.J-headerLogoutMobile'),
        $blackCart = $('.J-cart-black'),
        $navMobile = $('.J-nav-mobile'),
        $level = $('.J-level'),
        $whiteCart = $('.J-cart-white');

      if ($(this).attr('status') === '1') {
        $(this).attr('status', '0')
      } else {
        $(this).attr('status', '1')
      }
      if (!$headerForLogoutMobile.hasClass(showLogoutMobile)) {
        if ($('.J-header-menu').attr('status') === '1') {
          $navMobile.slideUp();
          $level.animate({
            'left': '0'
          });
          $('.J-header-menu').find('.header-icon').eq(0).removeClass('disappear');
          $('.J-header-menu').find('.header-icon').eq(1).addClass('disappear');
          $('.J-header-menu').removeClass('noBorder');
          $('.J-header-menu').attr('status', '0');
          $('.J-header-menu').find('.whiteBorder').addClass('disappear')
          $('.J-menu-lines').removeClass('control-active')
        }
        $('.J-header-menu').find('.J-menu-lines li').css('background', '#fff')
        $headerForLogoutMobile.addClass(showLogoutMobile);
        $hideIconUser.hide();
        $showIconClose.show();
        $blackCart.hide();
        $whiteCart.show();
        $headerLogoutMobile.slideDown(200);

        if (!isSmallScreen()) {
          $(this).siblings().hide()
        }

      } else {
        $headerForLogoutMobile.removeClass(showLogoutMobile);
        $headerLogoutMobile.slideUp(200);
        $hideIconUser.show();
        $showIconClose.hide();
        $blackCart.show();
        $whiteCart.hide();
        $('.J-header-menu').find('.J-menu-lines li').css('background', '#272f38')

        if (!isSmallScreen()) {
          $(this).siblings().removeAttr('style')
        }
      }

    })
  }

  $('.header-login').on('click', function () {
    if (getCookie('cls_login')) {
      setCookie('cls_login', ' ', -1);
    }
  });

  $('.J-loginBtn').on('click', function () {
    if (getCookie('cls_login')) {
      setCookie('cls_login', ' ', -1);
    }
  });

  function getCookie(name) {
    var arr, reg = new RegExp('(^| )' + name + '=([^;]*)(;|$)');

    if (arr = document.cookie.match(reg))

      return unescape(arr[2]);
    else
      return null;
  }

  function setCookie(key, value) {
    document.cookie = key + '=' + value + ';expires=Fri, 31 Dec 9999 23:59:59 GMT;path=/;'
  }
}