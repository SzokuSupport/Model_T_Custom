const glob = require('glob');
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const HtmlWebpackIncludeAssetsPlugin = require('html-webpack-include-assets-plugin');
const optimizeCssAssetsWebpackPlugin = require("optimize-css-assets-webpack-plugin")
const webpack = require('webpack');
const templateHTML = require('./config').templateHTML;
const template = require('./config').template;
const publicPath = require('./config').publicPath;
const pageConfig = require('../WEB-INF/_ui-src/responsive/aml/pageConfig.js')

let plugins = []

/**
 * create JSP page
 */
let files = glob.sync(template, {
  nodir: true
});
files.map(file => {
  let arr = file.split('/')
  let fileName = arr[arr.length - 1]
  let folderName = arr[arr.length - 2]
  let name = arr[arr.length - 1].split('.')[0];
  let config = {
    template: file,
    inject: false,
    filename: `pages/${folderName}/${name}.jsp`,
    chunks: []
  };

  if (pageConfig[name]['js']) {
    const requiredChunks = ['common', 'applyAllPages'].concat([...pageConfig[name]['js']]);

    config.chunks = requiredChunks;
    config.chunksSortMode = function (chunk1, chunk2) {
      let order = requiredChunks;
      let order1 = order.indexOf(chunk1.names[0]);
      let order2 = order.indexOf(chunk2.names[0]);
      return order1 - order2;
    }
  }

  plugins.push(new HtmlWebpackPlugin(config));

  if (pageConfig[name]['css']) {
    plugins.push(new HtmlWebpackIncludeAssetsPlugin({
      files: [`pages/${folderName}/${name}.jsp`],
      assets: [`common.css`].concat([...pageConfig[name]['css']]),
      append: false,
      hash: false,
      publicPath: publicPath + '/css/'
    }))
  }
})

/**
 * create HTML page
 */
let filesHTML = glob.sync(templateHTML, {
  nodir: true
});
filesHTML.map(file => {
  let arr = file.split('/')
  let fileName = arr[arr.length - 1]
  let folderName = arr[arr.length - 2]
  let name = arr[arr.length - 1].split('.')[0];
  let config = {
    template: file,
    inject: false,
    filename: `html/${folderName}/${name}.html`,
    chunks: []
  };

  if (pageConfig[name]['js']) {
    const requiredChunks = ['common', 'applyAllPages'].concat([...pageConfig[name]['js']]);

    config.chunks = requiredChunks;
    config.chunksSortMode = function (chunk1, chunk2) {
      let order = requiredChunks;
      let order1 = order.indexOf(chunk1.names[0]);
      let order2 = order.indexOf(chunk2.names[0]);
      return order1 - order2;
    }
  }

  plugins.push(new HtmlWebpackPlugin(config));

  if (pageConfig[name]['css'] !== undefined) {
    plugins.push(new HtmlWebpackIncludeAssetsPlugin({
      files: [`html/${folderName}/${name}.html`],
      assets: [`common.css`].concat([...pageConfig[name]['css']]),
      append: false,
      hash: false,
      publicPath: publicPath + '/css/'
    }))
  }
})


/**
 * combine common code
 */
plugins.push(
  new webpack.optimize.CommonsChunkPlugin({
    name: 'common',
    filename: `js/[name].js`,
    minChunks: function (module, count) {
      if (count > 5 && /\.js$/.test(module.resource) && module.resource.indexOf('node_modules') !== -1) {
        return true;
      } else {
        return false;
      }
    }
  })
)

plugins.push(
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery',
    'window.$': 'jquery',
  })
)

/**
 * compress code
 */
// console.log(process.env.NODE_ENV)
// if (process.env.NODE_ENV === 'production') {
  plugins.push(
    new webpack.optimize.UglifyJsPlugin({
      comments: false,
      compress: {
        warnings: false,
        drop_console: true,
        drop_debugger: true
      }
    })
  )
// }

module.exports = plugins