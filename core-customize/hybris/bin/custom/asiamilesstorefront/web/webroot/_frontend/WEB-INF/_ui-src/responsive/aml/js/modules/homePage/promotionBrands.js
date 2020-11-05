import initSlick from '../../utils/initSlick';


export default function promotionBrands(className) {

  initSlick(className, {
    infinite: false,
    slidesToShow: 4,
    slidesToScroll: 4,
    prevArrow: '<button class="slick-prev" tabindex="0" event_component="Top Brands" event_value="nav:left"><svg class="icon-back" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M8 12c0-.238.076-.478.226-.66L15.912 2 17 3.321 9.856 12 17 20.68 15.912 22l-7.686-9.339A1.045 1.045 0 0 1 8 12"/></g></svg></button>',
    nextArrow: '<button class="slick-next" tabindex="0" event_component="Top Brands" event_value="nav:right"><svg class="icon-next" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24"><g fill-rule="evenodd" transform="translate(7.188 2)"><path transform="matrix(-1 0 0 1 10.625 0)" d="M.813 10c0-.238.075-.478.225-.66L8.724 0l1.088 1.321L2.668 10l7.144 8.68L8.724 20l-7.686-9.339A1.045 1.045 0 0 1 .812 10"/><mask><path d="M.813 10c0-.238.075-.478.225-.66L8.724 0l1.088 1.321L2.668 10l7.144 8.68L8.724 20l-7.686-9.339A1.045 1.045 0 0 1 .812 10"/></mask></g></svg></button>',
    arrows: true,
    // autoplay: true,
    // autoplaySpeed: 5000,
    responsive: [{
      breakpoint: 1280,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3
      }
    }, {
      breakpoint: 768,
      settings: {
        slidesToShow: 2,
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
  $('.promotion-brands-card').removeAttr('tabindex')
}

function announcement(className) {
  let $selector = $(className)
  let title = $.trim($selector.siblings('h3').text())
  $selector.find('.slick-prev').attr('aria-label', `${title}- Clickable Previous `)
  $selector.find('.slick-next').attr('aria-label', `${title}- Clickable Next `)
}