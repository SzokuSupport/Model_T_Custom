function UnicodeToAscii(content) {
  let code = content.match(/&#(\d+);/g);
  let str = content;
  if (code instanceof Array) {
    for (let i = 0; i < code.length; i++) {
      let result = String.fromCharCode(code[i].replace(/[&#;]/g, ''));
      str = str.replace(code[i], result)
    }
  }
  return str
}
export default function dataLayer() {
  let contextData = window.dataLayer || {}
  for (let i in contextData) {
    if (contextData.hasOwnProperty(i)) {
      if (contextData[i] instanceof Array) {
        for (let j = 0; j < contextData[i].length; j++) {
          for (let k in contextData[i][j]) {
            if (contextData[i][j].hasOwnProperty(k)) {
              contextData[i][j][k] = UnicodeToAscii(contextData[i][j][k])
            }
          }
        }
      } else {
        contextData[i] = UnicodeToAscii(contextData[i])
      }
    }
  }
  window.dataLayer = contextData
}