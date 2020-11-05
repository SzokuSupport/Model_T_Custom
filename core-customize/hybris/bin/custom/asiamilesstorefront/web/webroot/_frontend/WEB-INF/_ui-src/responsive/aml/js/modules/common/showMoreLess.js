import isTabEnter from '../../utils/isTabEnter'
export default function showMoreLess() {
  let $category = $('.product-selector > .section'),
    maxSize = 5;

  $category.each(function () {
    let $this = $(this),
      $checkbox = $this.children('.J-filter-option'),
      $showLessBtn = $this.children('.J-show-less'),
      $showMoreBtn = $this.children('.J-show-more'),
      $checkboxLength = $checkbox.length;

    if ($checkboxLength <= maxSize) {
      return
    }

    for (let i = maxSize; i < $checkboxLength; i++) {
      $checkbox.eq(i).hide();
    }

    $showMoreBtn.show();
    // show less button
    $showMoreBtn.on('click', function () {
      for (let i = maxSize; i < $checkboxLength; i++) {
        $checkbox.eq(i).slideDown(300)
      }
      $showMoreBtn.hide();
      $showLessBtn.show();
    })
    // enter press show less button
    isTabEnter('.J-show-less', function () {
      $(this).trigger('click')
    })
    // show more button
    $showLessBtn.on('click', function () {
      for (let i = maxSize; i < $checkboxLength; i++) {
        $checkbox.eq(i).slideUp(300);
      }
      $showMoreBtn.show();
      $showLessBtn.hide();
    })
    // enter press show more button
    isTabEnter('.J-show-more', function () {
      $(this).trigger('click')
    })
  });
  
}