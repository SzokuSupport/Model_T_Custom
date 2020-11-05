import need from './need'
import validate from './validate'
import error from './error'

export default function radioSelect(selector) {
  let $selector = $(selector);
  // click change radio component selected states
  $selector.on('click', function () {
    $selector.removeClass('selected');
    $selector.children('.font-SemiBold').each(function () {
      let selectorText = $(this).text();
      $(this).prev().attr('aria-label', `Where are you delivering to: ${selectorText} radio button unselected.`)
    });
    $(this).addClass('selected');
    let radioSelectText = $(this).children('span').text();
    $(this).children('.select-circle').attr('aria-label', `Where are you delivering to: ${radioSelectText} radio button selected.`);
    let $form = $(this).parent().parent().parent().nextAll('');
    if ($(this).index() === 0) { // myself
      $form.eq(0).show();
      $form.eq(1).hide();
      need();
      validate('#mySelf');
      error('#mySelf')
    } else if ($(this).index() === 1) { // other
      $form.eq(0).hide();
      $form.eq(1).show();
      need();
      validate('#other');
      error('#other')
    } else {
      return false
    }
  })
}