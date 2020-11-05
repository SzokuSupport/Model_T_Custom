import initSlick from "../../utils/initSlick";


/**
 * campaign page two slick
 */
export default function campaignCardTwo(className, ){

    initSlick(className, {
        slidesToShow: 2,
        arrows: true,
        infinite: false,
        responsive:[
       {
            breakpoint: 768,
            settings: {
                slidesToShow: 1,
                arrows: false,
                variableWidth: true
            }
        }]
    }, function(){
        _removeTabindex();
    })
    
}


function _removeTabindex(){
    $('.product-card').removeAttr('tabindex')
}

/**
 * end campaign page two slick
 */