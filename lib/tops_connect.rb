# frozen_string_literal: true

# Copyright (c) 2019 Valencia Management Group
# All rights reserved.

require 'base64'
require 'httparty'
require 'json'
require 'time'

require 'tops_connect/errors'

require 'tops_connect/communities'
require 'tops_connect/owners'
require 'tops_connect/properties'

require 'tops_connect/base'
require 'tops_connect/community'
require 'tops_connect/owner'
require 'tops_connect/property'
require 'tops_connect/address'

require 'tops_connect/configuration'
require 'tops_connect/client'
require 'tops_connect/version'

module TopsConnect
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new

      yield(configuration) if block_given?

      configuration
    end
  end
end
