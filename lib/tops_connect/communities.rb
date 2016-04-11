# frozen_string_literal: true
module TopsConnect
  module Communities
    # Method: GET
    # Endpoint: Community_GetList
    def communities
      get('/community').map do |community|
        TopsConnect::Community.new community['CommunityKey'], community
      end
    end

    # Method: GET
    # Endpoint: Community_Get
    def community(community_id)
      TopsConnect::Community.new community_id
    end
  end
end
