# frozen_string_literal: true

require 'base64'
require 'json'
require 'net/http'
require 'net/https'
require 'openssl'
require 'uri'
require 'active_support/gzip'
require 'rails'

# RoutechApi module
module RoutechApi
  # Request class
  class Request
    HTTP_METHODS_CLASS = {
      post: Net::HTTP::Post,
      get: Net::HTTP::Get,
      delete: Net::HTTP::Delete,
      put: Net::HTTP::Put
    }.freeze

    def initialize(logger: Rails.logger)
      @logger = logger
      @config = RoutechApi.configuration
    end

    def get(endpoint:, authorization:)
      request(method: :get, endpoint: endpoint, authorization: authorization)
    end

    def post(endpoint:, authorization:, body: nil)
      request(method: :post, endpoint: endpoint, body: body, authorization: authorization)
    end

    def delete(endpoint:, authorization:)
      request(method: :delete, endpoint: endpoint, authorization: authorization)
    end

    def put(endpoint:, authorization:)
      request(method: :put, endpoint: endpoint, authorization: authorization)
    end

    private

    attr_reader :logger

    def request(method:, endpoint:, body: nil)
      url = URI(@config.url % endpoint)

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      http_method_class = HTTP_METHODS_CLASS[method]
      request = http_method_class.new(url)
      request['authorization'] = "Basic #{@config.api_key}"
      request['Content-Type'] = 'application/json'
      request['Accept'] = 'application/json'
      request.body = body.is_a?(Hash) ? body.to_json : body

      logger.info("Requesting #{method} #{url} with body: #{body}")
      response = http.request(request)

      RoutechApi::HttpResponse.new(response, logger: logger)
    end
  end
end
