# frozen_string_literal: true
module TopsConnect
  class Client
    include HTTParty
    include TopsConnect::Communities
    include TopsConnect::Owners

    headers 'Content-Type' => 'application/json'
    headers 'api-version' => '1'

    base_uri 'https://topsconnectapi.azure-api.net'

    def initialize
      authorization = Base64.encode64 [
        TopsConnect.configuration.client_id,
        TopsConnect.configuration.software_key
      ].join(':')

      self.class.headers(
        'authorization' => "Basic #{authorization}",
        'community-api-key' => TopsConnect.configuration.community_api_key
      )

      @subscription_key = TopsConnect.configuration.subscription_key
    end

    def get(endpoint, parameters = {})
      response = self.class.get(
        "#{TopsConnect.configuration.zone}/api#{endpoint}",
        query: parameters.merge('subscription-key' => @subscription_key)
      )

      case response.code
      when 200
        response.parsed_response
      when 400
        raise BadRequest, response.parsed_response['Message']
      else
        raise "#{response.code}: #{response.parsed_response['Message']}"
      end
    end

    class BadRequest < Exception
    end
  end
end
