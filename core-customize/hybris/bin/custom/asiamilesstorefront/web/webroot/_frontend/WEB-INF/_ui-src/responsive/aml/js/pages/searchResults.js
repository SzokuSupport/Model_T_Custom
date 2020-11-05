import './_header'
import './_footer'

/*
 ** init plp, call for product list when entering the page
 */
import init from '../modules/searchPage/init'

/*
 ** filter product when user select category
 */
import controlFilterOfMobile from '../modules/searchPage/controlFilterOfMobile';

/*
 ** load more product when scroll to the bottom of the page
 */
import loadMoreProduct from '../modules/searchPage/loadMoreProduct';

/*
 ** when user ticker the check box, post message to backend,refresh product-list and filter list.
 */
import filterProduct from '../modules/searchPage/filterProduct';

/*
 ** when user select product sort way, post message to backend,refresh product-list and filter list.
 */
import sortProduct from '../modules/searchPage/sortProduct';

/*
 ** in filter product component, show less than five filters when user first enter the page
 */
import showMoreLess from '../modules/common/showMoreLess';

/*
 ** change image when user mourseover the image in product card
 */
import productCard from '../modules/common/productCard'
import autoMargin from '../modules/common/autoMargin';

/*
 ** see all account tooltip
 */
import popup from '../utils/popup';

/*
 ** font-size in banner will be adjusted when browser size change
 */
import adjustText from '../utils/adjustText'


$(function () {
  init()
  $(window).on('resize', function () {
    init()
    adjustText('.product-banner-withImg__title');
  });
  controlFilterOfMobile();
  filterProduct();
  sortProduct();
  loadMoreProduct();
  showMoreLess();
  productCard();
  adjustText('.product-banner-withImg__title');
  popup('.J-offer-details', '.J-close-tooltip', function () {
    $(document).ready(function () {
      $('.J-tabs-item').each(function () {
        $(this).on("click", function(){
          $('.tabs_tab-item').removeClass('selected');
          $(this).parent().addClass('selected');

          let tabId = $(this).data('tabId');
          // window.console.log('tabId: ', tabId);

          $('.J-popup-tooltip-details').hide();
          $('#' + tabId).show();
        });
      })
    });
  });
  autoMargin('.J-plp-main-content')
});