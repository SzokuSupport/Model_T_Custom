export default function need() {
  let $email = $('#emailNeed'),
    $SMS = $('#SMSNeed'),
    $email2 = $('#emailNeedOther'),
    $SMS2 = $('#SMSNeedOther'),
    $emailSelfBox = $('.J-email-need-self'),
    $emailOtherBox = $('.J-email-need-other'),
    $SMSOtherBox = $('.J-SMS-need-other'),
    $SMSSelfBox = $('.J-SMS-need-self');
    // Show or hide based on the value of page init
  if ($email.eq(0).val() === 'true') {
    $emailSelfBox.eq(0).show()
  } else {
    $emailSelfBox.eq(0).hide()
  }

  if ($SMS.eq(0).val() === 'true') {
    $SMSSelfBox.eq(0).show()
  } else {
    $SMSSelfBox.eq(0).hide()
  }

  if ($email2.eq(0).val() === 'true') {
    $emailOtherBox.eq(0).show()
  } else {
    $emailOtherBox.eq(0).hide()
  }

  if ($SMS2.eq(0).val() === 'true') {
    $SMSOtherBox.eq(0).show()
  } else {
    $SMSOtherBox.eq(0).hide()
  }
}