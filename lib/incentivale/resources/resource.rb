module Incentivale
  module Resources
    class Resource
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def campaign_token
        @campaign_token ||= { token: Incentivale.configuration.campaign }
      end
    end
  end
end
