# frozen_string_literal: true
module TopsConnect
  module Owners
    # Method: GET
    # Endpoint: Owner_Get
    def owner(owner_id)
      get "/owner/#{owner_id.to_i}"
    end

    # Method: GET
    # Endpoint: Owner_GetList
    def owners(property_id = nil)
      parameters = {}
      parameters['PropertyKey'] = property_id.to_i if property_id

      get '/owner', parameters
    end

    # Method: GET
    # Endpoint: Balance_Get
    def balance(owner_id)
      get "/balance/#{owner_id.to_i}"
    end
  end
end
