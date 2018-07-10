module Incentivale
  module Resources
    class Tracking < Resource
      ENDPOINTS = { show: '/findtracking' }

      def show(cod_request)
        client.get(ENDPOINTS[:show], { cod_request: cod_request }.merge(campaign_token))
      end
    end
  end
end
