import formatPrice from '../../utils/formatPrice'

// formatprice
export default function priceCommom(selector) {
  let $selector = $(selector);
  for (let i = 0; i < $selector.length; i++) {
    let price = formatPrice($selector.eq(i).text(), 'none')
    $selector.eq(i).text(price)
  }
}