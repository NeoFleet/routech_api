# frozen_string_literal: true

require 'ostruct'

# Routech Module
module RoutechApi
  # Crud Module
  module Crud
    # Service class
    class Service
      SERVICE_ENDPOINT = '/serviceapi/services'

      def get
        response = RoutechApi::Request.new.get(
          endpoint: SERVICE_ENDPOINT
        )

        raise RoutechApi::NotFounded unless response.success?

        OpenStruct.new(response.body)
      end

      def create(attributes = {})
        response = RoutechApi::Request.new.post(
          endpoint: SERVICE_ENDPOINT,
          body: attributes
        )

        raise RoutechApi::NotCreated unless response.success?

        OpenStruct.new(response.body)
      end

      def show(id)
        response = RoutechApi::Request.new.get(
          endpoint: SERVICE_ENDPOINT + "/#{id}"
        )

        raise RoutechApi::NotFounded unless response.success?

        OpenStruct.new(response.body)
      end

      def update(attributes = {})
        response = RoutechApi::Request.new.post(
          endpoint: SERVICE_ENDPOINT,
          body: attributes
        )

        raise RoutechApi::NotUpdated unless response.success?

        OpenStruct.new(response.body)
      end

      def delete(id)
        response = RoutechApi::Request.new.delete(
          endpoint: SERVICE_ENDPOINT + "/#{id}"
        )

        raise RoutechApi::NotDeleted unless response.success?
      end

      def bulk_create(attributes = [])
        response = RoutechApi::Request.new.post(
          endpoint: "#{SERVICE_ENDPOINT}/batch",
          body: attributes
        )

        raise RoutechApi::NotCreated unless response.success?

        OpenStruct.new(response.body)
      end
    end
  end
end
