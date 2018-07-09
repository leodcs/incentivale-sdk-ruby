module Incentivale
  module Resources
    class Product
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def base_path
        '/products'
      end

      def all
        response = client.get(base_path, { token: Incentivale.configuration.campaign })
        response.success ? response.products : response.message_return
      end
    end
  end
end
