import isSmallScreen from '../../utils/isSmallScreen'

export default function countryCode() {
  let $country = $('.J-country-code'),
      arr = [];
  for (let i = 0; i < $('.J-country-code').eq(0).find('.J-selectedControl').children('ul').children('li').length; i++) {
    let name = $.trim($('.J-country-code').eq(0).find('.J-selectedControl').children('ul').children('li').eq(i).find('span').eq(0).text()),
        code = $.trim($('.J-country-code').eq(0).find('.J-selectedControl').children('ul').children('li').eq(i).find('.J-code-num').text());
    arr.push(`${name}-${code}`)
  }
  $country.on('click', function () {
    $(this).find('.J-error-box').hide()
    let $scrollBox = $(this).find('.J-selectedControl'),
      $code = $(this).find('.J-code'),
      $codeInput = $(this).find('.J-select-input'),
      // height = $scrollBox.children('ul').children('li').height(),
      flag = $scrollBox.css('display') === 'none'; // expend shrink

    if (flag) {
      if ($code.text()) {
        $(this).find('label').css({
          'top': '8px',
          'font-size': '12px'
        })
      } else {
        $(this).find('label').css({
          'top': '20px',
          'font-size': '16px'
        })
      }
    } else {
      $(this).find('label').css({
        'top': '8px',
        'font-size': '12px'
      })
    }
    // filter by keyCode[0-9,a-z]
    $('.J-country-code').on('keydown', function (e) {
      if (!flag && ((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 65 && e.keyCode <= 90) || (e.keyCode >= 96 && e.keyCode <= 105))) {
        $scrollBox.html('');
        let scrollBoxHtml = '';
        for(let i = 0;i < arr.length;i++){
          let newArr = arr[i].split('-');
          if(e.key === newArr[0].substring(0,1).toLocaleLowerCase() || e.key === newArr[1].substring(0,1)){
            scrollBoxHtml += `<li class="option" role="option" data-href=""><a class="link" href="javascript:;"><span>${newArr[0]}</span>&nbsp;<span class="J-code-num">${newArr[1]}</span></a></li>`
          }
        }
        $scrollBox.html('<ul class="listbox" role="listbox" aria-expanded="true">'+scrollBoxHtml+'</ul>');
        $scrollBox.children('ul').children('li').removeClass('selected');
        $scrollBox.children('ul').children('li').eq(0).addClass('selected');
        let code = $scrollBox.children('ul').children('li').eq(0).find('.J-code-num').text();
        $code.text(code);
        $codeInput.val(code);
        $scrollBox.scrollTop(0)
      }
    })
  })

  $('body').on('click', function (e) {
    if ($(e.target).hasClass('J-selectTrigger') === false) {
      for (let i = 0; i < $country.length; i++) {
        let text = $country.eq(i).find('.J-code').text()
        if (text) {
          $country.eq(i).find('label').css({
            'top': '8px',
            'font-size': '12px'
          })
        } else {
          $country.eq(i).find('label').css({
            'top': '20px',
            'font-size': '16px'
          })
        }
        $country.eq(i).find('.J-selectTrigger').removeClass('selected');
        $country.eq(i).find('.J-selectedControl').hide();
      }
    }
  })

  $('.J-form-verification').on('click', function (e) {
    let curForm = '#' + $(this).parents('form').attr('id'),
      $inputSelect = $(curForm).find('.J-country-code'),
      scroll_offset;
    for (let i = 0; i < $inputSelect.length; i++) {
      let codeVal = $inputSelect.eq(i).find('.J-code').text();
      if (!codeVal) {
        $inputSelect.eq(i).find('.J-error-box').css('display', 'block');
        scroll_offset = (scroll_offset ? scroll_offset : $inputSelect.eq(i).offset().top);
      }
    }
    if (scroll_offset) {
      $( window ).scrollTop( parseInt(scroll_offset - (isSmallScreen() ? 150 : 100)) );
      return false
    } else {
      $(curForm).submit()
    }
  })
}