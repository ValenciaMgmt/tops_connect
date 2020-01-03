# frozen_string_literal: true

# Copyright (c) 2019 Valencia Management Group
# All rights reserved.

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
          key: charge_code['key'],
          code: charge_code['code'],
          description: charge_code['description'],
          name: nil
        }
      end
    end
  end
end
