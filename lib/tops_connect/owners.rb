# frozen_string_literal: true
module TopsConnect
  module Owners
    # Method: GET
    # Endpoint: Owner_Get
    def owner(owner_id)
      TopsConnect::Owner.new self, owner_id, get("/owner/#{owner_id}")
    end

    # Method: GET
    # Endpoint: Owner_GetList
    def owners(property_id = nil)
      query = {}
      query['PropertyKey'] = property_id.to_i if property_id

      get('/owner', query: query).map do |owner|
        TopsConnect::Owner.new self, owner['OwnerKey'], owner
      end
    end
  end
end
