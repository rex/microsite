require
  urlArgs: "b=#{(new Date()).getTime()}"
  baseUrl: 'js'
  paths:
    zepto: 'vendor/zepto/zepto'
    lodash: 'vendor/lodash/lodash.compat'
    backbone: 'vendor/backbone/backbone'
    modernizr: 'vendor/modernizr/modernizr'
    handlebars: 'vendor/handlebars/handlebars'
  shim:
    zepto:
      exports: '$'
    backbone:
      deps: ['lodash','zepto']
      exports: 'Backbone'
  , ['views/example-view']
  , (ExampleView) ->
    view = new ExampleView()
    view.render('body')