import './_header'
import './_footer'
import showDelivery from '../modules/order/showDelivery';
import showAlertMsg from '../modules/order/showAlertMsg';
import bubblingStatic from '../modules/common/bubblingStatic';


$(function () {
  bubblingStatic('.J-earn-miles-bubbling');

  /* show detail information of order items */
  showDelivery()

  /* click copy button, show popup */
  showAlertMsg('.J-copyNumBtn', '.J-numCopied')

  /* click resent button, show popup */
  showAlertMsg('.J-resendBtn', '.J-voucherResent')
  $(window).on('resize', function () {

    /* show detail information of order items */
    showDelivery()

    /* click copy button, show popup */
    showAlertMsg('.J-copyNumBtn', '.J-numCopied')

    /* click resent button, show popup */
    showAlertMsg('.J-resendBtn', '.J-voucherResent')
  })
});