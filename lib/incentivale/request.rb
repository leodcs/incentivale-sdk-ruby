module Incentivale
  class Request
    API_ENDPOINT = '/api/v3'

    attr_accessor :connection

    def initialize(client)
      @connection = Faraday.new(url: Client::HOST) do |conn|
        conn.token_auth(client.auth.header)
        conn.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        conn.request :url_encoded
        conn.adapter Faraday.default_adapter
      end
    end

    def get(url, params = {})
      Response.new connection.get(request_path(url), params.to_camel_keys)
    end

    def post(url, resource = {})
      Response.new connection.post(request_path(url), resource_to_post(resource))
    end

    private

    def resource_to_post(resource)
      URI.encode_www_form(serialize_resource_keys(resource))
    end

    def serialize_resource_keys(hash)
      hash.to_snake_keys.to_camel_keys.map { |k, v| [k.to_s,v] }
    end

    def request_path(url)
      API_ENDPOINT + url
    end
  end
end
