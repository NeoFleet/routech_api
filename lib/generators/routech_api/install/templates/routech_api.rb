# frozen_string_literal: true

RoutechApi.config do |config|
  # Add a url to make request in routech premade server
  config.url = ENV.fetch('ROUTECH_SERVER_URL')

  # Api_key is a basic authetication for routech server made by a base64 string of `username:password` to make
  # the request in routech server
  config.api_key = ENV.fetch('ROUTECH_API_KEY')

  # Log level is the log level of application if you need more information in debug or less information in production
  # config.log_level = 'debug'
  # or
  config.log_level = RoutechApi::LEVEL_DEBUG

  # The ssl is to make request if routech server without ssl server configuration
  # config.ssl = false
  # or
  config.ssl = true
end
