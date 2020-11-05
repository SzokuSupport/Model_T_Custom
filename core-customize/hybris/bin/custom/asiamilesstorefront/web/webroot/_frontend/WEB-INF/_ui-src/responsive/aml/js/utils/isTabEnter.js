/*
 * WATesting keydown event
 */
function isTabEnter(className, callback, $selector) {
  if (!$selector) {
    $(className).on('keydown', function () {
      let event = window.event;
      let $that = $(this);
      // keydown enter
      if (event.keyCode === 13) {
        callback.call($that);
        return false
      }
    })
  } else {
    $selector.on('keydown', function () {
      let event = window.event;
      let $that = $(this);
      // keydown enter
      if (event.keyCode === 13) {
        callback.call($that);
        return false
      }
    })
  }
}

export default isTabEnter