require
  urlArgs: "b=#{(new Date()).getTime()}"
  baseUrl: 'js'
  paths:
    jquery: 'vendor/jquery/jquery'
    lodash: 'vendor/lodash/lodash.compat'
    backbone: 'vendor/backbone/backbone'
    modernizr: 'vendor/modernizr/modernizr'
    handlebars: 'vendor/handlebars/handlebars'
    foundation: 'vendor/foundation/foundation'
    'jquery.cookie': 'vendor/jquery.cookie/jquery.cookie'
  shim:
    foundation:
      deps: ['jquery','modernizr']
    jquery:
      exports: '$'
    backbone:
      deps: ['lodash','jquery']
      exports: 'Backbone'
  , [
    'jquery'
    'jquery.cookie'
    'foundation'
    'views/main'
  ], ($, a, b, MainView) ->
    view = new MainView()
    view.render('#canvas')