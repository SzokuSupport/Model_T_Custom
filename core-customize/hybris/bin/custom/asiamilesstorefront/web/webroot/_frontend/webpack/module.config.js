let modules = {
  loaders: [{
    test: /\.js$/,
    exclude: /node_modules/,
    loader: 'babel-loader'
  },
  {
    test: /\.jsp|\.html|\.tag$/,
    loader: 'underscore-template-loader',
    query: {
      interpolate: '\\{\\{(.+?)\\}\\}'
    }
  },
  {
    test: require.resolve('jquery'),
    loader: "expose-loader?$!expose-loader?jQuery"
  }]
}

module.exports = modules;
