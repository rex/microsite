define ['jquery', 'templates'], ($, templates) ->

  class MainView

    render: (element) ->
      $(element).html templates['page/main']({ working: "Hell to the yeah!" })

      $(document).foundation()

  MainView