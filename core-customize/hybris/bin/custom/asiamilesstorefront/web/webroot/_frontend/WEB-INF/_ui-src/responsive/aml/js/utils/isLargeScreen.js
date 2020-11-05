/*
 * if window.width > 1280 return small screen
 */
function isLargeScreen() {
  return window.innerWidth > 1279 ? true : false;
}

export default isLargeScreen