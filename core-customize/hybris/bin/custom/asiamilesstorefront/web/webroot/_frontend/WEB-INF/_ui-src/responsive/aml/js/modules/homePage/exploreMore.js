import isTabEnter from '../../utils/isTabEnter';

export default function exploreMore() {
  let $exploreMoreBtn = $('.J-explore-more'),
    curMax,
    curMin,
    url,
    language = window.location.pathname.split('/')[1];

  let exploreMoreBtnClickEvent = function () {
    curMin = tranMinAndMaxNum($('.nstSlider').nstSlider('get_current_min_value'));
    curMax = tranMinAndMaxNum($('.nstSlider').nstSlider('get_current_max_value'));
    url = '/' + (language != '' ? language : 'en') + '/c/1?page=0&pagesize=9&q=:relevance:zonePrice:' + curMin + '_' + curMax;
    window.location.href = url;
  };
  $exploreMoreBtn.on('click', exploreMoreBtnClickEvent);
  isTabEnter('.J-explore-more', exploreMoreBtnClickEvent);
}

function tranMinAndMaxNum(number) {
  let tranNum;
  tranNum = Math.round(number / 1000) * 1000;
  return tranNum;
}
