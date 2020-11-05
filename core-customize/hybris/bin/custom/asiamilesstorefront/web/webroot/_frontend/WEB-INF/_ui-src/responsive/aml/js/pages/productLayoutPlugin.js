/*
 * product image slick
 * */
import productImagesSlides from '../modules/productLayout/productImagesSlides';

/*
 * product image slick zoom in
 * */
import productImagesSlidesZoomIn from '../modules/productLayout/productImagesSlidesZoomIn';

/*
 * add slick for bundle componet on desktop
 * */
import bundleCard from '../modules/productLayout/bundleCard';

/*
 * mileCashSlider
 * */
import mileCashSlider from '../modules/productLayout/mileCashSlider';
import popup from '../utils/popup';
import promotionMultiple from '../modules/cart/promotionMultiple'
import bubblingStatic from '../modules/common/bubblingStatic';
import homeProductCard from '../modules/homePage/homeProductCard';

$(function () {
  let registerPopup = function () {
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
  }

  productImagesSlides();
  mileCashSlider();
  bundleCard();
  popup('.J-zoomInImages', '.J-close-tooltip', function () {
    productImagesSlidesZoomIn()
  });
  registerPopup();
  homeProductCard('.J-homeProductCard', true);
  $(window).resize(function () {
    productImagesSlides();
    mileCashSlider();
    bundleCard();
    popup('.J-zoomInImages', '.J-close-tooltip', function () {
      productImagesSlidesZoomIn()
    });
    registerPopup();
  });

  promotionMultiple('.J-promo-popup-multiple');
  bubblingStatic('.J-cash-spending-from');
});