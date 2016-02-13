module.exports = {
  entry: "./index.js",

  module: {
    loaders: [{
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      loader: 'elm-webpack'
    }]
  },
  output: {
    path: './',
    filename: 'bingo.js'
  },
};
