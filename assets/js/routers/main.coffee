define [
  'jquery'
  'backbone'
  'lib/logger'
  'views/index'
  'views/login'
  'templates'
], ($, Backbone, Log, IndexView, LoginView, templates) ->

  class MainRouter extends Backbone.Router

    routes:
      "login": "login"
      "(/)": "index"

    login: ->
      Log "Login route matched"
      new LoginView().render()

    index: ->
      Log "Index route matched"
      new IndexView().render()

  MainRouter