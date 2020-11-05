import isSmallScreen from '../../utils/isSmallScreen';

export default function showAlertMsg(selectorClass, alertMsgClass) {


  let $alertMsgBox = $(alertMsgClass),
    alertClock;

  $(document).on('click', selectorClass, function () {
    let length = $(this).parent().parent().find('.voucher-expired').length;
    // when voucher-expired existence, prohibition of sending requests
    if (length > 0) {
      return;
    }

    /* when click the copy button, copy the number to clipboard */
    if ('.J-copyNumBtn' === selectorClass) {
      // copy function
      let range = document.createRange();
      range.selectNode($(this).siblings('.J-courierNum')[0]);

      let selection = window.getSelection();
      if (selection.rangeCount > 0) selection.removeAllRanges();
      selection.addRange(range);
      document.execCommand('Copy');
    }

    if ('.J-resendBtn' === selectorClass) {
      let url = $(this).parent().siblings('.J-resendVoucher').val();
      $.ajax({
        url: url,
        type: 'get',
        dataType: 'json',
        async: true,
        success: function success(data) {
          console.log(data, 'success');
        },
        error: function error(data) {
          console.log(data, 'error');

        }
      })
    }

    /* when click the selected button, an alert message scroll up from bottom */
    if (isSmallScreen()) {
      $alertMsgBox.css({ // /////////////////////////////********************************************************************* */
        bottom: '0',
        opacity: '1',
        transition: 'bottom 0.5s'
      });
    } else {
      $alertMsgBox.css({
        bottom: '20px',
        opacity: '1',
        transition: 'bottom 0.5s'
      });
    }

    /* the alert message disappear after 5 seconds */
    alertClock = setTimeout(function () {
      $alertMsgBox.css({
        'bottom': '-50px',
        'opacity': 0
      });
    }, 5000);
  });

  /* if mouse over the alert message, it will keep display */
  $alertMsgBox.on('mouseover', function () {
    clearTimeout(alertClock);
  });

  /* if mouse out of the alert message, it will disappear after 5 seconds */
  $alertMsgBox.on('mouseout', function () {
    alertClock = setTimeout(function () {
      $alertMsgBox.css({'bottom': '-50px', 'opacity': '0'});
    }, 5000);
  });
}