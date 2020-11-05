import initSlick from "../../utils/initSlick";
/**
 * campaign page gadgets last small screen
 */
export default function summerGadgetsLast(){
    initSlick('.J-summer-gadgets-mobile', {
        slidesToShow: 1,
        arrows: false,
        rows: 2,
        variableWidth: true,
        infinite: false
      }, function(){
        _removeTabindex();
    })
}


function _removeTabindex(){
    $('.product-card').removeAttr('tabindex')
}
/**
 * end campaign page gadgets last small screen
 */