/*
 * @description
 */
export function loyalTNumberReg() {
  return new RegExp('^[0-9]{12}$');
}

/*
 * @description
 */
export function nameReg() {
  return new RegExp('^[\\sa-zA-Z.,-]{1,25}$');
}

/*
 * @description
 */
export function pwdRegex() {
  return new RegExp('^((?=.*[0-9].*)(?=.*[A-Za-z].*)).*$');
}

/*
 * @description
 */
export function emailRegex() {
  return new RegExp('^([A-Za-z0-9])+(([A-Za-z0-9._%+-])?)+@([A-Za-z0-9.-])+[.]([A-Za-z]{2,4})$');
}

/*
 * @description
 */
export function phoneNumberRegex() {
  return new RegExp('^[0-9]{5,15}$');
}

/*
 * @description
 */
export function captchaRegex() {
  return new RegExp('^[A-Za-z0-9]{7}$');
}

/*
 * @description
 */
export function phoneAreaCodeRegex() {
  return new RegExp('^[0-9]+$');
}

/*
 * @description
 */
export function passportRegex() {
  return new RegExp('^[A-Za-z0-9]+$');
}

/*
 * @description
 *
 * added by wei.f.zhang
 */
export function orderNumberRegex() {
  return new RegExp('^[0-9]{1,40}$');
}


/*
 * @description
 *
 * added by wei.f.zhang
 */
export function addressRegex() {
  return new RegExp('^[a-zA-Z0-9]{1,50}$');
}


/*
 * @description
 *
 * added by wei.f.zhang
 */
export function postalRegex() {
  return new RegExp('^[a-zA-Z0-9]{1,10}$');
}