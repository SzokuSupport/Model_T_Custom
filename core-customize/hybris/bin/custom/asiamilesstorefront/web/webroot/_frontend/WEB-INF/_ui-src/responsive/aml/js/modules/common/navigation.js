import isLargeScreen from '../../utils/isLargeScreen'
import isTabEnter from '../../utils/isTabEnter'

export default function navigation(selector) {
  let $selector = $(selector),
    $category = $('.J-category'),
    navWidth = $(window).width(),
    $navItem = $('.J-nav-item'),
    $navigation = $('.J-navigation'),
    $navItemTablet = $('.J-nav-item__tablet'),
    $rightArrow = $('.J-right-arrow'),
    $leftArrow = $('.J-left-arrow'),
    $slides = $('.slides'),
    navTotalLength,
    navPadding,
    $loginBtn = $('.J-loginBtn'),
    currentLanguage = $('#curentLanguage').val();
  if (isLargeScreen()) {
    let width = $('.header__nav').width();
    // if window width > header width , both sliders should have same width to be center
    if ((navWidth - width) > 0) {
      let paddingWidth = (navWidth - width) / 2;
      $category.css({
        padding: `30px ${paddingWidth}px`
      })
      $slides.css({
        padding: `30px ${paddingWidth}px`
      })
    }
    // count navigation total width (padding + itemsWidth * itemNumber ),if > header width , left 0 ,rightArrow display;else left,take half the difference
    navPadding = parseFloat($navigation.css('paddingLeft'));
    navTotalLength = $navItem.width() * $navItem.length + parseFloat($navItem.css('marginRight')) * ($navItem.length - 1) + navPadding * 2
    $navigation.css('width', `${navTotalLength}px`)
    // max distance of navigation to the left
    let maxLeft = navTotalLength - navWidth
    if (navTotalLength > navWidth) {
      $rightArrow.show()
      $navigation.css('left', '0')
    } else {
      let left = navWidth / 2 - navTotalLength / 2
      $navigation.css('left', `${left}px`)
      $rightArrow.hide()
    }
    $leftArrow.hide()
    $selector.css('left', '0px')
    $navigation.show()
    $navItemTablet.hide()
    // The distance of each slide
    let speed = $navItem.width() + parseFloat($navItem.css('marginRight'))
    // right arrow click event. if left distance > maxLeft ,
    $rightArrow.unbind('click').on('click', function () {
      let beforeLeft = parseFloat($navigation.css('left'))
      // if the present left plus speed greater than the maxLeft , let left is maxLeft and rightArrow hide;if not, left is the present left plus speed and leftArrow display.
      if ((speed - beforeLeft) < maxLeft) {
        $navigation.animate({
          left: `${beforeLeft - speed}px`
        }, function () {
          let curLeft = parseFloat($selector.css('left'));
          if (curLeft < 0) {
            $leftArrow.show()
          }
        })
      } else {
        $navigation.animate({
          left: `-${maxLeft}px`
        }, function () {
          $rightArrow.hide();
          $leftArrow.show()
        })
      }
    })
    // WATesting event.
    isTabEnter('.J-right-arrow', function () {
      $(this).unbind('click');
      $(this).trigger('click');
    })
    // left Arrow click event,
    $leftArrow.unbind('click').on('click', function () {
      let beforeLeft = parseFloat($navigation.css('left'))

      if (beforeLeft < 0) {
        if (beforeLeft >= -speed) {
          $navigation.animate({
            left: '0',
          }, function () {
            $navigation.css('right', '')
            $leftArrow.hide()
            $rightArrow.show()
          })
        } else {
          $navigation.animate({
            left: `${beforeLeft + speed}px`
          }, function () {
            $navigation.css('right', '')
            let curRight = parseFloat($navigation.css('right'))
            if (curRight < 0) {
              $rightArrow.show()
            }
          })
        }
      } else {
        return false
      }
    })
    // WATesting event
    isTabEnter('.J-left-arrow', function () {
      $(this).unbind('click');
      $(this).trigger('click');
    })
  } else {
    navPadding = parseFloat($('.J-navigation').css('paddingLeft'))
    navTotalLength = $navItemTablet.width() * $navItemTablet.length + parseFloat($navItemTablet.css('marginRight')) * ($navItemTablet.length - 1) + navPadding * 2
    $('.J-navigation__tablet').css('width', `${navTotalLength}px`)
    let speed = parseFloat($navItemTablet.css('marginRight')) + $navItemTablet.width()
    let maxLeft = navTotalLength - navWidth
    if (navTotalLength > navWidth) {
      $rightArrow.show()
      $selector.css('left', '0')
    } else {
      let left = navWidth / 2 - navTotalLength / 2
      $selector.css('left', `${left}px`)
      $rightArrow.hide()
    }
    $selector.show()
    $loginBtn.on('click', function () {
      window.location.href = '/' + currentLanguage + '/login';
    })
    $navItemTablet.show()
    $navigation.hide()

    $rightArrow.unbind('click').on('click', function () {
      let beforeLeft = parseFloat($selector.css('left'));
      if ((speed - beforeLeft) < maxLeft) {
        $selector.animate({
          left: `${beforeLeft - speed}px`
        }, function () {
          let curLeft = parseFloat($selector.css('left'));
          if (curLeft < 0) {
            $leftArrow.show()
          }
        })
      } else {
        $selector.animate({
          left: `-${maxLeft}px`
        }, function () {
          $rightArrow.hide();
          $leftArrow.show()
        })
      }
    });
    $leftArrow.unbind('click').on('click', function () {
      let beforeLeft = parseFloat($selector.css('left'))

      if (beforeLeft < 0) {
        if (beforeLeft >= -speed) {
          $selector.animate({
            left: '0',
          }, function () {
            $selector.css('right', '')
            $leftArrow.hide()
            $rightArrow.show()
          })
        } else {
          $selector.animate({
            left: `${beforeLeft + speed}px`
          }, function () {
            $selector.css('right', '')
            let curRight = parseFloat($selector.css('right'))
            if (curRight < 0) {
              $rightArrow.show()
            }
          })
        }
      } else {
        return false
      }
    })
    isTabEnter('.J-right-arrow', function () {
      $(this).trigger('click');
    })
    isTabEnter('.J-left-arrow', function () {
      $(this).trigger('click');
    })
  }

  if (isLargeScreen()) {
    // hover effect on desktop category navigation
    let curIndex,
      leaveTimer,
      timer,
      slideTimer;
    $navItem.on({
      'mouseenter': function (e) {
        clearTimeout(timer)
        clearTimeout(leaveTimer)
        clearTimeout(slideTimer)
        let that = this
        if (curIndex === $(this).index()) {
          return
        }
        timer = setTimeout(function () {
          curIndex = $(that).index()

          if ((e.pageX - $(that).offset().left) > (parseFloat($(that).width()) / 2)) {
            $(that).find('.border').css({
              'left': '100%'
            })
            $(that).find('.border').animate({
              'left': '0'
            }, 200)
          } else {
            $(that).find('.border').css({
              'left': '-100%'
            })
            $(that).find('.border').animate({
              'left': '0'
            }, 200)
          }
          if ($slides.eq(curIndex).find('.groups').length > 0) {
            $slides.eq(curIndex).slideDown(100, function () {
              let height = $slides.eq(curIndex).height()
              $slides.eq(curIndex).find('.groups').css({
                marginLeft: 0,
                opacity: '1',
                transition: 'all 0.2s'
              })
              $slides.eq(curIndex).find('.groups').find('.column').css({
                height: `${height}px`
              })
            })
          } else {
            return
          }
        }, 300)
      },
      'mouseleave': function (e) {
        clearTimeout(timer)
        clearTimeout(leaveTimer)
        clearTimeout(slideTimer)
        let that = this
        let leaveTimer = setTimeout(function () {
          if ($('.slides:hover').length > 0) {
            return
          } else {
            if (curIndex !== $(that).index()) {
              return
            } else {
              if ((e.pageX - $(that).offset().left) > (parseFloat($(that).width()) / 2)) {
                $(that).find('.border').animate({
                  'left': '100%',
                }, 200)
              } else {
                $(that).find('.border').animate({
                  'left': '-100%'
                }, 200)
              }
              $slides.eq(curIndex).find('.groups').css({
                marginLeft: '30%',
                opacity: '0',
                transition: 'all 0s'
              })
              $slides.eq(curIndex).slideUp(300)
              curIndex = undefined
            }
          }
        }, 100)
      }
    })

    $slides.on('mouseleave', function (e) {
      clearTimeout(timer)
      clearTimeout(leaveTimer)
      clearTimeout(slideTimer)
      let that = this
      let slideTimer = setTimeout(function () {
        if ($('.J-nav-item:hover').index() === curIndex) {
          return
        }
        if ((e.pageX - $(that).offset().left) > (parseFloat($(that).width()) / 2)) {
          $navItem.eq(curIndex).find('.border').animate({
            'left': '100%'
          }, 200)
        } else {
          $navItem.eq(curIndex).find('.border').animate({
            'left': '-100%'
          }, 200)
        }
        $slides.eq(curIndex).find('.groups').css({
          marginLeft: '30%',
          opacity: '0',
          transition: 'all 0s'
        })
        $slides.eq(curIndex).slideUp(300)
        curIndex = undefined
      }, 100)
    })
  } else {
    // click event on tablet category navigation
    let init,
      tabFlag = true,
      startX,
      overX,
      transformVal,
      curPosition,
      $navBar = $('.J-navigation__tablet'),
      leftPosition,
      rightPosition;
    $navItemTablet.on('click', function (e) {
      let cur = $(this).index()
      if (init !== undefined) {
        if (init === cur) {
          if (tabFlag) {
            $navItemTablet.eq(init).find('.border').animate({
              'left': '-100%'
            })
            $slides.eq(init).slideUp()
            $slides.eq(init).find('.groups').css({
              'marginLeft': '100%',
              'opacity': '0'
            })
          } else {
            $navItemTablet.eq(init).find('.border').animate({
              'left': '0'
            })
            if ($slides.eq(init).find('.group').length > 0) {
              $slides.eq(init).slideDown()
              $slides.eq(init).find('.groups').css({
                'marginLeft': '0',
                'opacity': '1'
              })
            }
          }
          tabFlag = !tabFlag
        } else {
          $navItemTablet.eq(init).find('.border').animate({
            'left': '-100%'
          })
          $slides.eq(init).slideUp()
          $slides.eq(init).find('.groups').css({
            'marginLeft': '100%',
            'opacity': '0'
          })
          $navItemTablet.eq(cur).find('.border').animate({
            'left': '0'
          })
          if ($slides.eq(cur).find('.group').length > 0) {
            $slides.eq(cur).slideDown()
            $slides.eq(cur).find('.groups').css({
              'marginLeft': '0',
              'opacity': '1'
            })
          }
          tabFlag = true
        }
      } else {
        $navItemTablet.eq(cur).find('.border').animate({
          'left': '0'
        })
        if ($slides.eq(cur).find('.group').length > 0) {
          $slides.eq(cur).slideDown()
          $slides.eq(cur).find('.groups').css({
            'marginLeft': '0',
            'opacity': '1'
          })
        }
      }
      init = cur;
    });
    // touchmove event on tablet category navigation
    $navBar.on('touchstart', function (event) {
      // event.preventDefault();
      leftPosition = parseFloat($selector.css('left'));
      rightPosition = parseFloat($selector.css('right'));
      startX = event.touches[0].clientX;
    });
    $navBar.on('touchmove', function (event) {
      overX = event.touches[0].clientX;
      transformVal = overX - startX;
      curPosition = leftPosition + transformVal;
      if (transformVal > 0) {
        // right
        let curLeft = parseFloat($selector.css('left'));
        if (curLeft >= 0) {
          $leftArrow.hide();
          $navBar.css('left', '0px');
          return
        }
        $rightArrow.show();
        $navBar.css('left', curPosition + 'px');
      } else {
        // left
        let curRIght = parseFloat($selector.css('right'));
        if (curRIght >= 0) {
          $rightArrow.hide();
          $navBar.css('left', '');
          $navBar.css('right', '0px');
          return
        }
        $leftArrow.show();
        $navBar.css('left', curPosition + 'px');
      }
    });
  }

  // navigation animation on mobile
  let $navMobile = $('.J-nav-mobile'),
    $level = $('.J-level'),
    $slideItem = $('.J-nav-slide__item'),
    $slideItem2 = $('.J-nav-slide__item2'),
    $slideItem3 = $('.J-nav-slide__item3'),
    $categoryItem = $('.J-category__item'),
    $categoryItemTwo = $('.J-category__item--two'),
    $categoryItemthree = $('.J-category__item--three'),
    $categoryItemfour = $('.J-category__item--four'),
    $backMain = $('.J-back-main'),
    $backTwo = $('.J-back-two'),
    $backThree = $('.J-back-three'),
    showLogoutMobile = 'show-logout-mobile',
    $headerForLogoutMobile = $('.J-headerForLogoutMobile'),
    $hideIconUser = $('.J-hideIconUser'),
    $showIconClose = $('.J-showIconClose'),
    $headerLogoutMobile = $('.J-headerLogoutMobile'),
    $blackCart = $('.J-cart-black'),
    $whiteCart = $('.J-cart-white');
  $('.J-header-menu').unbind('click').on('click', function () {
    let flag = $('.J-header-menu').attr('status'); /* mobile user status 0:slidedown 1:slideup*/
    if (flag === '0') {
      // if mobile user slidedown,let it slideup
      if ($('.J-headerLogout').attr('status') === '1') {
        $headerForLogoutMobile.removeClass(showLogoutMobile);
        $headerLogoutMobile.slideUp(0);
        $hideIconUser.show();
        $showIconClose.hide();
        $blackCart.show();
        $whiteCart.hide();
        $('.J-headerLogout').attr('status', '0')
      }
      $navMobile.slideDown();
      $(this).find('.header-icon').eq(0).addClass('disappear');
      $(this).find('.header-icon').eq(1).removeClass('disappear');
      $(this).addClass('noBorder')
      $(this).find('.whiteBorder').removeClass('disappear');
      $('.J-header-menu').attr('status', '1');
      // animation
      $('.J-menu-lines').addClass('control-active')
      $('.J-header-menu').find('.J-menu-lines li').css('background', '#272f38')
    } else {
      $navMobile.slideUp(0)
      $level.animate({
        'left': '0'
      })
      $(this).find('.header-icon').eq(0).removeClass('disappear')
      $(this).find('.header-icon').eq(1).addClass('disappear')
      $(this).removeClass('noBorder')
      $('.J-header-menu').attr('status', '0')
      $(this).find('.whiteBorder').addClass('disappear')
      // animation
      $('.J-menu-lines').removeClass('control-active')
    }
  })
  // click enter level two navigation
  $categoryItem.on('click', function (e) {
    let index = $(this).index()
    $slideItem.hide()
    if ($(this).find('.J-nav-slide__item').length === 1) {
      $(this).find('.J-nav-slide__item').show()
      $level.animate({
        'left': '-100%'
      })
    } else {
      window.location.href = $(this).data('url')
    }
    if (e && e.stopPropagation) {
      e.stopPropagation();
    } else {
      window.event.cancelBubble = true;
    }
  })
  // click enter level three navigation
  $categoryItemTwo.on('click', function (e) {
    $slideItem2.hide()
    if ($(this).find('.J-nav-slide__item2').length === 1) {
      $(this).find('.J-nav-slide__item2').show()
      $level.animate({
        'left': '-200%'
      })
    } else {
      window.location.href = $(this).data('url')
    }
    if (e && e.stopPropagation) {
      e.stopPropagation();
    } else {
      window.event.cancelBubble = true;
    }
  })
  // click enter level four navigation
  $categoryItemthree.on('click', function (e) {
    $slideItem3.hide()
    if ($(this).find('.J-nav-slide__item3').length === 1) {
      $(this).find('.J-nav-slide__item3').show()
      $level.animate({
        'left': '-300%'
      })
    } else {
      window.location.href = $(this).data('url')
    }
    if (e && e.stopPropagation) {
      e.stopPropagation();
    } else {
      window.event.cancelBubble = true;
    }
  })
  // click four level navigation
  $categoryItemfour.on('click', function (e) {
    if (e && e.stopPropagation) {
      e.stopPropagation();
    } else {
      window.event.cancelBubble = true;
    }
    window.location.href = $(this).data('url')
  })
  // back level three navigation
  $backThree.on('click', function (e) {
    if (e && e.stopPropagation) {
      e.stopPropagation();
    } else {
      window.event.cancelBubble = true;
    }
    $level.animate({
      'left': '-200%'
    })
  })
  // back level two navigation
  $backTwo.on('click', function (e) {
    if (e && e.stopPropagation) {
      e.stopPropagation();
    } else {
      window.event.cancelBubble = true;
    }
    $level.animate({
      'left': '-100%'
    })
  })
  // back level one navigation
  $backMain.on('click', function (e) {
    if (e && e.stopPropagation) {
      e.stopPropagation();
    } else {
      window.event.cancelBubble = true;
    }
    $level.animate({
      'left': '0'
    })
  })
  // before the user leaves current page
  window.onbeforeunload = function (e) {
    $navMobile.slideUp()
    $level.animate({
      'left': '0'
    })
    $('.J-header-menu').find('.header-icon').eq(0).removeClass('disappear')
    $('.J-header-menu').find('.header-icon').eq(1).addClass('disappear')
    $('.J-header-menu').removeClass('noBorder')
    $('.J-header-menu').attr('status', '0')
    $('.J-header-menu').find('.whiteBorder').addClass('disappear')
    // animation
    $('.J-menu-lines').removeClass('control-active')
  }
}
// mobile  language switch
let url = window.location.href,
  path = window.location.pathname,
  currentLanguage = path.split('/')[1],
  langData = ['en', 'zh', 'ja', 'ko', 'zh_TW']

$('.J-mobile-language-select').on('change', function () {
  let language = $(this).val()
  if (langData.indexOf(currentLanguage) > -1) {
    url = '/' + language + path.substring(path.indexOf(currentLanguage) + currentLanguage.length);
  } else {
    url = '/' + language + path;
  }
  window.location.href = url
})

$('.J-mobile-delivery-select').on('change', function () {
  let country = $(this).val()
  url += url.indexOf('?') > -1 ? '&country=' + country : '?country=' + country;
  window.location.href = url
})
