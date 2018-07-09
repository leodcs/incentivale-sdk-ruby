module Incentivale
  class Token
    attr_accessor :valid_token

    def initialize(username, password)
      @credentials = { username: username, password: password }
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

    attr_accessor :credentials

    def token_host
      Client::HOST + '/oauth/token'
    end

    def generate_new_token
      Response.new Faraday.new.post(token_host, {
          grant_type: :password,
          username: credentials[:username],
          password: credentials[:password]
      })
    end
  end
end
