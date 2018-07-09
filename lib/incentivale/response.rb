module Incentivale
  class Response < SimpleDelegator
    def initialize(response)
      @response = response
      if json.is_a?(Hash)
        super(RecursiveOpenStruct.new(json, recurse_over_arrays: true))
      else
        super(@response.body)
      end
      @response
    end

    def json
      @json ||= JSON.parse(@response.body).to_snake_keys
    end
  end
end
