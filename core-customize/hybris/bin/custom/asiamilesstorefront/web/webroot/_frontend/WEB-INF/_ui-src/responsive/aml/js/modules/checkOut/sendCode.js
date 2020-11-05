import countDown from './countDown'

/*
 * Send Verification Code
 */
export default function sendCode(selector) {
  let $selector = $(selector),
    $again = $('.J-count-again'),
    $warnBox = $('.J-warning-box'),
    $code = $('.J-count-down').parent(),
    $show = $('.J-send-disBtn'),
    $error = $('.J-error-message1'),
    url = $selector.data('url');

  $selector.on('click', function () {
    $.ajax({
      url: url,
      type: 'get',
      dataType: 'json',
      async: true,
      success: function (data) {
        let obj = JSON.parse(data);
        if (obj.reSendCountDown) {
          $error.hide()
          $again.hide()
          $selector.hide()
          $show.show()
          $code.show()
          $warnBox.hide()
          countDown('.J-count-down', obj.reSendCountDown)
        } else if (obj.errorTime) {
          $selector.hide()
          $show.show()
          $error.show()
          $warnBox.show()
        } else {
          return false
        }
      },
    })
  })
}