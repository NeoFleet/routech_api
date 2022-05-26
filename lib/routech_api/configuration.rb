# frozen_string_literal: true

require 'base64'
require 'rails'

module RoutechApi
  # Configuration class
  class Configuration
    attr_accessor :url, :logger, :api_key
    attr_reader :log_level, :verify_ssl_certs

    def log_level=(val)
      case val
      when 'debug'
        val = RoutechApi::LEVEL_DEBUG
      when 'info'
        val = RoutechApi::LEVEL_INFO
      end

      levels = [RoutechApi::LEVEL_INFO, RoutechApi::LEVEL_DEBUG, RoutechApi::LEVEL_ERROR]

      if !val.nil? && !levels.include?(val)
        raise ArgumentError,
              'log_level should only be set to `nil`, `debug` or `info`'
      end
      @log_level = val
    end
  end
end
