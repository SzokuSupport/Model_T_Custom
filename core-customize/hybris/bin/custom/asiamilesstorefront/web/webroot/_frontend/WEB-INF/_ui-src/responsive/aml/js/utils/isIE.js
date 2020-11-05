/**
 * @description
 */

function isIE() {
  return 'ActiveXObject' in window
}

export default isIE