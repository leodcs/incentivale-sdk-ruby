module Incentivale
  module Resources
    class Redemption < Resource
      ENDPOINTS = { create: '/addresquest', show: '/existrequest' }

      def create(resource)
        client.post(ENDPOINTS[:create], resource)
      end

      def show(cod_request)
        client.get(ENDPOINTS[:exists], { cod_request: cod_request })
      end
    end
  end
end
