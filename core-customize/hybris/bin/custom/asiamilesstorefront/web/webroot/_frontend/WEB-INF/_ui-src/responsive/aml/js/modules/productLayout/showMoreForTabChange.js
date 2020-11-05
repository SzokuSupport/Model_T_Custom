/**
* optimized @21 May
* level 1
* @description tab change for product detail page
* usage:
*
* @param {string} selector
* selector:
* $('.J-bundleCard')
*
* */


function showMoreForTabChange() {
  let classOverHidden = 'overHidden',
    classSelected = 'selected',
    classInformation = '.J-information',
    $information = $(classInformation),
    $triggerShowMore = $('.J-triggerShowMore')
        
  // if height over 200px, hide it
  if ($information.height() <= 200) {
    $triggerShowMore.addClass('hide');
  } else {
    $information.eq(0).addClass(classOverHidden);
  }

  // click show or hide
  $triggerShowMore.on('click', function () {
    let $that = $(this);
    if ($that.hasClass(classSelected)) {
      $that.removeClass(classSelected);
      $that.siblings(classInformation).addClass(classOverHidden);
    } else {
      $that.addClass(classSelected);
      $that.siblings(classInformation).removeClass(classOverHidden);
    }
  })

}

export default showMoreForTabChange