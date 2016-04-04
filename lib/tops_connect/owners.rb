# frozen_string_literal: true
module TopsConnect
  module Owners
    # Method: GET
    # Endpoint: Owner_Get
    def owner(owner_id)
      TopsConnect::Owner.new owner_id
    end

    # Method: GET
    # Endpoint: Owner_GetList
    def owners(property_id = nil)
      parameters = {}
      parameters['PropertyKey'] = property_id.to_i if property_id

      get('/owner', parameters).map do |owner|
        TopsConnect::Owner.new owner['OwnerKey'], owner
      end
    end
  end
end
