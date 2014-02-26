async = require 'async'
express = require 'express'
engines = require 'consolidate'
http = require 'http'

logger = require './lib/logger'
_ = require './lib/_'
step = require './lib/step'

exports.startServer = (config, callback) ->

  app = express()

  async.series
    connect_to_redis: (done) ->
      step.start_major "Initializing Redis"
      redis = require './drivers/redis'
      redis.initialize ->
        step.complete_major()
        done()

    initialize_models: (done) ->
      step.start_major "Initializing Mongo"
      models = require './models'
      models.initialize ->
        step.complete_major()
        done()

    configure_app: (done) ->
      step.start_major "Configuring application"
      app.configure ->
        app.set 'port', process.env.PORT or config.server.port
        app.set 'views', config.server.views.path
        app.engine config.server.views.extension, engines[config.server.views.compileWith]
        app.set 'view engine', config.server.views.extension
        app.enable 'view cache'
        app.use express.favicon()
        app.use express.urlencoded()
        app.use express.json()
        app.use express.methodOverride()
        app.use express.cookieParser()
        app.use express.compress()
        # app.use config.server.base, app.router
        app.use express.static(config.watch.compiledDir)

        step.complete_major()
        done()

    initialize_redis_session: (done) ->
      step.start_major "Initializing Redis Sessions"
      Redis_Instance = require('./drivers/redis').instance
      unless Redis_Instance
        err = new Error "No Redis instance found"
        step.fail err
        return done err, null

      Redis_Store = require('connect-redis') express

      app.use express.session
        store: new Redis_Store
          client: Redis_Instance
        secret: 'go rangers'

      step.complete_major()
      done()

    initialize_services: (done) ->
      step.start_major "Initializing services"
      services = require './services'
      services.initialize (err) ->
        if err? then step.error err else step.complete_major()
        done err

    load_routes: (done) ->
      step.start_major "Loading routes"
      routes  = require('./routes') config, app
      step.complete_major()
      done()

    attach_middleware: (done) ->
      step.start_major "Attaching application middleware"

      # Track all visits that are not to /webhooks/*
      app.use require './middleware/log_visit'

      # Create locals based on request data
      app.use require './middleware/set_locals'

      # Render JSON responses if ?json query string parameter is set
      app.use require './middleware/detect_json_requests'

      # Display all session information for each request
      app.use require './middleware/debug_session'

      app.use require './middleware/generic_callback'

      app.use app.router

      step.complete_major()
      done()

    post_middleware: (done) ->
      step.start_major "Running post-middleware hook"
      app.configure 'development', ->
        app.use express.errorHandler()

      app.configure 'production', ->

      step.complete_major()
      done()

  , (err, results) ->
    if err then logger.error err
    else
      step.start_major "Booting application"

    server = http.createServer(app).listen app.get('port'), app.get('host'), ->
      step.complete_major()
      logger "Express server running on port #{app.get 'port'} in #{app.settings.env} mode"

      callback(server)

