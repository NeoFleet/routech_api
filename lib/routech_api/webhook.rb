# frozen_string_literal: true

require 'ostruct'

# Routech Module
module RoutechApi
  # Webhook class
  class Webhook
    WEBHOOK_ENDPOINT = 'api/vbeta/webhook'

    def create(_attributes = {})
      response = RoutechApi::Request.new.post(
        endpoint: WEBHOOK_ENDPOINT,
        body: body
      )

      raise RoutechApi::NotCreated unless response.success?

      OpenStruct.new(response.body)
    end
  end
end
