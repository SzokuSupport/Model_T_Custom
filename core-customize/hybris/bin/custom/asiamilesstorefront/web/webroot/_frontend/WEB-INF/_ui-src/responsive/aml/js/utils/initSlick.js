import '../plugins/jQuery.slick'

export default function initSlick(selector, opts, callback) {
  let $selector = $(selector)

  if (!$selector.length) return

  opts.onInit = function () {
    if (callback && typeof callback === 'function') {
      callback(this);
    }
  }

  $(selector).slick(opts)
}