app_config =
  debug: false
  colors:
    white: `'\033[0;m'`
    gold: `'\033[1;m'`
    red: `'\033[0;31m'`
    orange: `'\033[1;31m'`
    teal: `'\033[0;32m'`
    green: `'\033[1;32m'`
    tan: `'\033[0;33m'`
    yellow: `'\033[1;33m'`
    brown: `'\033[0;34m'`
    blue: `'\033[1;34m'`
    darktan: `'\033[0;35m'`
    pink: `'\033[1;35m'`
    cyan: `'\033[0;36m'`
    reset: `'\033[0;39m'`

  app:
    host: process.env.PREX_APP_HOST
    port: process.env.PREX_APP_PORT

  instagram:
    client_id: process.env.INSTAGRAM_CLIENT
    client_secret: process.env.INSTAGRAM_SECRET
    access_token: process.env.INSTAGRAM_ACCESS_TOKEN
    oauth_redirect_uri: process.env.INSTAGRAM_REDIRECT_URI
    user_id: process.env.INSTAGRAM_USER_ID

  facebook:
    app_id: process.env.FACEBOOK_APP_ID
    app_secret: process.env.FACEBOOK_APP_SECRET
    client_token: process.env.FACEBOOK_CLIENT_TOKEN
    access_token: process.env.FACEBOOK_ACCESS_TOKEN

  twilio:
    sid: process.env.TWILIO_SID
    token: process.env.TWILIO_TOKEN

  twitter:
    consumer_key: process.env.TWITTER_CONSUMER_KEY
    consumer_secret: process.env.TWITTER_CONSUMER_SECRET
    access_token: process.env.TWITTER_ACCESS_TOKEN
    access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET

switch process.env.MINISITE_ENV
  when "local"
    app_config.mongo =
      host: '127.0.0.1'
      port: 27017
      username: null
      password: null
      db: 'sexy_minisite'

    app_config.redis =
      host: '127.0.0.1'
      port: 6379
      params: {}
      username: null
      password: null

module.exports = app_config

module.exports.get_mongo_url = ->
  if app_config.mongo.username and app_config.mongo.password
    auth_string = "#{app_config.mongo.username}:#{app_config.mongo.password}@"
  else
    auth_string = ""

  "mongodb://#{auth_string}#{app_config.mongo.host}:#{app_config.mongo.port}/#{app_config.mongo.db}"