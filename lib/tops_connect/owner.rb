# frozen_string_literal: true
module TopsConnect
  class Owner
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def id
      data['OwnerKey']
    end
    alias owner_key id

    def alternate_mailing_addresses
      [1, 2].map do |n|
        next unless data["AltMailing#{n}AddressLine1"]

        city = data["AltMailing#{n}City"]
        state = data["AltMailing#{n}State"]
        zip = data["AltMailing#{n}Zip"]

        lines = [data["AltMailing#{n}AddressLine1"]]

        if data["AltMailing#{n}AddressLine2"] !~ /[^[:space:]]/
          lines << data["AltMailing#{n}AddressLine2"]
        end

        lines << "#{city}, #{state} #{zip}"

        lines.reject(&:blank?).join("\n")
      end.compact
    end

    def property_id
      data['PropertyKey']
    end

    def community_id
      data['CommunityKey']
    end

    def legal_name
      data['LegalName']
    end

    def alternate_name
      data['AlternateName']
    end

    def home_phone
      data['PhoneHome']
    end

    def alternate_phone
      data['PhoneAlt']
    end

    def fax
      data['PhoneFax']
    end

    def work_phone
      data['PhoneWork']
    end

    def updated_at
      return unless data['Metadata']['ModifiedDate']

      DateTime.parse data['Metadata']['ModifiedDate']
    end

    def owner?
      data['ResidentType'] == 'Owner'
    end

    def tenant?
      data['ResidentType'] == 'Tenant'
    end

    def move_out_date
      return unless data['MoveOutDate']

      DateTime.parse data['MoveOutDate']
    end

    def settlement_date
      return unless data['SettlementDate']

      DateTime.parse data['SettlementDate']
    end
  end
end
