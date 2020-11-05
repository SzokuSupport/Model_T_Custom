export default function faq(className) {
  let $faqSets = $(className);
  
  const contentHiddenClassName = 'J-faq-collapse-content--hidden';
  const arrowOpenClassName = 'icon-dropdown--open';

  $faqSets.each(function () {
    let $setTitle = $(this).find('.J-faq-collapse-title');
    let $setTitleExpandIcon = $setTitle.find('.J-faq-expand-details-icon');
    let $setContent = $(this).find('.J-faq-collapse-content');

    $setTitle.click(function () {
      if ($setContent.hasClass(contentHiddenClassName)) {
        $setContent.removeClass(contentHiddenClassName);
        $setTitleExpandIcon.addClass(arrowOpenClassName);
      } else {
        $setContent.addClass(contentHiddenClassName);
        $setTitleExpandIcon.removeClass(arrowOpenClassName);
      }
    })
  });
}
