import initSlick from "../../utils/initSlick";
/**
 * campaign page three slick
 */

export default function campaignCardThree(className){

    initSlick(className, {
        slidesToShow: 3,
        arrows: true,
        infinite: false,
        responsive:[
        {
            breakpoint: 768,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
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
 * end campaign page three slick
 */
