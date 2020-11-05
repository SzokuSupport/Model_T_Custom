import isSmallScreen from '../utils/isSmallScreen'

$(function () {
  function autoPadding() {
    if (isSmallScreen()) {
      $('.maintenance__right').css('paddingTop', '60px')
    } else {
      let height = $('.maintenance').height(),
        imgHeight = $('.maintenance__right').height();
      if (height > imgHeight) {
        let padding = (height - imgHeight) / 2;
        $('.maintenance__right').css('paddingTop', `${padding}px`)
      }
    }
        
  }
  $(window).on('resize', function () {
    autoPadding()
  });
  autoPadding()
});