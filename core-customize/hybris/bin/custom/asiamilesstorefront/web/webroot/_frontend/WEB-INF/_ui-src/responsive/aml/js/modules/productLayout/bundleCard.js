/**
* optimized @9 May, linda.zhu
* level 1
* @description bundleCard slick for product detail page
* usage:
*
* @param {string} selector
* selector:
* $('.J-bundleCard')
*
* */
import updatedSVG from '../common/updatedSVG';
import initSlick from '../../utils/initSlick';

function bundleCard() {

  initSlick('.J-bundleCard', {
    slidesToShow: 3,
    slidesToScroll: 1,
    arrows: true,
    infinite: false,
    // variableWidth: true,
    responsive: [
      {
        breakpoint: 768,
        settings: 'unslick'
      }]
  }, function () {
    updatedSVG();
    _removeTabindex();
  })
    
}

function _removeTabindex() {
  $('.bundle-card').removeAttr('tabindex')
}

export default bundleCard