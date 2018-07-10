module Incentivale
  module Resources
    class Resource
      attr_reader :client

      def initialize(client)
        @client = client
      end
    end
  end
end
