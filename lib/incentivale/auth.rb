module Incentivale
  class Auth
    attr_accessor :client

    def initialize(client)
      @client = client
    end

    def header
      "Bearer #{client.current_token.access_token}"
    end
  end
end
