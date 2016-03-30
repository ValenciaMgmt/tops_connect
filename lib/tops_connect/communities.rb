# frozen_string_literal: true
module TopsConnect
  module Communities
    # Method: GET
    # Endpoint: Community_GetList
    def communities
      get '/community'
    end

    # Method: GET
    # Endpoint: Community_Get
    def community(community_id)
      get "/community/#{community_id.to_i}"
    end
  end
end
