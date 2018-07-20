module Incentivale
  class Token
    attr_accessor :valid_token

    def initialize
      @valid_token = generate_new_token
    end

    def inspect
      "#<#{self.class.name}:#{object_id}>"
    end

    def expires_at
      Time.parse(valid_token['.expires'])
    end

    def access_token
      valid_token['access_token']
    end

    def refresh
      self.valid_token = generate_new_token
      self
    end

    def expired?
      (Time.now.utc - expires_at) >= 3600
    end

    private

    def token_host
      Client.host + '/oauth/token'
    end

    def token_grants
      { username: Incentivale.configuration.username,
        password: Incentivale.configuration.password,
        grant_type: :password }
    end

    def generate_new_token
      connection = Faraday.new(url: token_host)
      response = connection.post do |request|
        request.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        request.body = URI.encode_www_form(token_grants)
      end
      Response.new(response)
    end
  end
end
