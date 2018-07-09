module Incentivale
  class Configuration
    attr_accessor :username
    attr_accessor :password
    attr_accessor :campaign

    def inspect
      "#<#{self.class.name}:#{object_id}>"
    end
  end
end
