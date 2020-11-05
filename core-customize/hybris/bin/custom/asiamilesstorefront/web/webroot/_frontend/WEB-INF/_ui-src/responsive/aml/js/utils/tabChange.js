/**
* optimized @9 May, linda.zhu
* level 1
* @description product detail images tab change
* usage:
*
* @param {string} selector
* selector:
*
*
* */

function tabChange(selectorTabPanel, selectorTabContent, classname, callBack) {
  $(selectorTabPanel).on('click', function () {
    let $this = $(this),
      $showModules = $(selectorTabContent),
      index = $this.index();

    $this.siblings().removeClass(classname);
    $this.addClass(classname);

    $this.parents().siblings(selectorTabContent).removeClass(classname);
    $this.parents().siblings(selectorTabContent).eq(index).addClass(classname);

    if ($('.J-triggerShowMore').length) {
      $showModules.find('.J-information').removeClass('overHidden');
      $showModules.find('.J-triggerShowMore').removeClass('hide');
      $showModules.find('.J-triggerShowMore').removeClass('selected');
      _showMoreForTabChange(index);
    }

    callBack();
  });
}

// only used pdp page
function _showMoreForTabChange(index) {
  let $information = $('.J-information').eq(index).height(),
    $triggerShowMore = $('.J-triggerShowMore');

  if ($information <= 200) {
    $triggerShowMore.eq(index).addClass('hide');
  } else {
    $('.J-information').addClass('overHidden');
  }
}


export default tabChange