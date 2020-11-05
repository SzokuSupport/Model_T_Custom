/*
* mileCashSlider
* */
import cartMileCashSlider from '../modules/cart/cartMilesSlide';
import cartPage from '../modules/cart/cartPage'

$(function () {
  cartMileCashSlider();
  cartPage();
  $(window).on('resize', function () {
    cartMileCashSlider();
  })
});