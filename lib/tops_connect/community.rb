# frozen_string_literal: true
module TopsConnect
  class Community < Base
    attr_reader :id

    def initialize(client, data = nil)
      @data = data

      super client
    end

    def data
      @data || reload!
    end

    def reload!
      @data = get "/community/#{@client.community_id}"
    end

    def code
      data['CommunityID']
    end

    def name
      data['Name']
    end

    def city
      data['DefaultCity']
    end

    def state
      data['DefaultState']
    end

    def zip
      data['DefaultZip']
    end

    def last_synced_at
      DateTime.parse data['LastSyncTime'] if data['LastSyncTime']
    end

    def updated_at
      return nil unless data['Metadata']['ModifiedDate']

      DateTime.parse data['Metadata']['ModifiedDate']
    end

    # Method: GET
    # Endpoint: ChargeCode_GetList
    def charge_codes
      get('/chargecode').map do |charge_code|
        {
          key: charge_code['ChargeCodeKey'],
          code: charge_code['Code'],
          description: charge_code['Description']
        }
      end
    end
  end
end
