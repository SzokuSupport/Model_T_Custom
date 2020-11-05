import promotionProductCard from '../modules/homePage/promotionProductCard'
import homeProductCard from '../modules/homePage/homeProductCard'
import promotionBrands from '../modules/homePage/promotionBrands'
import promotionFullWidth from '../modules/homePage/promotionFullWidth'
import topBanner from '../modules/homePage/topBanner'
import mileSlider from '../modules/homepage/mileSelectSlider'
import exploreMore from '../modules/homePage/exploreMore'
import duo from '../modules/homePage/duo'
import trio from '../modules/homePage/trio'
import faq from '../modules/homePage/faq'
import hideLoading from '../utils/hideLoading'

$(function () {
  topBanner('.J-topBanner')
  mileSlider()
  exploreMore();
  promotionProductCard('.J-latestGadgets', false)
  promotionProductCard('.J-inspiration', true)
  promotionBrands('.J-promotionBrands')
  promotionFullWidth('.J-promotionFullWidth', true)
  promotionFullWidth('.J-promotionBanner', true)
  promotionFullWidth('.J-promotionVideo', false)
  homeProductCard('.J-homeProductCard', true)
  duo('.J-duo', false)
  trio('.J-trio', false)
  faq('.J-faq-collapse')
  $(window).resize(function () {
    mileSlider()
  });

  // hide loading img
  hideLoading('.J-loading-overLayout')
})