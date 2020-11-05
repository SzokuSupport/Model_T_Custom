let $miniCart = $('.J-mini-card'),
  $closeMiniCartBtn = $('.J-close-mini-cart'),
  $headerCart = $('.J-header-cart'),
  $priceOriginal = $('.J-original-price'),
  $promPrice = $('.J-promotion-price'),
  $milesPrice = $('.J-input-miles'),
  $reeSection = $('.J-regulated-electronics-equipment');

if ($reeSection.length > 0) {
  $reeSection.find('.alert-error-message-ree').hide();

  $reeSection.find('.radio-group input[type=radio]').on('click', function () {
    $('.radio-group').each(function () {
      $(this).removeClass('select');
    });
    $reeSection.find('.alert-error-message-ree').hide();
    $(this).parent().addClass('select');
  });

  $reeSection.find('a#go-to-contact-details').click(function () {
    $('html, body').animate({
      scrollTop: $(".product-detail").offset().top - $('.header').height()
    }, 500);
    $('.product-detail__tabs ul li:nth-child(2) > a').click();
  });
}

$(window).on('resize', function () {
  position()
});

// mini position
function position() {
  let width = $(window).width(),
      userWidth = $('.J-headerLogout').width(),
      userPadding = parseInt($('.J-headerLogout').css('paddingLeft')),
      cartWidth = $('.header-cart').width(),
      beforeRight,
      right,
      top;
  if (width >= 1440) {
    right = (width - 1440) / 2;
    beforeRight = userWidth + cartWidth/2 + userPadding * 2;
    top = 63
    // $('.J-mini-card::before').css({
    //   right: `${beforeRight - 7}px`,
    // })
    $('.J-mini-card').append('<style>.J-mini-card::before{right:'+`${beforeRight - 7}px}</style>`)
  } else if (width < 768) {
    right = 0;
    top = 68
  } else {
    right = 0;
    top = 63
  }
  $miniCart.css({
    'right': `${right}px`
  });
  $miniCart.css({
    'top': `${top}px`
  })
}

function _showMiniCart() {
  position();
  $miniCart.show()
}

// change quantity header
function _headerCartAddItems(data) {
  if (data.cartData.totalUnitCount) {
    let num = parseInt(data.cartData.totalUnitCount);
    $headerCart[0].innerHTML = num;
  }
}
//  hide mini cart
function _hideMiniCart() {
  let delayTime = 5000;

  let hideCart = setTimeout(function () {
    $miniCart.addClass('mini-card-hide');
    _tranHideMiniCart();
  }, delayTime);


  $miniCart.on('mouseover', function () {
    $miniCart.removeClass('mini-card-hide');
    clearTimeout(hideCart)
  }).on('mouseleave', function () {
    $miniCart.removeClass('mini-card-hide');
    $miniCart.hide();
  });


  $closeMiniCartBtn.on('click', function () {
    $miniCart.removeClass('mini-card-hide');
    $miniCart.hide()
  })
}

function _tranHideMiniCart() {
  setTimeout(function () {
    $miniCart.hide();
    $miniCart.removeClass('mini-card-hide');
  }, 3000)
}

