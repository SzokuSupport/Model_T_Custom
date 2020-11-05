// Concatenate the url according to the parameters
export default function joinParams(params) {
  let arr = [];
    
  for (let i in params) {
    if (params.hasOwnProperty(i)) {
      if (params[i]) {
        arr.push(`${i}=${params[i]}`)
      }
    }
  }

  return arr.join('&')
}
