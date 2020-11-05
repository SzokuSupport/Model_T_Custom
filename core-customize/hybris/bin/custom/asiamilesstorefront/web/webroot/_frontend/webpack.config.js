module.exports = {
  entry: require('./webpack/entry.config.js'),
  output: require('./webpack/output.config.js'),
  module: require('./webpack/module.config.js'),
  plugins: require('./webpack/plugins.config.js'),
  resolve: require('./webpack/resolve.config.js')
}