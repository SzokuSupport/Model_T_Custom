import './_header'
import './_footer'

/*
* share with
* */
import shareThis from '../modules/productLayout/shareThis';

/*
* show more for tab change in pdp
* */
import showMoreForTabChange from '../modules/productLayout/showMoreForTabChange';

/*
* when user click add to cart button
* */
import addToCart from '../modules/productLayout/addToCart'


/*
* when user click wish list  show message
* */
// import wishListShowMessage from "../modules/productLayout/wishListMes";

import isSmallScreen from '../utils/isSmallScreen';
import tabChange from '../utils/tabChange';
import accordion from '../utils/accordion';
import productCard from '../modules/common/productCard'
import pushdata from '../modules/productLayout/pushdata'
import bubbling from '../modules/common/bubbling'
// import _onYouTubeIframeAPIReady from "../modules/productLayout/_onYouTubeIframeAPIReady"


$(function () {
  addToCart();
  bubbling();
  productCard();
  if (!isSmallScreen()) {
    tabChange('.J-productDetailTab', '.J-productDetailControl', 'selected');
    showMoreForTabChange();
  } else {
    accordion('.J-selectTrigger', '.J-information', 'selected')
  }
  shareThis();
  pushdata()
});