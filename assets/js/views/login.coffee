define ['jquery', 'backbone', 'lib/logger', 'templates'], ($, Backbone, Log, templates) ->

  class LoginView extends Backbone.View
    el: '#content'
    events: {}

    initialize: ->
      Log "Initializing LoginView"
      this

    render: ->
      Log "Rendering LoginView"
      $(this.el).html templates.login()

      $(document).foundation()

  LoginView