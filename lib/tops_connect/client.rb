module TopsConnect
  class Client
    include HTTParty
    include TopsConnect::Communities

    SANDBOX_API_URL = 'https://topsconnectapi.azure-api.net/sandbox/api'
    # TODO: Replace this with the non-sandbox API URL
    API_URL = 'https://topsconnectapi.azure-api.net/sandbox/api'

    headers 'Content-Type' => 'application/json'

    def initialize(subscription_key:, sandbox: false)
      unless subscription_key =~ /\A[0-9a-f]{32}\z/i
        fail 'Invalid subscription key'
      end

      @subscription_key = subscription_key.downcase

      self.class.headers 'Ocp-Apim-Subscription-Key' => @subscription_key
      self.class.base_uri(sandbox ? SANDBOX_API_URL : API_URL)
    end

    def get(endpoint)
      response = self.class.get(endpoint)

      case response.code
      when 200
        response.parsed_response
      when 400
        fail BadRequest, response.parsed_response['Message']
      else
        fail "#{response.code}: #{response.parsed_response['Message']}"
      end
    end

    class BadRequest < Exception
    end
  end
end
