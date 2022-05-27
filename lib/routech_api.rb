require 'logger'

# Base files
Dir.glob(File.join('./lib', 'routech_api', '*.rb'), &method(:require))

# Crud Files
Dir.glob(File.join('./lib', 'routech_api', 'crud', '*.rb'), &method(:require))

module RoutechApi
  class NotFounded < StandardError; end
  class NotCreated < StandardError; end
  class NotUpdated < StandardError; end
  class NotDeleted < StandardError; end

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
