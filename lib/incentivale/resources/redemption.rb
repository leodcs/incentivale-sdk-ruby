module Incentivale
  module Resources
    class Redemption < Resource
      ENDPOINTS = { create: '/addresquest', find: '/existrequest' }

      def create(resource)
        client.post(ENDPOINTS[:create], resource)
      end

      def find(cod_request)
        client.get(ENDPOINTS[:find], { cod_request: cod_request })
      end
    end
  end
end
