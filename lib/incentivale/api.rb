# frozen_string_literal: true

module Incentivale
  class Api
    BLOCKED_USER = 'Usuário bloqueado temporariamente'

    attr_reader :client

    def initialize(client)
      @client = client
    end

    def products
      Incentivale::Resources::Product.new(client)
    end

    def redemption
      Incentivale::Resources::Redemption.new(client)
    end

    def tracking
      Incentivale::Resources::Tracking.new(client)
    end

    def egift
      Incentivale::Resources::Egift.new(client)
    end

    def available?
      return @available if @available

      test_request = tracking.find(nil)

      @available = test_request.success != false ||
                   return_message(test_request) != BLOCKED_USER
    end

    private

    def return_message(request)
      request.try(:messagereturn) || request.try(:message_return)
    end
  end
end
