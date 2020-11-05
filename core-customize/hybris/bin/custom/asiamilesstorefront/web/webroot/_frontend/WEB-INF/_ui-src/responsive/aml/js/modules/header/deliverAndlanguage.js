import isTabEnter from '../../utils/isTabEnter'
import isSmallScreen from '../../utils/isSmallScreen';

export default function deliverAndlanguage() {
  let className = 'show',
    JdeliverTo = '.J-deliverTo',
    headerLogoutContent = '.J-headerLogoutContent',
    headerLanguage = '.J-headerLanguage',
    deliverLanguage = '.J-deliverLanguage',
    headerLogout = '.J-headerLogout',
    $radioBtn = $('.J-radioBox'),
    paymentItems,
    countryItems,
    item1 = '',
    item2 = '',
    currency = '',
    isSelected = '',
    classSelectText = '.dropdown-selected-text',
    classSelectedControl = '.J-selectedControl',
    classSelectTrigger = '.J-selectTrigger',
    classSelectInput = '.J-select-input',
    classSelected = 'selected',
    selectedCurrency,
    currentLanguage = $('#curentLanguage').val(),
    isMediumScreen = window.innerWidth < 1023 && window.innerWidth > 767,
    isLargeScreen = window.innerWidth > 1023,
    language = document.getElementsByTagName( 'html' )[0].getAttribute('lang');
        
  let langObj = {
    'en': 'English',
    'zh': 'Simplified Chinese',
    'ko': 'Korean',
    'ja': 'Japanese',
    'zh_TW': 'Traditional Chinese'
  }
  // add event tracking
  $(headerLanguage).attr('aria-label', `language selection link- selected language ${langObj[language]}`);
  // show delivery content
  let handlerIn = function (contentShow, $that) {
    let $this = $that;
    $(contentShow).addClass(className)
    $this.addClass(className)
  };
  // hide delivery content
  let handlerOut = function (contentShow, $that) {
    let $this = $that;
    $(contentShow).removeClass(className)
    if ($this.data('type')) {
      return
    }
    $this.removeClass(className)
  }
  // keydown event enter
  isTabEnter(JdeliverTo, function () {
    let $this = $(this);
    $this.siblings().removeClass(className)
    $(headerLogoutContent).removeClass(className)

    if (!$this.hasClass(className)) {
      handlerIn(deliverLanguage, $this)
    } else {
      handlerOut(deliverLanguage, $this)
    }
  });
  // keydown event enter
  isTabEnter(headerLanguage, function () {
    let $this = $(this);
    $this.siblings().removeClass(className)
    $(headerLogoutContent).removeClass(className)

    if (!$this.hasClass(className)) {
      handlerIn(deliverLanguage, $this)
    } else {
      handlerOut(deliverLanguage, $this)
    }
  })
  // keydown event enter
  isTabEnter(headerLogout, function () {
    let $this = $(this);

    if (!$this.hasClass(className)) {
      handlerIn(headerLogoutContent, $this)
    } else {
      handlerOut(headerLogoutContent, $this)
    }
  })
    

  if (isMediumScreen) {
    // click deliver to country
    $(JdeliverTo).on('click', function () {
      let $this = $(this);
      $this.siblings().removeClass(className)
      $(headerLogoutContent).removeClass(className)

      if (!$this.hasClass(className)) {
        handlerIn(deliverLanguage, $this)
      } else {
        handlerOut(deliverLanguage, $this)
      }
    })
    // click Language
    $(headerLanguage).on('click', function () {
      let $this = $(this);
      $this.siblings().removeClass(className)
      $(headerLogoutContent).removeClass(className)

      if (!$this.hasClass(className)) {
        handlerIn(deliverLanguage, $this)
      } else {
        handlerOut(deliverLanguage, $this)
      }
    })

    // click logout
    // $(headerLogout).on('click', function(){
    //     let $this = $(this);
    //     $this.siblings().removeClass(className)
    //     $(deliverLanguage).removeClass(className)

    //     if(!$this.hasClass(className)){
    //         handlerIn(headerLogoutContent, $this)
    //     }else{
    //         handlerOut(headerLogoutContent, $this)
    //     }
    // })
  }

  if (isLargeScreen) {
    $(JdeliverTo).on('click', function () {
      let $this = $(this);
      $this.siblings().removeClass(className)
      $(headerLogoutContent).removeClass(className)

      if (!$this.hasClass(className)) {
        handlerIn(deliverLanguage, $this)
      } else {
        handlerOut(deliverLanguage, $this)
      }
    })

    $(headerLanguage).on('click', function () {
      let $this = $(this);
      $this.siblings().removeClass(className)
      $(headerLogoutContent).removeClass(className)

      if (!$this.hasClass(className)) {
        handlerIn(deliverLanguage, $this)
      } else {
        handlerOut(deliverLanguage, $this)
      }
    })

    // hover logout
    $(headerLogout).hover(function () {
      handlerIn(headerLogoutContent, $(this))
    }, function () {
      handlerOut(headerLogoutContent, $(this))
    });

    $(headerLogoutContent).hover(function () {
      handlerIn(headerLogout, $(this))
    }, function () {
      handlerOut(headerLogout, $(this))
    });
  }

  function clickSelectedControl() {
    let $this = $(this);
    let text = $this.text();
    $this.siblings().removeClass(classSelected);
    $this.addClass(classSelected);
    $this.parents(classSelectedControl).siblings(classSelectTrigger).find(classSelectText).html(text);
    $this.parents(classSelectedControl).siblings(classSelectTrigger).find(classSelectInput) ?
      $this.parents(classSelectedControl).siblings(classSelectTrigger).find(classSelectInput).val(text) : ''
    $this.parents(classSelectedControl).hide();
  }

  function mobileSelectChange() {
    let $this = $(this);
    let text = $this.find('option:selected').text();
    $this.siblings(classSelectTrigger).find(classSelectText).html(text)
    $this.siblings(classSelectTrigger).find(classSelectInput) ?
      $this.siblings(classSelectTrigger).find(classSelectInput).val(text) : ''
  }

  /* when choose a language, update the dropdown list,
    * keep the selected currency in dropdown list,
    * if HK we use HKD, else use USD
    */
    

  let changeRadio = function (e, $that) {
    e.preventDefault()
    let $paymentList = $that.parent().siblings('.J-deliverContent').find('.listbox')
    let $countryList = $that.parent().siblings('.J-deliverContent').find('.J-selectedControlMobile')
    let $selectedControl = $that.parent().siblings('.J-deliverContent').find('.J-selectedControl')
    let $selectedControlMobile = $that.parent().siblings('.J-deliverContent').find('.J-selectedControlMobile')
    $that.siblings().removeClass('select');
    $that.addClass('select');
    $that.siblings().find('.ui-radio').prop('checked', false);
    $that.find('.ui-radio').prop('checked', true);
    if ($selectedControl.length > 0) {
      if (isSmallScreen()) {
        selectedCurrency = $selectedControlMobile.eq(0).find('option:selected').val();
      } else {
        selectedCurrency = $selectedControl.eq(0).find('.selected').data('deliver');
      }
    }
    $.ajax({
      url: '/' + currentLanguage + '/countryList?languageCode=' + $that.data('language'),
      method: 'get',
      dataType: 'json',
      async: true,
      success: function (data) {
        paymentItems = '';
        countryItems = '';
        if (data && data.length > 0) {
          for (let i = 0; i < data.length; i++) {
            isSelected = '';
            currency = data[i].isocode === 'HK' ? ' (HKD)' : ' (USD)';
            if (data[i].isocode === selectedCurrency) {
              isSelected = ' selected';
              $that.parent().siblings('.J-deliverContent').find(classSelectText)[0].innerHTML = data[i].name + currency;
            }
            item1 = '<li class="option' + isSelected + '" role="option" data-deliver="'
                            + data[i].isocode + '"><a class="link" href="javascript:;">' + data[i].name
                            + currency + '</a></li>';
            item2 = `<option class="option" value=${data[i].isocode} ${isSelected}>${data[i].name}&nbsp;${currency}</option>`
            paymentItems += item1;
            countryItems += item2
          }
          $paymentList.empty();
          $paymentList[0].innerHTML = paymentItems;
          $paymentList.find('.option').on('click', clickSelectedControl);
          $countryList.empty();
          $countryList[0].innerHTML = countryItems;
          $countryList.on('change', mobileSelectChange);
        }
      }
    });
  };
  $radioBtn.on('click', function (e) {
    let $this = $(this);
    changeRadio(e, $this)
  });
  isTabEnter('.J-radioBox', function () {
    $(this).trigger('click');
  })
}