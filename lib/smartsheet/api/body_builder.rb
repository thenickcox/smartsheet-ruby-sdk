require 'json'

module Smartsheet
  module API
    # Constructs bodys for accessing the Smartsheet API
    class BodyBuilder
      def initialize(endpoint_spec, request_spec)
        @endpoint_spec = endpoint_spec
        @request_spec = request_spec
      end

      def build
        json_body if endpoint_spec.sending_json?
      end

      private

      attr_accessor :endpoint_spec, :request_spec

      def json_body
        if request_spec.body.nil?
          return nil
        end

        request_spec.body.is_a?(String) ?
            request_spec.body :
            request_spec.body.to_json
      end
    end
  end
end