const { environment } = require('@rails/webpacker')

environment.config.merge({
  module: {
    rules: [
      {
        parser: {
          amd: false,
        }
      },
      {
        test: require.resolve('jquery'),
        use: [{
          loader: 'expose-loader',
          options: '$'
        }, {
          loader: 'expose-loader',
          options: 'jQuery'
        }]
      }
      // ,
      // {
      //   test: require.resolve('rails-ujs'),
      //   use: [{
      //     loader: 'expose-loader',
      //     options: 'Rails'
      //   }]
      // }
    ]
  }
});

module.exports = environment
