# frozen_string_literal: true
module TopsConnect
  class Community
    attr_reader :id

    def initialize(data)
      @data = data
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
  end
end
