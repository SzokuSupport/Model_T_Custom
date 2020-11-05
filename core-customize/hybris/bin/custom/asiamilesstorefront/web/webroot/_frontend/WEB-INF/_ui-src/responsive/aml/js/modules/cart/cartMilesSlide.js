import '../../plugins/jQuery.nstSlider'
import formatPrice from '../../utils/formatPrice'
import decimalAdjust from '../../utils/decimalAdjust'
import initCart from './initCart'
import promotionMultiple from './promotionMultiple'

export default function cartMileCashSlider() {
  // for localhost testing
  // let ACC = {
  //   config: {
  //     CSRFToken: 'test'
  //   }
  // };
  
  let $selectorMileCashSlider = $('.J-mile-cash-slider'),
    $selectorMileReminder = $('.J-miles-reminder'),
    $selectorInputMiles = $('.J-input-miles'),
    $selectorSliderPrice = $('.J-mile-cash-slider-price'),
    $selectorCashspendingMilesToEarn = $('.J-cashspending-miles-to-earn'),

    // rate = $('.J-mile-cash-slider').attr('data-rate'),
    // earnMilesRate = $selectorMileCashSlider.attr('data-earn_miles_rate'),
    maxMile = $('.J-mile-cash-slider').attr('data-range_min'),
    currency = $('.J-mile-cash-slider-currency').text(),
    inputMileValue;

  let selectorInputMilesIsFocusoutByTab = false;

  let earnMilesRulesUIHandler = function ($element, cash) {
    const ruleType = $element.attr('data-earn_miles_type');

    switch (ruleType) {
      case 'OVER_AMOUNT':
        const targetAmount = $element.attr('data-amount');
        const tipboxId = $element.attr('data-toggle-tipbox-id');
        if (cash >= targetAmount) {
          $element.removeClass('earn-miles-content__row--hide');
          $('#' + tipboxId).addClass('earn-miles-tipbox--hide');
        } else {
          $element.addClass('earn-miles-content__row--hide');
          $('#' + tipboxId).removeClass('earn-miles-tipbox--hide');
        }
        break;
    }
  }

  let cashSpendingUIEffects = function (cash) {
    if (cash > 0) {
      $('.J-no-offers').addClass('J-no-offers--hide');
      $('.J-earn-miles-offer').removeClass('J-earn-miles-offer--hide');

      $('.J-earn-miles-offer').children().each(function (childIndex) {
        // window.console.log($(this));
        if (childIndex > 0) {
          earnMilesRulesUIHandler($(this), cash);
        }
      });
    } else {
      $('.J-no-offers').removeClass('J-no-offers--hide');
      $('.J-earn-miles-offer').addClass('J-earn-miles-offer--hide');
    }
  }

  $('.leftGrip').attr('tabindex', '-1'),
    
  $selectorMileCashSlider.nstSlider({
    'left_grip_selector': '.leftGrip',
    'value_bar_selector': '.bar',
    'value_changed_callback': function (cause, value) {
      $('.J-input-miles').val(-value);
      
      // let cashSpending = (value - maxMile) * rate;
      // let milesToEarn = decimalAdjust('floor', cashSpending * earnMilesRate, 0);
      // window.console.log(milesToEarn);

      // $selectorSliderPrice.text(formatPrice(cashSpending, currency));
      // $selectorCashspendingMilesToEarn.text(formatPrice(milesToEarn, currency, 0));
      // cashSpendingUIEffects(cashSpending);
    },
    'user_mouseup_callback': function (cause, value) {
      let url = $(this).data('url');
      
      $.ajax({
        // for localhost testing
        // url: '/_ui/responsive/aml/html/layout/cartPage_ajax.html',
        url: url + '/' + $('.J-input-miles').val() + '/update',
        method: 'POST',
        data: {
          'CSRFToken': ACC.config.CSRFToken
        },
        dataType: 'html',
        async: true,
        success: function success(data) {
          $('.cartPage').html(data);
          initcartPage();

          $(document).ready(function () {
            initEarnMilesDetailsCollapse();

            // re-attach bonus miles popups click event listeners
            promotionMultiple('.J-promo-popup-multiple');
          });
        }
      });
    }

  })

  $selectorInputMiles.change(function () {
    let maxSlideMile = maxMile > 0 ? maxMile : 0 - maxMile;
    if ($selectorInputMiles.val() > maxSlideMile) {
      $('.J-input-miles').value = maxSlideMile;
    }
  });


  $selectorInputMiles.on('blur', function () {
    if (parseInt($(this).val()) < parseInt($('.J-miles-min').text())) {
      $selectorMileReminder.css('display', 'block')
    } else {
      $selectorMileReminder.css('display', 'none')
    }

    // check if input value is digital, if not, empty input and return false
    if (!(/[\d]/.test($('.J-input-miles').val()))) {
      $('.J-input-miles').val('')
      return false
    }

    // set mile slider position and price according to input value
    inputMileValue = $('.J-input-miles').val();
    $selectorMileCashSlider.nstSlider('set_position', -inputMileValue /* min */ );

    // let cashSpending = (-inputMileValue - maxMile) * rate;
    // let milesToEarn = decimalAdjust('floor', cashSpending * earnMilesRate, 0);
    // $selectorSliderPrice.text(formatPrice(cashSpending, currency));
    // $selectorCashspendingMilesToEarn.text(formatPrice(milesToEarn, currency, 0));
    // cashSpendingUIEffects(cashSpending);

    let url = $(this).data('url');
    $.ajax({
      // for localhost testing
      // url: '/_ui/responsive/aml/html/layout/cartPage_ajax.html',
      url: url + '/' + $('.J-input-miles').val() + '/update',
      method: 'POST',
      data: {
        'CSRFToken': ACC.config.CSRFToken
      },
      dataType: 'html',
      async: true,
      success: function success(data) {
        // remember the current focused element
        let activeEl = document.activeElement;
        setTimeout(function() {
          activeEl = document.activeElement;
        });
        
        // update the content of whole page will remove focus on current element
        $('.cartPage').html(data);

        // reset focus on previously focused element
        setTimeout(function() {
          if (activeEl.id !== '')
            document.getElementById(activeEl.id).focus();
          else if (document.getElementsByClassName(activeEl.className).length > 0)
            document.getElementsByClassName(activeEl.className)[0].focus();
        });

        initcartPage();

        $(document).ready(function () {
          initEarnMilesDetailsCollapse();

          // re-attach bonus miles popups click event listeners
          promotionMultiple('.J-promo-popup-multiple');

          if (selectorInputMilesIsFocusoutByTab) {
            $('.J-agreeCheckbox').focus();
          }
        });
      }
    });
  }).on('keypress', function (e) {
    // validate input value when pressing
    if (!String.fromCharCode(e.keyCode).match(/[\d]/)) {
      return false;
    }
  }).on('keydown', function (e) {
    // Tabbing away from the input, trigger re-focus after partial html reload
    if (e.keyCode === 9) {
      selectorInputMilesIsFocusoutByTab = true;
    }
  })

  initEarnMilesDetailsCollapse();
  promotionMultiple('.J-promo-popup-multiple');
}

