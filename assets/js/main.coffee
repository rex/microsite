require
  urlArgs: "b=#{(new Date()).getTime()}"
  baseUrl: 'js'
  paths:
    jquery: 'vendor/jquery/jquery'
    underscore: 'vendor/underscore/underscore'
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
      deps: ['underscore','jquery']
      exports: 'Backbone'
  , [
    'jquery'
    'jquery.cookie'
    'foundation'
    'backbone'
    'routers/main'
    'templates'
  ], ($, a, b, Backbone, MainRouter, templates) ->
    $('#canvas').html templates['page/main']()
    router = new MainRouter()
    console.log router

    $('a[href]').click (e) ->
      console.log "Link clicked: #{$(this).attr 'href'}"
      e.preventDefault()
      Backbone.history.navigate $(this).attr('href'), trigger: true

    Backbone.history.start pushState: true