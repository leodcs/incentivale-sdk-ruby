module Incentivale
  module Resources
    class Product < Resource
      ENDPOINTS = { index: '/products' }

      def all
        response = client.get(ENDPOINTS[:index], { token: Incentivale.configuration.campaign })
        response.success ? response.products : response
      end
    end
  end
end
