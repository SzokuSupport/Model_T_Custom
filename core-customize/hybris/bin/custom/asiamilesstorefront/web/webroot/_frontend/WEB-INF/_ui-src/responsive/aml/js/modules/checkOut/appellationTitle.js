import isSmallScreen from '../../utils/isSmallScreen';

/*
 * 1.check out step one title dropDown
 * 2.non-null validation, prompt information
 * 3.submit non-space-time validation and locate the error location
 */
export default function appellationTitle(id) {
  let $appellation = $(id).find('.J-appellation-title'),
    $select = $appellation.find('.J-selectedAppellationControl'),
    $dropDownLabel = $appellation.find('.J-dropdown-label'),
    $selectedControlMobileApp = $('.J-appellationSelectMobile');

  let valueCode = $appellation.find('.J-code-span').text();
  if (valueCode != '') {
    $dropDownLabel.removeClass('dropdown-label-null');
    $(id).find('.J-appellation-title').find('.J-error-box').css('display', 'none');
  } else {
    $(id).find('.J-appellation-title').find('.J-error-box').css('display', 'none');
  }

  $appellation.on('click', function () {
    $appellation.find('.J-selectedAppellationControl').show();
    let $scrollBox = $(this).find('.J-selectedAppellationControl');
    let arr = [];
    $dropDownLabel.removeClass('dropdown-label-null');
    for (let i = 0; i < $scrollBox.children('ul').children('li').length; i++) {
      arr.push({key: $scrollBox.children('ul').children('li').eq(i).attr('data'), value: $.trim($scrollBox.children('ul').children('li').eq(i).find('.J-code-title').text())});
    }
    let codeVal = $(this).find('.J-code-span').text();
    if (codeVal != '') {
      $(id).find('.J-appellation-title').find('.J-error-box').css('display', 'none');
    } else {
      $(id).find('.J-appellation-title').find('.J-error-box').css('display', 'block');
    }
  })

  $('body').on('click', function (e) {
    let valueCode = $appellation.find('.J-code-span').text();
    if ($(e.target).hasClass('J-selectTrigger') === false) {
      $appellation.find('.J-selectTrigger').removeClass('selected');
      if (valueCode == '') {
        $dropDownLabel.addClass('dropdown-label-null');
      }
      $appellation.find('.J-selectedAppellationControl').hide();
    }
  })

  $('.J-form-verification').on('click', function () {
    if ($(id).find('.J-appellation-title').length > 0) {
      let codeVal = $(id).find('.J-appellation-title').find('.J-code-span').text();
      if (codeVal == '') {
        $(id).find('.J-appellation-title').find('.J-error-box').css('display', 'block');
        let scroll_offset = $(id).find('.J-appellation-title').offset().top;
        $( window ).scrollTop( parseInt(scroll_offset - (isSmallScreen() ? 150 : 100)) );
      }
    }
  })


  let getSelectValue = function () {
    let selectContorl = isSmallScreen() ? $selectedControlMobileApp : $select
    for (let i = 0; i < selectContorl.length; i++) {
      let _selector = isSmallScreen() ? 'option:selected' : '.option.selected';
      let text = isSmallScreen() ? (selectContorl.eq(i).find(_selector).length > 0 ? selectContorl.eq(i).find(_selector).text() : '') : (
        selectContorl.eq(i).find(_selector).find('.J-code-title').length > 0 ?
          selectContorl.eq(i).find(_selector).find('.J-code-title').text() :
          selectContorl.eq(i).find(_selector).text());
      $appellation.find('.dropdown-selected-title-text').eq(i).html(text);
      $appellation.find('.J-select-appInput').length === 1 ? $appellation.find('.J-select-appInput').eq(i).val(text) : '';
    }

    let valueCode = $appellation.find('.J-code-span').text();
    if (valueCode != '') {
      $dropDownLabel.removeClass('dropdown-label-null');
      $(id).find('.J-appellation-title').find('.J-error-box').css('display', 'none');
    } else {
      $dropDownLabel.addClass('dropdown-label-null');
      $(id).find('.J-appellation-title').find('.J-error-box').css('display', 'none');
    }
  }

  getSelectValue();

  $(window).resize( function () {
    getSelectValue();
  });

  let clickSelectedControl = function () {
    let $this = $(this);
    let text = $this.find('.J-code-title').length > 0 ? $this.find('.J-code-title').text() : $this.text();
    let value = $this.attr('data');
  
    $this.siblings().removeClass('selected');
    $this.addClass('selected');
    $this.parents('.J-selectedAppellationControl').siblings('.J-selectTrigger').find('.J-code-span').html(text);
    $this.parents('.J-selectedAppellationControl').siblings('.J-selectTrigger').find('.J-select-appInput') ?
      $this.parents('.J-selectedAppellationControl').siblings('.J-selectTrigger').find('.J-select-appInput').val(value) : ''
    $this.parents('.J-selectedAppellationControl').hide();
  }
  
  $appellation.find('.J-selectedAppellationControl').find('.option').on('click', clickSelectedControl);
}

/**
 * end check out step one title dropDown
 */