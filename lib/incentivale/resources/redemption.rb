module Incentivale
  module Resources
    class Redemption < Resource
      ENDPOINTS = { create: '/addresquest',
                    exists: '/existrequest' }

      def create(resource)
        client.post(ENDPOINTS[:create], resource.merge(campaign_token))
      end

      def exists?(cod_request)
        client.get(ENDPOINTS[:exists], { cod_request: cod_request }.merge(campaign_token))
      end
    end
  end
end
