# frozen_string_literal: true

# Copyright (c) 2019 Valencia Management Group
# All rights reserved.

module TopsConnect
  class Property < Base
    def property_key
      data['Key']
    end
    alias id property_key

    def account_number
      data['AccountNumber']
    end

    def address
      [*address_lines_with_unit_number, city_state_zip]
        .map(&:strip)
        .select { |line| line.match?(/[[:graph:]]/) }
        .join("\n")
    end

    def community_key
      data['CommunityKey']
    end

    def modified_date
      return unless data['Metadata']['ModifiedDate']

      Time.parse data['Metadata']['ModifiedDate']
    end
    alias updated_at modified_date

    def city_state_zip
      "#{property['City']}, #{property['State']} #{property['Zip']}"
    end

    protected

    def property
      @property ||= data['Addresses']
        .find { |row| row.dig('Type', 'Name') == 'Property' }
    end

    # Sometimes the unit number is alone on the second line
    def address_lines_with_unit_number
      if property['AddressLine2'].match?(/\A\d+\z/)
        return ["#{property['AddressLine1']} ##{property['AddressLine2']}"]
      end

      [
        property['AddressLine1'],
        property['AddressLine2']
      ]
    end
  end
end
