import '../../plugins/jquery.masonry'

/**
 * Waterfall Flow Show
*/
export default function masonry() {
  $('.J-order-list').masonry({
    itemSelector: '.J-item-list'
  });
}