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

function stepNavSlides() {
  initSlick('.J-nav-step', {
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: true
  })
}

export default stepNavSlides