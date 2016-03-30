# frozen_string_literal: true
module TopsConnect
  class Client
    include HTTParty
    include TopsConnect::Communities

    SANDBOX_API_URL = 'https://topsconnectapi.azure-api.net/sandbox/api'
    # TODO: Replace this with the non-sandbox API URL
    API_URL = 'https://topsconnectapi.azure-api.net/sandbox/api'

    headers 'Content-Type' => 'application/json'
    headers 'api-version' => '1'

    base_uri API_URL

    def initialize
      unless TopsConnect.configuration.subscription_key =~ /\A[0-9a-f]{32}\z/i
        raise 'Invalid Tops subscription key'
      end

      unless TopsConnect.configuration.client_id =~ /\A[0-9a-f-]{8,}\z/i
        raise 'Invalid Tops client ID'
      end

      unless TopsConnect.configuration.software_key =~ /\A[0-9a-f-]{8,}\z/i
        raise 'Invalid Tops software key'
      end

      unless TopsConnect.configuration.community_api_key =~ /\A[0-9a-f-]{8,}\z/i
        raise 'Invalid Tops community API key'
      end

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
      parameters['subscription-key'] = @subscription_key

      base = TopsConnect.configuration.sandbox ? SANDBOX_API_URL : API_URL

      response = self.class.get("#{base}#{endpoint}", query: parameters)

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
