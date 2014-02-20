define ['jquery', 'templates'], ($, templates) ->

  class MainView

    render: (element) ->
      $(element).html templates['index']({ working: "Hell to the yeah!" })

  MainView