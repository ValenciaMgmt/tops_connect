# frozen_string_literal: true
module TopsConnect
  class Property < Base
    def property_key
      data['PropertyKey']
    end
    alias id property_key

    def account_number
      data['AccountNumber']
    end

    def address
      "#{data['AddressNumber']} #{data['Street']}"
    end

    def city
      data['City']
    end

    def state
      data['State']
    end

    def address_number
      data['AddressNumber']
    end

    def street
      data['Street']
    end

    def zip
      data['Zip']
    end

    def community_key
      data['CommunityKey']
    end

    def updated_at
      return unless data['Metadata']['ModifiedDate']

      DateTime.parse data['Metadata']['ModifiedDate']
    end
    alias modified_date updated_at
  end
end
