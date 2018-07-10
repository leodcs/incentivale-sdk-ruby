module Incentivale
  class Api
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def products
      Incentivale::Resources::Product.new(client)
    end

    def redemption
      Incentivale::Resources::Redemption.new(client)
    end

    def tracking
      Incentivale::Resources::Tracking.new(client)
    end
  end
end
