# frozen_string_literal: true

# Copyright (c) 2019 Valencia Management Group
# All rights reserved.

module TopsConnect
  class Owner < Base
    def owner_key
      data['Key']
    end
    alias id owner_key

    def addresses
      @addresses ||= data['Addresses'].map do |record|
        TopsConnect::Address.new(record, owner: self)
      end
    end

    def alternate_mailing_addresses
      addresses
        .select { |address| address.type == 'Alternate' }
        .map(&:formatted)
        .compact
    end

    def property_key
      data['PropertyKey']
    end

    def community_key
      data['CommunityKey']
    end

    def legal_name
      data['LegalName']
    end

    def alternate_name
      data['AlternateName']
    end

    def home_phone
      phone = data['Phones'].find { |row| row['Type']['Name'] == 'Home' }

      phone['PhoneNumber'] if phone
    end

    def alternate_phone
      phone = data['Phones'].find { |row| row['Type']['Name'] == 'Alternate' }

      phone['PhoneNumber'] if phone
    end

    def fax
      phone = data['Phones'].find { |row| row['Type']['Name'] == 'Fax' }

      phone['PhoneNumber'] if phone
    end

    def work_phone
      phone = data['Phones'].find { |row| row['Type']['Name'] == 'Work' }

      phone['PhoneNumber'] if phone
    end

    def updated_at
      return unless data['Metadata']['ModifiedDate']

      Time.parse data['Metadata']['ModifiedDate']
    end

    def owner?
      data['ResidentType'] == 'Owner'
    end

    def tenant?
      data['ResidentType'] == 'Tenant'
    end

    def move_out_date
      return unless data['MoveOutDate']

      Time.parse data['MoveOutDate']
    end

    def settlement_date
      return unless data['SettlementDate']

      Time.parse data['SettlementDate']
    end

    def hold_payment?
      data['Metadata']['HoldPayment']
    end

    def hold_collection?
      data['Metadata']['HoldCollection']
    end

    # The internal key used by Tops Pro - property number, homeowner type,
    # owner number in the format PPPPPPTOOO.
    def tops_id
      data['Metadata']['TopsId']
    end
  end
end
