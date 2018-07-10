module Incentivale
  class Client
    HOST = 'https://central-incentivale.herokuapp.com' # FIXME 'https://central.incentivale.com.br'

    attr_accessor :token, :auth

    def initialize(token)
      @token = token
      @auth = Auth.new(self)
    end

    def get(path, params={})
      request.get path, params.merge(campaign_token)
    end

    def post(path, resource={})
      request.post path, resource.merge(campaign_token)
    end

    def current_token
      @token.expired? ? new_token : token
    end

    private

    def request
      Request.new(self)
    end

    def campaign_token
      @campaign_token ||= { token: Incentivale.configuration.campaign }
    end

    def new_token
      self.token = token.refresh
    end
  end
end