function initEarnMilesDetailsCollapse() {
  $(document).ready(function () {
    let $selectorEarnMilesDetailsCollapse = $('.J-expand-earn-miles-details'),
      $selectorEarnMilesDetailsWrapper = $('.J-earn-miles-content-details-wrapper'),
      $selectorEarnMilesTitleTotalWrapper = $('.J-earn-miles-title-total-wrapper');
    $selectorEarnMilesDetailsCollapse.on('click', function () {
      if ($selectorEarnMilesDetailsWrapper.hasClass('earn-miles-content-details-wrapper--hide')) {
        $selectorEarnMilesTitleTotalWrapper.css('visibility', 'hidden');
        $selectorEarnMilesDetailsCollapse.addClass('icon-dropdown--open');
        $selectorEarnMilesDetailsWrapper.removeClass('earn-miles-content-details-wrapper--hide');
      } else {
        $selectorEarnMilesTitleTotalWrapper.css('visibility', 'visible');
        $selectorEarnMilesDetailsCollapse.removeClass('icon-dropdown--open');
        $selectorEarnMilesDetailsWrapper.addClass('earn-miles-content-details-wrapper--hide');
      }
    })
  });
}

function initcartPage() {
  cartMileCashSlider();
  initCart();

  initEarnMilesDetailsCollapse();
}