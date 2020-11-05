import initSlick from '../../utils/initSlick';


export default function homeProductCard(className, isInfinite) {

  initSlick(className, {
    infinite: typeof isInfinite === 'undefined' ? false : isInfinite,
    slidesToShow: 4,
    slidesToScroll: 4,
    arrows: true,
    // autoplay: true,
    // autoplaySpeed: 5000,
    responsive: [
      {
        breakpoint: 1280,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3
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
  $('.product-card').removeAttr('tabindex')
}

function announcement(className) {
  let $selector = $(className)
  let title = $.trim($selector.siblings('h3').text())
  $selector.find('.slick-prev').attr('aria-label', `${title}- Clickable Previous `)
  $selector.find('.slick-next').attr('aria-label', `${title}- Clickable Next `)
}
