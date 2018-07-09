module Incentivale
  class Client
    HOST = 'http://localhost:3000' # FIXME 'https://central.incentivale.com.br'
    attr_accessor :token, :auth

    def initialize(token)
      @token = token
      @auth = Auth.new(self)
    end

    def get(path, params)
      request.get(path, params)
    end

    def post(path, resource)
      request.post(path, resource)
    end

    def current_token
      @token.expired? ? new_token : token
    end

    private

    def request
      Request.new(self)
    end

    def new_token
      self.token = token.refresh
    end
  end
end
