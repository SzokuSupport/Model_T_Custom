export default function verification() {
  let flag = true
  $('.J-verification').on('click', function () {
    if (!flag) {
      return
    }
    flag = false
    let $this = $(this),
      $show = $('.J-send-btn'),
      $hide = $('.J-send-disBtn'),
      $errorMes1 = $('.J-error-message1'),
      $errorMes2 = $('.J-error-message2'),
      $errorMes3 = $('.J-error-message3'),
      $errorCodes = $('.J-error-code'),
      $backHome = $('.J-backHome'),
      $verify = $('.J-verification'),
      $formHidden = $('#paymentFormDiv'),
      $errorBox = $('.J-warning-box'),
      code = $('.J-code').val(),
      url = $this.data('url');
    if (!code) {
      return
    }
    $errorBox.hide();
    $errorMes1.hide();
    $errorMes2.hide();
    $errorMes3.hide();
    $errorCodes.hide();
        
    $.ajax({
      url: url,
      method: 'post',
      data: {
        'CSRFToken': ACC.config.CSRFToken,
        'smsCode': code
      },
      dataType: 'json',
      async: true,
      success: function (data) {
        flag = true
        if (data.code && data.code === 9999) { // not login or token overtime
          window.location.href = data.redirectUrl;
          return;
        }
        switch (data.status) {
          case 'success':
            $formHidden.empty();
            $formHidden.append(data.paymentRequestForm);
            $formHidden.find('#paymentRequestForm').submit();
            break;
          case 'error':
            if (data.code === 'errorTime2') {
              $errorBox.show();
              $errorMes2.show();
              $show.hide();
              $hide.show();
              $verify.hide();
              $backHome.show();
            } else if (data.code === 'errorTime3') {
              $errorBox.show();
              $errorMes3.show();
            } else if (data.code === 'errorCode') {
              $errorCodes.show();
            }
            break;
          case 'redirect:':
            window.location.href = data.requestUrl;
            break;
        }

      },
      error: function () {
        return false
      }
    })
  })
  // back to home button event
  $('.J-backHome').on('click', function () {
    let language = window.location.pathname.split('/')[1];
    let url = '/' + language;
    window.location.href = url;
  })
}