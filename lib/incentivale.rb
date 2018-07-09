require "time"
require "json"
require "faraday"
require "awrence"
require "plissken"
require 'forwardable'
require "incentivale/api"
require "incentivale/auth"
require "incentivale/token"
require "incentivale/client"
require "incentivale/request"
require "incentivale/version"
require "incentivale/response"
require "recursive-open-struct"
require "incentivale/configuration"
require "incentivale/resources/product"

module Incentivale
  class << self
    extend Forwardable
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
      build_api
    end

    def build_api
      token = Token.new
      @api = Api.new(Client.new(token))
    end

    def_delegators :@api, :products
  end
end
