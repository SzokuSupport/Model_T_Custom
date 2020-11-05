
import initSlick from "../../utils/initSlick";

/**
 * campaign page one slick
 */

export default function campaignCardOne(className){

    initSlick(className, {
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
        responsive: [
          {
            breakpoint: 768,
            settings: {
              arrows: false,
              dots: true
            }
          }
        ]
      }, function(){
        _removeTabindex();
    })
    
}


function _removeTabindex(){
  $('.product-card').removeAttr('tabindex')
}

/**
 * end campaign page one slick
 */