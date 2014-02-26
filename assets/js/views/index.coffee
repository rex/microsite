define ['jquery', 'backbone', 'lib/logger', 'templates'], ($, Backbone, Log, templates) ->

  class IndexView extends Backbone.View
    el: '#content'
    events: {}

    initialize: ->
      Log "Initializing IndexView"
      this

    render: ->
      Log "Rendering IndexView"
      $(this.el).html templates.index()

      $(document).foundation()

  IndexView