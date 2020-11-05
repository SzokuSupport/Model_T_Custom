/**
* optimized @22 May, yue.cui
* level 1
* @description format price
* usage:
* 
* @param {string} selector 
* selector:
* 
* 
* */

function formatPrice(currentPrice, currency, decimalPlaces) {
  let dp = typeof decimalPlaces !== 'undefined' ? decimalPlaces : 2;
  let number = parseFloat(currentPrice).toFixed(dp),
    splitNumber = String(number).split('.'),
    integer = splitNumber[0],
    getFormat = ',',
    counter = '',
    _result = '',
    result = '';

  // Use the thousand separator to separate the integer parts
  for (let i = integer.length - 1; i >= 0; i--) {
    counter++;
    _result = integer.charAt(i) + _result;

    if (!(counter % 3) && i != 0) {
      _result = getFormat + _result;
    }
  }

  // remove the last ',' whenever it exists
  if (_result[_result.length - 1] === getFormat) {
    _result = _result.substring(0, _result.length - 1)
  }

  result = {
    'HKD': (dp > 0 ? [_result, splitNumber[1]].join('.') : [_result]),
    'USD': (dp > 0 ? [_result, splitNumber[1]].join('.') : [_result]),
    'none': _result
  }

  return result[currency]
}

export default formatPrice