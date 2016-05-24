# frozen_string_literal: true
module TopsConnect
  class Client
    include HTTParty
    include TopsConnect::Communities
    include TopsConnect::Owners

    attr_reader :community_id, :community_api_key

    headers 'Content-Type' => 'application/json'
    headers 'api-version' => '1'

    base_uri 'https://topsconnectapi.azure-api.net'

    def initialize(community_id, community_api_key)
      authorization = Base64.strict_encode64 [
        TopsConnect.configuration.client_id,
        TopsConnect.configuration.software_key
      ].join(':')

      self.class.headers('authorization' => "Basic #{authorization}")

      @subscription_key = TopsConnect.configuration.subscription_key
      @community_id = community_id
      @community_api_key = community_api_key
    end

    def get(endpoint, headers: {}, query: {})
      response = self.class.get(
        "/#{TopsConnect.configuration.zone}/api#{endpoint}",
        query: query.merge('subscription-key' => @subscription_key),
        headers: headers.merge('community-api-key' => @community_api_key)
      )

      case response.code
      when 200
        response.parsed_response
      when 400..499
        raise BadRequest, response.parsed_response['message']
      else
        raise "#{response.code}: #{response.parsed_response['message']}"
      end
    end

    class BadRequest < Exception
    end
  end
end
