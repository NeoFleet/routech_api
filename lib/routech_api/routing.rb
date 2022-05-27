# frozen_string_literal: true

require 'ostruct'

# Routech Module
module RoutechApi
  # Routing class
  class Routing
    ROUTING_ENDPOINT = 'api/vbeta/routing'

    def create(attributes = {})
      response = RoutechApi::Request.new.post(
        endpoint: ROUTING_ENDPOINT,
        body: attributes
      )

      raise RoutechApi::NotCreated unless response.success?

      OpenStruct.new(response.body)
    end
  end
end
