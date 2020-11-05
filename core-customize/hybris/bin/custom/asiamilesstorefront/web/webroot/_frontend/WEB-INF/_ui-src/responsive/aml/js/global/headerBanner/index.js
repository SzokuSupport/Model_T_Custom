import initSlick from '../../utils/initSlick';

export default function headerBanner() {
  const headerBannerSelector = '.J-header-banner-content';

  if ($(headerBannerSelector).length) {
    const autoplayInterval = $(headerBannerSelector).data('interval');

    initSlick(headerBannerSelector, {
      vertical: true,
      infinite: true,
      arrows: false,
      dots: false,
      autoplay: true,
      autoplaySpeed: autoplayInterval,
      pauseOnHover: true,
      swipe: false,
      touchMove: false,
      slidesToShow: 1,
      slidesToScroll: 1
    });

    // Temp fix for home page to remove white space
    const categoryNavigationClassName = '.J-category';
    if ($(categoryNavigationClassName).length) {
      $(categoryNavigationClassName).addClass('navigation-with-header-banner');
    }
    const topBannerClassName = '.J-topBanner';
    if ($(topBannerClassName).length) {
      $(topBannerClassName).addClass('top-banner-with-header-banner');
    }
  }
}
