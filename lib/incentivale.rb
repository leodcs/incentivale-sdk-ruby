require "time"
require "json"
require "faraday"
require "awrence"
require "plissken"
require "incentivale/api"
require "incentivale/auth"
require "incentivale/token"
require "incentivale/client"
require "incentivale/request"
require "incentivale/version"
require "incentivale/response"
require "recursive-open-struct"
require "incentivale/resources/product"

module Incentivale
  def self.new(username, password)
    token = Token.new(username, password)
    Api.new Client.new(token)
  end
end
