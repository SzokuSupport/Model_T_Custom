import isSmallScreen from '../utils/isSmallScreen';
import isTabEnter from '../utils/isTabEnter';

function isDropdown() {
  let classSelectText = '.dropdown-selected-text';
  let classSelectedControl = '.J-selectedControl';
  let classSelectTrigger = '.J-selectTrigger';
  let classSelectInput = '.J-select-input';
  let classSelected = 'selected';
  let $selectedControl = $(classSelectedControl);
  let $selectedControlMobile = $('.J-selectedControlMobile');
  let translateObj = {
    'Mr': 'Mister',
    'Ms': 'Miss',
    'Miss': 'Miss',
    'Mrs': 'Missis',
    'Dr.': 'Doctor',
    'Prof.': 'Professor',
    'Master': 'Master',
  };
    // translate selected title
  let translateTitle = function (str) {
    for (let i in translateObj) {
      if ( i === $.trim(str)) {
        return translateObj[i]
      }
    }
    return str
  }
  // init value : desktop and tablet class option selected, mobile <option selected></option>
  let getSelectValue = function () {
    let baseValue = isSmallScreen() ? $selectedControlMobile : $selectedControl;
    for (let i = 0; i < baseValue.length; i++) {
      let _selector = isSmallScreen() ? 'option:selected' : '.option.selected';
      let text1, text2;
      let label = baseValue.eq(i).siblings('.dropdown-label').text()
      if (isSmallScreen()) {
        text1 = (baseValue.eq(i).find(_selector).length > 0 ? (baseValue.eq(i).find(_selector).attr('ccode') ?
          baseValue.eq(i).find(_selector).attr('ccode') : baseValue.eq(i).find(_selector).text()) : '');
        text2 = (baseValue.eq(i).find(_selector).length > 0 ? baseValue.eq(i).find(_selector).val() : text1)
      } else {
        text1 = baseValue.eq(i).find(_selector).find('.J-code-num').length > 0 ?
          baseValue.eq(i).find(_selector).find('.J-code-num').text() :
          baseValue.eq(i).find(_selector).text()
        text2 = baseValue.eq(i).find(_selector).find('.J-code-num').length > 0 ?
          baseValue.eq(i).find(_selector).find('.J-code-num').text() : (
            baseValue.eq(i).find(_selector).attr('data') ?
              baseValue.eq(i).find(_selector).attr('data') : baseValue.eq(i).find(_selector).text())
      }
      baseValue.eq(i).siblings(classSelectTrigger).find(classSelectText).length > 0 ?
        baseValue.eq(i).siblings(classSelectTrigger).find(classSelectText).text(text1) : '';
      baseValue.eq(i).siblings(classSelectTrigger).find(classSelectInput).length > 0 ?
        baseValue.eq(i).siblings(classSelectTrigger).find(classSelectInput).val(text2) : '';

      if (!text1) {
        baseValue.eq(i).siblings('label').css({
          'top': '20px',
          'font-size': '16px'
        })
        baseValue.eq(i).siblings(classSelectTrigger).attr('aria-label', `${label} combo box- collapsed nothing Selected`)
      } else {
        let str = translateTitle(text1)
        baseValue.eq(i).siblings(classSelectTrigger).attr('aria-label', `${label} combo box- collapsed Selected ${str}`)
      }
    }
  }
  getSelectValue();

  // assign meaningful screen reader labels to titles options
  $selectedControl.find(".option .J-code-title").each(function(idx, el) {
    let str = translateTitle($(this).text());
    $(this).closest(".option").eq(0).attr("aria-label", str);
  })


  $(window).resize(function () {
    getSelectValue();
  });
  // dropdown selected changed
  if (isSmallScreen()) {
    // mobile select change event
    $selectedControlMobile.on('change', function () {
      let $this = $(this);
      let url = $this.val(),
        use = $this.attr('use');
      if (!use && url) {
        window.location.href = url;
      }
      let text1 = url ? url : $this.find('option:selected').text(),
        text2 = $this.find('option:selected').attr('ccode') ? $this.find('option:selected').attr('ccode') : $this.find('option:selected').text();
      $this.siblings(classSelectTrigger).find(classSelectText).html(text2)
      $this.siblings(classSelectTrigger).find(classSelectInput).val(text1)
    });

    $selectedControlMobile.on('focus', function () {
      $(this).siblings(classSelectTrigger).addClass(classSelected);
    }).blur(function () {
      $(this).siblings(classSelectTrigger).removeClass(classSelected);
    })

  } else {
    // desktop and tablet items click event
    let clickSelectTrigger = function () {
      let $this = $(this),
        label = $this.siblings('.dropdown-label').text();
      if ($this.hasClass(classSelected)) {
        $this.removeClass(classSelected);
        $this.siblings(classSelectedControl).hide();
        let code = $this.siblings(classSelectedControl).find('li.selected').find('.J-code-num').length > 0 ?
          $this.siblings(classSelectedControl).find('li.selected').find('.J-code-num').text() :
          $this.siblings(classSelectedControl).find('li.selected').text()
        let value = $this.siblings(classSelectedControl).find('li.selected').find('.J-code-num').length > 0 ?
          $this.siblings(classSelectedControl).find('li.selected').find('.J-code-num').text() : (
            $this.siblings(classSelectedControl).find('li.selected').attr('data') ?
              $this.siblings(classSelectedControl).find('li.selected').attr('data') :
              $this.siblings(classSelectedControl).find('li.selected').text())
        let url = $this.siblings(classSelectedControl).find('li.selected').data('href');
        if (url) {
          window.location.href = url;
        }
        if (code) {
          $(this).find('.dropdown-selected-text').text(code)
          $(this).find('.J-select-input').val(value)
          $this.siblings('.dropdown-label').css({
            'top': '8px',
            'font-size': '12px',
          })
          let str = translateTitle(code)
          $this.attr('aria-label', `${label} combo box- collapsed Selected ${str}`)
        } else {
          if (!$(this).find('.dropdown-selected-text').text()) {
            $this.siblings('.dropdown-label').css({
              'top': '20px',
              'font-size': '16px',
            })
            $this.attr('aria-label', `${label} combo box- collapsed nothing Selected`)
          }
        }
      } else {
        $this.parents().find('.J-selectTrigger').removeClass(classSelected);
        $this.parents().find('.J-selectedControl').hide();
        let initCode = $(this).find('.dropdown-selected-text').text();
        if (!initCode) {
          $this.siblings('.dropdown-label').css({
            'top': '8px',
            'font-size': '12px',
          })
          let str = translateTitle(initCode)
          $this.attr('aria-label', `${label} combo box- collapsed Selected ${str}`)
        }
        $this.addClass(classSelected);
        $this.siblings(classSelectedControl).show();
      }
    }
    $(classSelectTrigger).on('click', clickSelectTrigger);
    isTabEnter(classSelectTrigger, clickSelectTrigger);

    // hide dropdown item list
    $('body').on('click', function (e) {
      if ($(e.target).hasClass('J-selectTrigger') === false) {
        $(classSelectTrigger).removeClass(classSelected);
        $selectedControl.hide();
      }
    })

    let clickSelectedControl = function () {
      let $this = $(this);
      let text1 = $this.find('.J-code-num').length > 0 ? $this.find('.J-code-num').text() : $this.text();
      let text2 = $this.find('.J-code-num').length > 0 ? $this.find('.J-code-num').text() : (
        $this.attr('data') ? $this.attr('data') : $this.text()
      );
      let label = $this.parents(classSelectedControl).siblings('.dropdown-label').text()
      let url = $this.data('href');
      if (url) {
        window.location.href = url;
      }

      $this.siblings().removeClass(classSelected);
      $this.addClass(classSelected);
      $this.parents(classSelectedControl).siblings(classSelectTrigger).find(classSelectText).html(text1)
      $this.parents(classSelectedControl).siblings(classSelectTrigger).find(classSelectInput) ?
        $this.parents(classSelectedControl).siblings(classSelectTrigger).find(classSelectInput).val(text2) : ''
      $this.parents(classSelectedControl).hide();
      let str = translateTitle(text1)
      $this.parents(classSelectedControl).siblings(classSelectTrigger).attr('aria-label', `${label} combo box- collapsed Selected ${str}`)
    }

    $(classSelectedControl).on('click', '.option', clickSelectedControl);
    // keydown event
    $(classSelectTrigger).on('keydown', function (e) {
      let temp = 0;
      let SelectedControl = $(this).siblings(classSelectedControl),
        subSelectedControl = SelectedControl.find('li');
      for (let i = 0; i < subSelectedControl.length; i++) {
        if (subSelectedControl.eq(i).hasClass(classSelected)) {
          temp = i;
          break;
        }
      }
      let top = SelectedControl.scrollTop(),
        speed = subSelectedControl.eq(0).height();
      if (e.keyCode === 38) { // up
        e.preventDefault();
        subSelectedControl.removeClass(classSelected);
        if (temp !== 0) {
          temp = temp - 1;
        }
        subSelectedControl.eq(temp).addClass(classSelected);
        top = (top - speed) > 0 ? (top - speed) : 0
        SelectedControl.scrollTop(top)
      } else if (e.keyCode === 40) { // down
        e.preventDefault();
        subSelectedControl.removeClass(classSelected);
        if (temp !== subSelectedControl.length - 1) {
          temp = temp + 1;
        }
        subSelectedControl.eq(temp).addClass(classSelected);
        top = top + speed
        SelectedControl.scrollTop(top)
      }
    })
  }


}

export default isDropdown