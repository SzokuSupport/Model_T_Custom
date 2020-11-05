/*
 * if window.width < 1024 return small screen
 */
function isSmallScreen() {
  return window.innerWidth < 768;
}

export default isSmallScreen