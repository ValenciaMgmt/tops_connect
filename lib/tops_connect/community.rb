# frozen_string_literal: true

module TopsConnect
  class Community < Base
    def community_key
      data['CommunityKey']
    end
    alias id community_key

    def community_id
      data['CommunityID']
    end
    alias code community_id

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

    def modified_date
      return unless data['Metadata']['ModifiedDate']

      DateTime.parse data['Metadata']['ModifiedDate']
    end
    alias updated_at modified_date
  end
end
