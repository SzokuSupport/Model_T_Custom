// replace navigation <a> href, add language
function replaceUrl(className, device) {
  let language = document.getElementsByTagName( 'html' )[0].getAttribute('lang');
  let $parent = $(className)

  if (device) {
    let urlName = 'data-url';
    for (let j = 0; j < $parent.length; j++){
      let hrefUrl = $parent.eq(j).attr(urlName);
      if (hrefUrl && hrefUrl.indexOf('http') === -1) {
        $parent.eq(j).attr(urlName, `/${language + hrefUrl}`)
      }
    }
  } else {
    for (let j = 0; j < $parent.length; j++) {
      let $selector = $parent.eq(j).find('a');
      for (let i = 0; i < $selector.length; i++) {
        let urlName = 'href';
        let hrefUrl = $selector.eq(i).attr(urlName);
        if (hrefUrl && hrefUrl.indexOf('http') === -1) {
          $selector.eq(i).attr(urlName, `/${language + hrefUrl}`)
        }
      }
    }
  }
}


export default function replaceNavigationUrl() {
  // replace url
  replaceUrl('.J-navigation')
  replaceUrl('.slides')
  replaceUrl('.J-category__item--two', 'mobile')
  replaceUrl('.J-category__item--three', 'mobile')
  replaceUrl('.J-category__item--four', 'mobile')

}