module Incentivale
  class Client
    attr_accessor :token

    def initialize(token)
      @token = token
    end

    def self.host
      case Incentivale.configuration.environment
      when :sandbox
        'https://api-prd-01-hom.incentivale.com.br'
      when :production
        'https://api-prd-01.incentivale.com.br'
      else
        raise StandardError, 'invalid environment provided'
      end
    end

    def get(path, params = {})
      request.get path, params.merge(campaign_token)
    end

    def post(path, resource = {})
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
