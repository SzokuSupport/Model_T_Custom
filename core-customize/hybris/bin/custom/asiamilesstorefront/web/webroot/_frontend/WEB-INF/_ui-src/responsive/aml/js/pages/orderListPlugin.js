/*
 ** load more order when scroll to the bottom of the page
 */
import loadMoreOrder from '../modules/order/loadMoreOrder';

/*
 ** init order list
 */
import init from '../modules/order/init'


$(function () {
  init();
  loadMoreOrder()
});