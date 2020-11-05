import initSlick from "../../utils/initSlick";

/**
 * campaign page four slick
 */

export default function campaignCardFour(className){

    initSlick(className, {
        slidesToShow: 4,
        arrows: true,
        infinite: false,
        variableWidth: true,
        responsive:[
        {
            breakpoint: 1280,
            settings: {
                slidesToShow: 3,
            }
        },
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
 * end campaign page four slick
 */