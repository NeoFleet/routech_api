require 'logger'

Dir.glob(File.join('./lib', 'routech_api', '*.rb'), &method(:require))

module RoutechApi
  LEVEL_DEBUG = Logger::DEBUG
  LEVEL_ERROR = Logger::ERROR
  LEVEL_INFO = Logger::INFO

  @configuration = Configuration.new

  class << self
    attr_accessor :configuration
  end

  def self.config
    yield(configuration) if block_given?
  end
end
