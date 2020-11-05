/*
 * if window.width < 1439 return medium screen
 */
function isMediumScreen() {	
  return window.innerWidth < 1280 && window.innerWidth > 767;
}

export default isMediumScreen