module TopsConnect
  class Client
    include HTTParty

    base_uri 'https://topsconnectapi.azure-api.net/sandbox/api'

    def initialize(subscription_key:)
      self.class.headers 'Ocp-Apim-Subscription-Key', subscription_key
    end
  end
end
