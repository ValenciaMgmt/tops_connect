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
    end
  end
end
