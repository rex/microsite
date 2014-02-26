exports.config =
  modules: [
    "copy"
    "server"
    "jshint"
    # "csslint"
    "require"
    "minify-js"
    "minify-css"
    "live-reload"
    "bower"
    "coffeescript"
    "sass"
    "handlebars"
  ]

  watch:
    sourceDir: "assets"
    compiledDir: "public"
    javascriptDir: "js"

  vendor:
    javascripts: "js/vendor"
    stylesheets: "css/vendor"

  template:
    writeLibrary: true
    nameTransform: formTemplatePath = (filePath) ->
      filePath.replace "js/templates/", ""

    wrapType: "amd"
    outputFileName: "js/templates"

  logger:
    growl:
      enabled: true
      onStartup: false
      onSuccess: true

  server:
    defaultServer:
      enabled: false
      onePager: true

    path: "app.coffee"
    port: 3000
    views:
      compileWith: "handlebars"
      extension: "hb"
      path: "views"

  liveReload:
    enabled: true
    additionalDirs: ["views"]

  # csslint:
  #   rules:
  #     'adjoining-classes': true
  #     important: true

  # jshint:
  #   rules: {}

  bower:
    watch: true
    bowerDir:
      clean: true # When you need to update foundation, set to false and copy the scss/js folder out

  coffeescript:
    options:
      # sourceMap: true
      bare: true

  handlebars:
    extensions: ["hb"]
    helpers: ["hb-helpers"]