async = require 'async'
logger = require '../lib/logger'

Services =
  Instagram: require './instagram'
  Twitter: require './twitter'

exports.initialize = (services_initialized = ->) ->
  async.series
    Instagram: (done) ->
      # Services.Instagram.initialize done
      done()
    Twitter: (done) ->
      # Services.Twitter.initialize done
      done()

  , (err, results) ->
    services_initialized err