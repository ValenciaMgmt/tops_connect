# frozen_string_literal: true
module TopsConnect
  module Communities
    # Method: GET
    # Endpoint: Community_GetList
    # Returns: Array<Hash>
    def communities
      get('/community')
    end

    # Method: GET
    # Endpoint: Community_Get
    # Returns: TopsConnect::Community
    def community
      TopsConnect::Community.new self
    end
  end
end
