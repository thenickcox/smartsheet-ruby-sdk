require 'smartsheet/api/file_spec'

module Smartsheet
  # Sheet Attachments Endpoints
  # @see https://smartsheet-platform.github.io/api-docs/?ruby#attachments API Attachments Docs
  class SheetsAttachments
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    def list(sheet_id:, params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(:get, ['sheets', :sheet_id, 'attachments'])
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          sheet_id: sheet_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def get(sheet_id:, attachment_id:, params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(
          :get,
          ['sheets', :sheet_id, 'attachments',
           :attachment_id]
      )
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          sheet_id: sheet_id,
          attachment_id: attachment_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def attach_url(sheet_id:, body:, params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(
          :post,
          ['sheets', :sheet_id, 'attachments'],
          body_type: :json
      )
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          body: body,
          sheet_id: sheet_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def delete(sheet_id:, attachment_id:, params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(
          :delete,
          ['sheets', :sheet_id, 'attachments', :attachment_id]
      )
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          sheet_id: sheet_id,
          attachment_id: attachment_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def attach_file(sheet_id:, file:, filename:, file_length:, content_type: '', params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(
          :post,
          ['sheets', :sheet_id, 'attachments'],
          body_type: :file
      )
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          file_spec: Smartsheet::API::ObjectFileSpec.new(file, filename, file_length, content_type),
          sheet_id: sheet_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def attach_file_from_path(sheet_id:, path:, filename: nil, content_type: '', params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(
          :post,
          ['sheets', :sheet_id, 'attachments'],
          body_type: :file
      )
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          file_spec: Smartsheet::API::PathFileSpec.new(path, filename, content_type),
          sheet_id: sheet_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def attach_new_version(
        sheet_id:,
        attachment_id:,
        file:,
        filename:,
        file_length:,
        content_type: '',
        params: {},
        header_overrides: {}
    )
      endpoint_spec = Smartsheet::API::EndpointSpec.new(
          :post,
          ['sheets', :sheet_id, 'attachments', :attachment_id, 'versions'],
          body_type: :file
      )
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          file_spec: Smartsheet::API::ObjectFileSpec.new(file, filename, file_length, content_type),
          sheet_id: sheet_id,
          attachment_id: attachment_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def attach_new_version_from_path(
        sheet_id:,
        attachment_id:,
        path:,
        filename: nil,
        content_type: '',
        params: {},
        header_overrides: {}
    )
      endpoint_spec = Smartsheet::API::EndpointSpec.new(
          :post,
          ['sheets', :sheet_id, 'attachments', :attachment_id, 'versions'],
          body_type: :file
      )
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          file_spec: Smartsheet::API::PathFileSpec.new(path, filename, content_type),
          sheet_id: sheet_id,
          attachment_id: attachment_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def delete_all_versions(sheet_id:, attachment_id:, params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(
          :delete,
          ['sheets', :sheet_id, 'attachments', :attachment_id, 'versions']
      )
      request_spec = Smartsheet::API::RequestSpec.new(
          params: params,
          header_overrides: header_overrides,
          sheet_id: sheet_id,
          attachment_id: attachment_id
      )
      client.make_request(endpoint_spec, request_spec)
    end

    def list_versions(sheet_id:, attachment_id:, params: {}, header_overrides: {})
      endpoint_spec = Smartsheet::API::EndpointSpec.new(
          :get,
          ['sheets', :sheet_id, 'attachments', :attachment_id, 'versions']
      )
      request_spec = Smartsheet::API::RequestSpec.new(
          header_overrides: header_overrides,
          params: params,
          sheet_id: sheet_id,
          attachment_id: attachment_id
      )
      client.make_request(endpoint_spec, request_spec)
    end
  end
end