module Incentivale
  module Resources
    class Redemption < Resource
      CREATE_ENDPOINT = '/addresquest'

      def create(resource)
        client.post(CREATE_ENDPOINT, resource)
      end
    end
  end
end
