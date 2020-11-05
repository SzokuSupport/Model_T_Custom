// input componment focus animation
export default function inputFocus(selector) {
  let $selector = $(selector),
    $input = $selector.children('input');
  for (let i = 0; i < $input.length; i++) {
    if ($input.eq(i).val()) {
      $input.eq(i).parent().find('.J-input-placeholder').css({
        'top': '7px',
        'font-size': '12px'
      })
    } else {
      $input.eq(i).parent().find('.J-input-placeholder').css({
        'top': '20px',
        'font-size': '16px'
      })
    }
  }
  $selector.on('click', function () {
    $(this).children('input').focus()
    $(this).find('p').hide()
  })
  $input.on('focus', function () {
    $(this).parent().find('.J-input-placeholder').css({
      'top': '7px',
      'font-size': '12px'
    })
  })
  $input.on('blur', function () {
    if ($(this).val()) {
      return
    } else {
      $(this).parent().find('.J-input-placeholder').css({
        'top': '20px',
        'font-size': '16px'
      })
    }
  })
}