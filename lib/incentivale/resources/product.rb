module Incentivale
  module Resources
    class Product < Resource
      INDEX_ENDPOINT = '/products'

      def all
        response = client.get(INDEX_ENDPOINT, { token: Incentivale.configuration.campaign })
        response.success ? response.products : response.message_return
      end
    end
  end
end
