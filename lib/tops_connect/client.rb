# frozen_string_literal: true

# Copyright (c) 2019 Valencia Management Group
# All rights reserved.

module TopsConnect
  class Client
    include HTTParty
    include TopsConnect::Communities
    include TopsConnect::Owners
    include TopsConnect::Properties

    attr_reader :community_id, :community_api_key

    headers 'Content-Type' => 'application/json'

    # TODO: Sandbox uses /sandbox/api/v2, Broad uses /v2/broad/api
    base_uri 'https://topsconnectapi.azure-api.net/v2'

    def initialize(community_id, community_api_key)
      authorization = Base64.strict_encode64 [
        TopsConnect.configuration.client_id,
        TopsConnect.configuration.software_key
      ].join(':')

      self.class.headers('authorization' => "Basic #{authorization}")

      @subscription_key = TopsConnect.configuration.subscription_key

      switch_community(community_id, community_api_key)
    end

    def switch_community(community_id, community_api_key)
      @community_id = community_id
      @community_api_key = community_api_key
    end

    def get(endpoint, headers: {}, query: {})
      response = self.class.get(
        "/#{TopsConnect.configuration.zone}/api#{endpoint}",
        query: query.merge('subscription-key' => @subscription_key),
        headers: headers.merge('community-api-key' => @community_api_key)
      )

      raise_exception(response) unless response.code == 200

      response.parsed_response
    end

    def put(endpoint, body: {}, headers: {}, query: {})
      response = self.class.put(
        "/#{TopsConnect.configuration.zone}/api#{endpoint}",
        query: query.merge('subscription-key' => @subscription_key),
        headers: headers.merge('community-api-key' => @community_api_key),
        body: body.to_json
      )

      raise_exception(response) unless response.code == 204

      response.parsed_response
    end

    def post(endpoint, body: {}, headers: {}, query: {})
      response = self.class.post(
        "/#{TopsConnect.configuration.zone}/api#{endpoint}",
        query: query.merge('subscription-key' => @subscription_key),
        headers: headers.merge('community-api-key' => @community_api_key),
        body: body.to_json
      )

      raise_exception(response) unless response.code == 200

      response.parsed_response
    end

    protected

    def raise_exception(response)
      case response.code
      when 404 then raise TopsConnect::NotFoundError, response
      when 400..499 then raise TopsConnect::ClientError, response
      when 500..599
        message = TopsConnect::ApiError.error_message(response.parsed_response)

        # These errors can largely be ignored - it's not our fault
        raise TopsConnect::TimeoutError, response if message['Timeout expired']

        raise TopsConnect::InternalError, response
      else
        # As far as I'm aware, Tops does not return 100 - 199 or 205 - 399.
        raise TopsConnect::ApiError, response
      end
    end
  end
end
