# frozen_string_literal: true
require 'base64'
require 'httparty'
require 'json'

require 'tops_connect/communities'
require 'tops_connect/owners'

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
