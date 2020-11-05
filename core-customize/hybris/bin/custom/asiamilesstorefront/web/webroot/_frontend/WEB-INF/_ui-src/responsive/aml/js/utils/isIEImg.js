import isIE from './isIE';

export default function isIEImg(className) {
  if (isIE()) {
    if (className) {
      if ($(className).find('.ImgToBg').length) {
        $(className).find('.ImgToBg').removeClass('whiteBg')
        replaceImg($(className).find('.ImgToBg'))
      }
    } else {
      if ($('.ImgToBg').length) {
        $('.ImgToBg').removeClass('whiteBg')
        replaceImg($('.ImgToBg'))
      }
    }
  } else {
    if (className) {
      if ($(className).find('.ImgToBg').length) {
        $(className).find('.ImgToBg').addClass('whiteBg')
      }
    } else {
      if ($('.ImgToBg').length) {
        $('.ImgToBg').addClass('whiteBg')
      }
    }
  }
}
// background-img replace img
function replaceImg($selector) {
  $selector.each(function () {
    if ($(this).find('img').length === 1) {
      $(this).css({
        'background-image': function () {
          let b = $(this).find('img').attr('src');
          $(this).find('img').remove();
          return 'url(' + b + ')';
        }
      });
    } else if ($(this).find('img').length === 2) {
      let a = $(this).find('img').eq(0).attr('src');
      let b = $(this).find('img').eq(1).attr('src');
      $(this).css({
        'background-image': function () {
          $(this).find('img').remove();
          return 'url(' + a + ')';
        }
      });
      $(this).hover(function () {
        $(this).css({
          'background-image': function () {
            return 'url(' + b + ')';
          }
        });
      }, function () {
        $(this).css({
          'background-image': function () {
            return 'url(' + a + ')';
          }
        });
      })
    } else {
      return false
    }
  });
}