require_relative 'workspaces_share'

module Smartsheet
  # Workspaces Endpoints
  # @see https://smartsheet-platform.github.io/api-docs/?ruby#workspaces API Workspaces Docs
  #
  # @!attribute [r] share
  #   @return [WorkspacesShare]
  class Workspaces
    attr_reader :client, :share
    private :client

    def initialize(client)
      @client = client

      @share = WorkspacesShare.new(client)
    end

    def copy(workspace_id:, body:, params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(
          :post,
          ['workspaces', :workspace_id, 'copy'],
          body_type: :json
      )
      request_spec = Smartsheet::API::RequestSpec.new(
          header_overrides: header_overrides,
          params: params,
          body: body,
          workspace_id: workspace_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def create(body:, params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(:post, ['workspaces'], body_type: :json)
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          body: body
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def delete(workspace_id:, params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(:delete, ['workspaces', :workspace_id])
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          workspace_id: workspace_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def get(workspace_id:, params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(:get, ['workspaces', :workspace_id])
      request_spec = Smartsheet::API::RequestSpec.new(
          header_overrides: header_overrides,
          params: params,
          workspace_id: workspace_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def list(params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(:get, ['workspaces'])
      request_spec = Smartsheet::API::RequestSpec.new(
          header_overrides: header_overrides,
          params: params,
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def update(workspace_id:, body:, params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(
          :put,
          ['workspaces', :workspace_id],
          body_type: :json
      )
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          body: body,
          workspace_id: workspace_id
      )
      client.make_request(endpoint_spec, request_spec)
    end
  end
end