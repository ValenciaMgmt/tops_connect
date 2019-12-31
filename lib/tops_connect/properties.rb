# frozen_string_literal: true

# Copyright (c) 2019 Valencia Management Group
# All rights reserved.

module TopsConnect
  module Properties
    # Method: GET
    # Endpoint: Property_GetList
    # Returns: Array<TopsConnect::Property>
    def properties
      get('/property').map do |property_data|
        TopsConnect::Property.new property_data
      end
    end

    # Method: GET
    # Endpoint: Property_Get
    # Returns: TopsConnect::Property
    def property(property_key)
      TopsConnect::Property.new get("/property/#{property_key}")
    end
  end
end
