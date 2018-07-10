module Incentivale
  module Resources
    class Egift < Resource
      ENDPOINTS = { availability: '/availabilitystockegift', create: '/transactionegift' }

      def available?(sku, amount_premium = 1)
        resp = client.get(ENDPOINTS[:availability], { sku: sku, amount_premium: amount_premium })
        resp.availability
      end

      def create(resource)
        client.post(ENDPOINTS[:create], resource)
      end
    end
  end
end
