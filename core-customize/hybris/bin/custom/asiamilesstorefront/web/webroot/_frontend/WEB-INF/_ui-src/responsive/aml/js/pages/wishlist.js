import './_header'
import './_footer'
import wishListPage from '../modules/wishList/wishLisPage';

import popup from '../utils/popup';

import loadMoreData from '../utils/loadMoreData';


$(function () {
  wishListPage();
  loadMoreData('wishlist');
  popup('.J-removeCartPopup', '.J-close-popup');
});