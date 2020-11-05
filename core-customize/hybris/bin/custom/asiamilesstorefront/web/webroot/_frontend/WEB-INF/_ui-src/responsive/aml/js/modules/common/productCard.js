import isLargeScreen from '../../utils/isLargeScreen'
export default function productCard() {
  if (isLargeScreen) {
    $('body').on('mouseover', '.J-product-card-img', function () {
      let $originImg = $(this).children('.product-img-origin'),
        $hoverImg = $(this).children('.product-img-hover')
  
      $originImg.hide()
      $hoverImg.show()
    })
  
    $('body').on('mouseleave', '.J-product-card-img', function () {
      let $originImg = $(this).children('.product-img-origin'),
        $hoverImg = $(this).children('.product-img-hover')
          
      $originImg.show()
      $hoverImg.hide()
    })
  }
}