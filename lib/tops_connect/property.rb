# frozen_string_literal: true

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
      property = data['Addresses']
        .find { |row| row['Type']['Name'] == 'Property' }

      lines = [
        property['AddressLine1'],
        property['AddressLine2'],
        "#{property['City']}, #{property['State']} #{property['Zip']}"
      ]

      lines
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
  end
end
