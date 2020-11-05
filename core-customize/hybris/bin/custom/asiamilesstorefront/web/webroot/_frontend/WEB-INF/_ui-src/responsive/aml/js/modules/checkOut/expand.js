import isTabEnter from '../../utils/isTabEnter';

export default function expand(selector) {
  let $selector = $(selector);
  let $icon = $selector.children('.J-detail-icon');
  let $detailItem = $selector.nextAll().children();
  let i = 0;
  $selector.on('click', function () {
    if (!i) {
      $icon.css('transform', 'scaleY(1)');
      $detailItem.slideUp();
      i = 1
    } else {
      $icon.css('transform', 'scaleY(-1)');
      $detailItem.slideDown();
      i = 0
    }
  });
  isTabEnter('.J-detail-icon', function () {
    $(this).trigger('click');
  })
}