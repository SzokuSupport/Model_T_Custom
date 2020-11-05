/**
*
* level 1
* @description API: https://github.com/verlok/lazyload
* https://github.com/verlok/lazyload/tree/a04b6c15a5bea5c858d30c6979cb711dd8d4c77f
* usage:
*
* selector:.lazy
*
*
* */


import LazyLoad from 'vanilla-lazyload';

// call all img.lazy first
export default function lazyloadNew() {
  let myLazyLoad = new LazyLoad({
    elements_selector: '.lazy'
  })

}

