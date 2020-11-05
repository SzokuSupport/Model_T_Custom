const path = require('path');
const glob = require('glob');

const entryPath = require('./config').entryPath;
const globalApplyAllPagesJsPath  = require('./config').globalApplyAllPagesJsPath;

let entry = {
  applyAllPages: globalApplyAllPagesJsPath
}
console.log('entryPath', entryPath)
let files = glob.sync(entryPath, {nodir: true});

files.map(file => {
  // let arr = path.dirname(file).split('/');
  let arr = file.split('/')
  let name = arr[arr.length - 1].replace(/.js$/, '');
  entry[name] = file;
});

module.exports = entry;
