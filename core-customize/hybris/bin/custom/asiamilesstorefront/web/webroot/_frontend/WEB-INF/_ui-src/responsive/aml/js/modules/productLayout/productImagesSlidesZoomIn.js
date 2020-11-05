/**
* optimized @9 May, linda.zhu
* level 1
* @description product detail images slick
* usage:
*
* @param {string} selector
* selector:
* $('.J-sliderNav');$('.J-sliderFor')
*
* */
import initSlick from '../../utils/initSlick';

function productImagesSlidesZoomIn() {
  $('.J-zoomIn-mask').show()
  let index = $('.J-sliderFor .item-list').index($('.J-sliderFor .slick-active .item-list'));
  initSlick('.J-sliderZoomIn', {
    infinite: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: true
  })
  $('.J-sliderZoomIn')[0].slick.slickGoTo(index)
  setTimeout(function () {
    $('.J-zoomIn-mask').hide()
  }, 500)
}

export default productImagesSlidesZoomIn