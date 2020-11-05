/**
 * if IE browse
 */

import isIE from '../../utils/isIE';

export default function updatedSVG() {
  if (isIE()) {
    $('svg use').each(function () {
      let href = $(this).attr('xlink:href').split('#')[1];
      $(this).attr('xlink:href', '#' + href);
    })
  }
}