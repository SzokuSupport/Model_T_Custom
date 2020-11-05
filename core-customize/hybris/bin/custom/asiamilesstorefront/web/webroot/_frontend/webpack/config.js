const entryPath = './WEB-INF/_ui-src/responsive/aml/js/pages/!(_)*.js'
const globalApplyAllPagesJsPath = './WEB-INF/_ui-src/responsive/aml/js/global/applyAllPages.js'

let output = {
  production: 'release',
  dev: 'dev',
  qa: 'qa'
}[process.env.NODE_ENV] || 'dev'

let publicPath = '/_ui/responsive/aml'
output += publicPath

const template = './WEB-INF/views/responsive/pages/**/*.jsp'
const templateHTML = './WEB-INF/views/responsive/html/**/*.html'

module.exports = {
  entryPath,
  globalApplyAllPagesJsPath,
  output,
  publicPath,
  template,
  templateHTML
}
