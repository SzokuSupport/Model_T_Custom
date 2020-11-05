/*
* level 3
* @description
* */
function hideLoding(_obj) {
  $(_obj).hide();
  $('html,body').removeClass('ovfHiden');
}

export default hideLoding;