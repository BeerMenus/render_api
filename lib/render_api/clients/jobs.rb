# frozen_string_literal: true

require_relative "./base"

module RenderAPI
  module Clients
    class Jobs < Base
      def create(service_id, start_command:, plan_id: nil)
        body = { startCommand: start_command }
        body[:planId] = plan_id unless plan_id.nil?

        endpoint.post(
          "/services/#{service_id}/jobs", body: body
        )
      end

      def find(service_id, job_id)
        endpoint.get(
          "/services/#{service_id}/jobs/#{job_id}"
        )
      end

      def list(service_id, limit: nil, cursor: nil, filters: nil)
        endpoint.get(
          "/services/#{service_id}/jobs",
          params: list_parameters(limit: limit, cursor: cursor, filters: filters)
        )
      end
    end
  end
end
