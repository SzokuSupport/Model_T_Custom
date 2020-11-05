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

import updatedSVG from '../common/updatedSVG';
import initSlick from '../../utils/initSlick';
// import onYouTubeIframeAPIReady from "./onYouTubeIframeAPIReady";

function productImagesSlides() {
  initSlick('.J-sliderNav', {
    accessibility: true,
    slidesToShow: 3,
    slidesToScroll: 1,
    asNavFor: '.J-sliderFor',
    vertical: true,
    centerMode: true,
    centerPadding: 0,
    focusOnSelect: true,
    infinite: false,
  }, function () {
    updatedSVG();
    $('.slick-arrow').attr('tabindex', '-1');
  });

  if ($('.J-sliderNav .item-list').length <= '3') {
    $('.J-sliderNav').css({'padding-top': 0, 'margin-top': '-7.5px'})
  }


  initSlick('.J-sliderFor', {
    accessibility: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    asNavFor: '.J-sliderNav',
    infinite: false,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          fade: false,
          dots: true
        }
      }
    ]
  }, function (that) {
    // onYouTubeIframeAPIReady();
  });
  

}

export default productImagesSlides
