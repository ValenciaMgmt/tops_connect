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
      ["#{address_number} #{street}", unit_number].compact.join(' #')
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

    def unit_number
      data['AptNumber'] unless data['AptNumber'].blank?
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
