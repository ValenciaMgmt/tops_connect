# frozen_string_literal: true

# Copyright (c) 2019 Valencia Management Group
# All rights reserved.

module TopsConnect
  module Owners
    # Method: GET
    # Endpoint: Owner_GetList
    # Returns: Array<TopsConnect::Owner>
    def owners(property_key = nil)
      query = {}
      query['PropertyKey'] = property_key.to_i if property_key

      get('/owner', query: query).map do |owner_data|
        TopsConnect::Owner.new owner_data
      end
    end

    # Method: GET
    # Endpoint: Owner_Get
    # Returns: TopsConnect::Owner
    def owner(owner_key)
      TopsConnect::Owner.new get("/owner/#{owner_key}")
    end

    # Method: GET
    # Endpoint: Balance_Get
    # Returns: Hash
    def balance(owner_key)
      get "/owner/#{owner_key}/balance"
    end

    # Method: GET
    # Endpoint: Charge_Get
    # Returns: Hash
    def charges(owner_key)
      get "/charge/#{owner_key}"
    end

    # Method: PUT
    # Endpoint: Owner_Put
    # Returns: Hash
    def update_owner!(owner_key, data)
      put "/owner/#{owner_key}", body: data
    end
  end
end
