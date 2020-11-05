import './_header'
import './_footer'

/*
 ** init plp, call for product list when entering the page
 */
import init from '../modules/plp/init'

/*
 ** miles slider event in plp

/*
 ** filter product when user select category
 */
import controlFilterOfMobile from '../modules/plp/controlFilterOfMobile';

/*
 ** load more product when scroll to the bottom of the page
 */
import loadMoreProduct from '../modules/plp/loadMoreProduct';

/*
 ** when user ticker the check box, post message to backend,refresh product-list and filter list.
 */
import filterProduct from '../modules/plp/filterProduct';

/*
 ** when user select product sort way, post message to backend,refresh product-list and filter list.
 */
import sortProduct from '../modules/plp/sortProduct';

/*
 ** in filter product component, show less than five filters when user first enter the page
 */
import showMoreLess from '../modules/common/showMoreLess';

/*
 ** change image when user mourseover the image in product card
 */
import productCard from '../modules/common/productCard'

/*
 ** see all account tooltip
 */
import popup from '../utils/popup';

/*
 ** font-size in banner will be adjusted when browser size change
 */
import adjustText from '../utils/adjustText'
import autoMargin from '../modules/common/autoMargin';
import pushdata from '../modules/plp/pushdata'


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
  pushdata();
  autoMargin('.J-plp-main-content')
});