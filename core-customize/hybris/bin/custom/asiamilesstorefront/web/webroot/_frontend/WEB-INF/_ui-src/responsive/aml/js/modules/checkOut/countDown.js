/*
 * 1.Verification code countdown
 * 2.When the validation code exceeds the upper limit this time, an error message is displayed.
 */
export default function countDown(selector, num) {
  let $selector = $(selector),
    $again = $('.J-count-again'),
    $warnBox = $('.J-warning-box'),
    $show = $('.J-send-btn'),
    $hide = $('.J-send-disBtn'),
    $errorMessage1 = $('#errorMessage1'),
    $errorMes1 = $('.J-error-message1'),
    $errorMessage2 = $('#errorMessage2'),
    $errorMes2 = $('.J-error-message2'),
    $errorMessage3 = $('#errorMessage3'),
    $errorMes3 = $('.J-error-message3'),
    $errorCode = $('#errorCode'),
    $errorCodes = $('.J-error-code'),
    $backHome = $('.J-backHome'),
    $verify = $('.J-verification');

  if ($errorMessage2.val() === 'true' || $errorMessage1.val() === 'true') {
    $warnBox.show();
    if ($errorMessage2.val() === 'true') {
      $errorMes2.show();
      $backHome.removeClass('disappear');
      $verify.addClass('disappear')
    } else if ($errorMessage1.val() === 'true') {
      $errorMes1.show()
    }
  } else if ($errorCode.val() || $errorMessage3.val() === 'true') {
    if ($errorCode.val() === 'true') {
      $errorCodes.show()
    } else if ($errorMessage3.val() === 'true') {
      $warnBox.show();
      $errorMes3.show()
    }
    let init = num ? num : parseInt($selector.text())
    $selector.text(timeParse(init));
    if (init === 0) {
      return false
    }
    $selector.parent().show();
    $again.hide();
    $show.hide();
    $hide.show();
    let timer = setInterval(function () { // countdown
      init -= 1;
      if (init <= 0) {
        $selector.parent().hide();
        $again.show();
        $show.show();
        $hide.hide();
        clearInterval(timer);
        return
      }
      $selector.text(timeParse(init))
    }, 1000)
  }

  function timeParse(init) { // format time
    let minute = Math.floor(init / 60);
    let second = (init % 60) ? ((init % 60) >= 10 ? (init % 60) : '0' + (init % 60)) : '00';
    return minute + ':' + second
  }
}