# frozen_string_literal: true
module TopsConnect
  class Configuration
    # Has default settings, which can be overridden in the initializer.

    attr_accessor :subscription_key, :client_id, :software_key,
                  :community_api_key, :sandbox

    def initialize
      @sandbox = false

      @subscription_key = ''
      @client_id = ''
      @software_key = ''
      @community_api_key = ''
    end
  end
end