export default function addToCart() {
  let $addToCartbtn = $('.J-add-to-cart'),
    $agreeCheckbox = $('.J-agree-checkbox'),
    $productCheckboxGroup = $('.J-product-checkbox-group'),
    $alertMsg = $('.J-agree-term-condition'),
    $errorMsg = $('#J-add-to-cart-errorMsg'),
    $alertErrMsg = $('.alert-error-message'),
    ischeck = false;

  let ifAgreeTerms = $agreeCheckbox.is(':checked');

  if ($('.alert-message').length > 0 || $alertErrMsg.length > 0) {
    $addToCartbtn.prop('disabled', true);
    $addToCartbtn.addClass('disabled');
    if (!ifAgreeTerms) {
      $alertMsg.show()
    }
  }
  // click add-to-cart  button
  let addFlag = true;
  $addToCartbtn.on('click', function () {
    if (!addFlag) {
      return false
    }
    addFlag = false;
    let $this = $(this),
      url = $this.data('url'),
      code = $('#J-productCodePost').val(),
      qty = parseInt($('.J-quantity').text()),
      miles;

    if ($milesPrice.length > 0) {
      miles = $milesPrice.val();
    } else if ($promPrice.length > 0) {
      miles = $promPrice.text().replace(',', '');
    } else {
      miles = $priceOriginal.text().replace(',', '');
    }


    // when click add-to-cart button, check if user agreed terms, if not, return
    let ifAgreeTerms = $agreeCheckbox.length > 0 ? $agreeCheckbox.is(':checked') : true;

    if (!ifAgreeTerms) {
      $alertMsg.show();
      $addToCartbtn.prop('disabled', true);
      $addToCartbtn.addClass('disabled');
      return
    } else {
      $alertMsg.hide();
      $addToCartbtn.prop('disabled', false);
      $addToCartbtn.removeClass('disabled')
    }
    
    if ($reeSection.length > 0) {
      let isChecked = false;
      let allowProceed = false;
      
      $reeSection.find('.radio-group').each(function () {
        if ($(this).children('input[type=radio]').is(':checked')) {
          isChecked = true;
          return false;
        } else {
          return;
        }
      }).promise().done(function () {
        // window.console.log('promise done isChecked: ', isChecked);
        if (isChecked) {
          $alertMsg.hide();
          $reeSection.find('.alert-error-message-ree').hide();
          $addToCartbtn.prop('disabled', false);
          $addToCartbtn.removeClass('disabled');
          allowProceed = true;
        } else {
          $reeSection.find('.alert-error-message-ree').show();
          $productCheckboxGroup.find('.J-agree-checkbox.tnc-for-ree').prop('checked', false);
          $alertMsg.show();
          $addToCartbtn.prop('disabled', true);
          $addToCartbtn.addClass('disabled');
        }
      });

      addFlag = true;

      if (!allowProceed) {
        return
      }
    }
    
    // window.console.log('addToCart ajax call');
    
    $.ajax({
      url: url,
      type: 'post',
      data: {
        code: code,
        qty: qty,
        CSRFToken: ACC.config.CSRFToken,
        miles: miles,
        ...(($reeSection.length > 0) && {RemovalServiceStatuses: $('.radio-group.select').data('signup')})
      },
      dataType: 'json',
      async: true,
      success: function (data) {
        addFlag = true
        if (data.errorMsg !== '') {
          if (data.code === 9999) {
            window.location.href = data.redirectUrl;
            return
          }
          $('.J-add-box').before("<div class='alert-error-message-btn'></div")
          $('.alert-error-message-btn').append("<svg class='icon-alert-small'><use xlink:href='/_ui/responsive/aml/img/sprite.svg#icon-alert-small'></use></svg>")
          $('.alert-error-message-btn').append(`<span class="error-message-text font-SemiBold" id='J-add-to-cart-errorMsg'>${data.errorMsg}</span>`)
          $addToCartbtn.prop('disabled', true);
          $addToCartbtn.addClass('disabled')
        }
        if (data.addedItemQuantity && data.addedItemQuantity !== '0') {
          $miniCart.find('.title')[0].innerHTML = data.addedItemQuantity + $miniCart.find('.title')[0].innerHTML.substring(1);

          var itemCategoryProp = (
            typeof ACC.addons.merchandisingaddon.ItemCategory !== 'undefined'
            ? JSON.parse(ACC.addons.merchandisingaddon.ItemCategory)
            : null
          );

          var cartData = {
            "cartCode": data.cartData.code,
            "productCode": code,
            "quantity": qty,
            "productPrice": miles,
            "productName": "",
            "itemCategory": (itemCategoryProp !== null ? itemCategoryProp.properties.ItemCategory : '')
          };
          ACC.track.trackAddToCart(code, qty, cartData);

          _headerCartAddItems(data);
          _showMiniCart();
          _hideMiniCart()
        }
      },
      error: function (data) {
        $errorMsg.text(data.errorMsg)
      }
    })
  })

  // click agree checkbox
  $productCheckboxGroup.find('.J-agree-checkbox').on('click', function () {
    let ifAgreeTerms = $agreeCheckbox.is(':checked');
    ischeck = !ischeck;
    if (ifAgreeTerms) {
      $alertMsg.hide();
      $addToCartbtn.prop('disabled', false);
      $addToCartbtn.removeClass('disabled');
      if ($alertErrMsg.length > 0) {

        $addToCartbtn.prop('disabled', true);
        $addToCartbtn.addClass('disabled')
      }
    } else {
      $alertMsg.show();
      $addToCartbtn.prop('disabled', true);
      $addToCartbtn.addClass('disabled')
    }
  })
}
