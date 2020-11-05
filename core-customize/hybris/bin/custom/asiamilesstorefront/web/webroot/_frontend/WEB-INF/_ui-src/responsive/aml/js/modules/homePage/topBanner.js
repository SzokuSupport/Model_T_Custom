import initSlick from '../../utils/initSlick';

//  top banner add slick, init slick
export default function topBanner(className) {

  initSlick(className, {
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: true,
    autoplay: true,
    autoplaySpeed: 5000,
    centerMode: true,
    centerPadding: '129px',
    responsive: [
      {
        breakpoint: 1280,
        settings: {
          centerPadding: '57px'
        }
      },
      {
        breakpoint: 768,
        settings: {
          centerMode: false,
          arrows: false,
          dots: true
        }
      }
    ]
  })
}