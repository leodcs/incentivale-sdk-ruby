module Incentivale
  class Request
    attr_accessor :client, :connection

    def initialize(client)
      @client = client
      @connection = Faraday.new(url: Client::HOST) do |conn|
        conn.token_auth(client.auth.header)
        conn.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        conn.adapter  Faraday.default_adapter
      end
    end

    def get(url, params={})
      Response.new connection.get(request_path(url), params)
    end

    def post(url, resource)
      Response.new connection.post(request_path(url), resource.to_camel_keys)
    end

    # def put(path, resource)
    #   options = opts.merge(body: HashKeys.convert(resource, to: :camel_case).to_json)
    #   resp = self.class.put path, options
    #
    #   create_response resp
    # end
    #
    # def delete(path)
    #   resp = self.class.delete path, opts
    #
    #   create_response resp
    # end
    private

    def request_path(url)
      '/api/v3' + url
    end
  end
end
