/**
 * if IE browse
 */

import isIE from './isIE';

export default function isIESvg() {
  if (isIE()) {

    let url = [
      '/_ui/responsive/aml/img/sprite.svg',
    ];

    url.forEach(function (item) {
      let ajax = new XMLHttpRequest()
      ajax.open('get', item, true);
      ajax.send();
      ajax.onload = function () {
        $('body').append('<div style="display:none;">' + ajax.responseText + '</div>')
      }
    });

    $('svg use').each(function () {
      let href = $(this).attr('xlink:href').split('#')[1];
      $(this).attr('xlink:href', '#' + href);
    })
  }
}