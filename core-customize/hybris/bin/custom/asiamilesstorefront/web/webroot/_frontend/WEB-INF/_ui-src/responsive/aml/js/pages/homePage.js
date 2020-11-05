import './_header'
import './_footerNoHideLoading'

import shareSearchBoxThis from '../modules/homePage/searchBox'
import popup from '../utils/popup';

/*
 ** change image when user mourseover the image in product card
 */
import productCard from '../modules/common/productCard'

$(function () {
  shareSearchBoxThis()
  productCard();
  popup('.J-see-all-discount', '.J-close-tooltip');
});