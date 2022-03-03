# frozen_string_literal: true

require_relative "./base"

module RenderAPI
  module Clients
    class Owners < Base
      def find(owner_id)
        endpoint.get("/owners/#{owner_id}")
      end

      def list(limit: nil, cursor: nil, filters: nil)
        endpoint.get(
          "/owners",
          params: list_parameters(limit: limit, cursor: cursor, filters: filters)
        )
      end
    end
  end
end
