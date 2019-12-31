# frozen_string_literal: true

# Copyright (c) 2019 Valencia Management Group
# All rights reserved.

module TopsConnect
  class Configuration
    attr_reader :subscription_key, :client_id, :software_key, :zone

    def subscription_key=(key)
      unless key&.match?(/\A\h{32}\z/i)
        raise 'Invalid TOPS Subscription Key. Expected 32 hex characters.'
      end

      @subscription_key = key.downcase
    end

    def client_id=(key)
      unless key&.match?(/\A\h{8}-\h{4}-\h{4}-\h{4}-\h{12}\z/)
        raise 'Invalid TOPS Client ID. Expected a GUID.'
      end

      @client_id = key.upcase
    end

    def software_key=(key)
      unless key&.match?(/\A\h{8}-\h{4}-\h{4}-\h{4}-\h{12}\z/)
        raise 'Invalid TOPS Software Key. Expected a GUID.'
      end

      @software_key = key.upcase
    end

    def zone=(new_zone)
      unless %i[broad limited sandbox].include?(new_zone.to_sym)
        raise 'Invalid TOPS Zone. Accepted values are broad, limited, sandbox.'
      end

      @zone = new_zone.to_sym
    end
  end
end
