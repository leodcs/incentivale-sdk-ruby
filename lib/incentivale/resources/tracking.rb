module Incentivale
  module Resources
    class Tracking < Resource
      ENDPOINTS = { find: '/findtracking' }

      def find(cod_request)
        client.get(ENDPOINTS[:find], { cod_request: cod_request })
      end
    end
  end
end
