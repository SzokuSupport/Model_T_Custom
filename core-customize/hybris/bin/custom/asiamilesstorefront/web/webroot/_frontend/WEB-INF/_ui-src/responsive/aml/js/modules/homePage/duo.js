import initSlick from '../../utils/initSlick';


export default function duo(className, isInfinite) {

  initSlick(className, {
    infinite: isInfinite,
    slidesToShow: 2,
    slidesToScroll: 1,
    arrows: false,
    responsive: [{
      breakpoint: 1280,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1
      }
    }, {
      breakpoint: 768,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        variableWidth: true
      }
    }]
  }, function () {
    _removeTabindex();
    announcement(className)
  })

}

function _removeTabindex() {
  $('.promotion-product-card').removeAttr('tabindex')
}

function announcement(className) {
  // event tracking
  $(className).find('.promotion-product-card').attr('event_value', `Duo component`);
}