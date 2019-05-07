# frozen_string_literal: true

module TopsConnect
  module Communities
    # Method: GET
    # Endpoint: Community_GetList
    # Returns: Array<TopsConnect::Community>
    def communities
      get('/community').map do |community_data|
        TopsConnect::Community.new community_data
      end
    end

    # Method: GET
    # Endpoint: Community_Get
    # Returns: TopsConnect::Community
    def community
      TopsConnect::Community.new get("/community/#{@community_id}")
    end

    # Method: GET
    # Endpoint: ChargeCode_GetList
    # Returns: Array<Hash>
    def charge_codes
      get('/chargecode').map do |charge_code|
        {
          key: charge_code['ChargeCodeKey'],
          code: charge_code['Code'],
          description: charge_code['Description'],
          name: charge_code['Name']
        }
      end
    end
  end
end
