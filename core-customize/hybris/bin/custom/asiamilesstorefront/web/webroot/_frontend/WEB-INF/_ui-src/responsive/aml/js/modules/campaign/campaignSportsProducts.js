import initSlick from "../../utils/initSlick";

/**
 * campaign page sports products cyclic sliding
 */

export default function campaignSportsProducts(){

    initSlick('.J-sports_products', {
        slidesToShow: 2,
        arrows: false,
        infinite: true,
        responsive:[
       {
            breakpoint: 768,
            settings: {
                slidesToShow: 1,
                arrows: false,
                dots: true
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
 * end campaign page sports products cyclic sliding
 */