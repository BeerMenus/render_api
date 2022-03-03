# frozen_string_literal: true

require_relative "./base"

module RenderAPI
  module Clients
    class Services < Base
      def find(service_id)
        endpoint.get("/services/#{service_id}")
      end

      def list(limit: nil, cursor: nil, filters: nil)
        endpoint.get(
          "/services",
          params: list_parameters(limit: limit, cursor: cursor, filters: filters)
        )
      end
    end
  end
end
