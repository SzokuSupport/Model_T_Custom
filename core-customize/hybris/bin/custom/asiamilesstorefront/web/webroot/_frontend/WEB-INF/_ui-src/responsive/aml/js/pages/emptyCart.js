import './_header'
import './_footer'

import removeMenu from '../modules/common/removeMenu'

$(function () {
  removeMenu()
  let $backHome = $('.J-back-home'),
    language = window.location.pathname.split('/')[1],
    url = '/' + language;


  $backHome.on('click', function () {
    window.location.href = url;
  });
});
