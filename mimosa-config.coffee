exports.config =
  modules: [
    "copy"
    "server"
    # "jshint"
    # "csslint"
    "require"
    # "minify-js"
    # "minify-css"
    "live-reload"
    "bower"
    "coffeescript"
    "sass"
    "handlebars"
  ]
  server:
    views:
      compileWith: "handlebars"
      extension: "hb"

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
      enabled: true
      onePager: true

    path: "app.coffee"
    port: 3000
    views:
      compileWith: "handlebars"
      extension: "hb"
      path: "views"

  minifyJS:
    exclude: [/\.min\./]

  minifyCSS:
    exclude: [/\.min\./]

  liveReload:
    enabled: true
    additionalDirs: ["views"]

  bower:
    watch: true
    bowerDir:
      clean: true # When you need to update foundation, set to false and copy the scss/js folder out

  coffeescript:
    options:
      sourceMap: true
      bare: true

  handlebars:
    extensions: ["hb"]
    helpers: ["hb-helpers"]