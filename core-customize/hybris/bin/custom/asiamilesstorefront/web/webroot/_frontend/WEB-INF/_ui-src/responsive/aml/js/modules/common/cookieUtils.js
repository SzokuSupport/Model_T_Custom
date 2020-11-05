// setCookie
export function setCookie(key, value) {
  document.cookie = key + '=' + value + ';expires=Fri, 31 Dec 9999 23:59:59 GMT;path=/;'
}

// getCookie
export function getCookie(name) {
  var arr, reg = new RegExp('(^| )' + name + '=([^;]*)(;|$)');

  if (arr = document.cookie.match(reg))

    return unescape(arr[2]);
  else
    return null;
}
