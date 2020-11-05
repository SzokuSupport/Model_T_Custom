export default function localToggle(selector) {
  let $selector = $(selector),
    $localFlag = $('.J-local-flag');
    // local language init
  for (let i = 0; i < $localFlag.length; i++) {
    if ($localFlag.eq(i).val() === 'true') {
      $($selector.eq(i).children('input')[0]).prop('checked', true);
      $selector.eq(i).parent().parent().parent().next('.J-localLanguage').show()
    }
  }
  // change local language states
  $selector.on('click', function () {
    let $language = $(this).parent().parent().parent().next('.J-localLanguage');
    if ($(this).children('input')[0].checked) {
      $localFlag.val('true');
      $language.show()
    } else {
      $localFlag.val('false');
      $language.hide()
    }

  })
}