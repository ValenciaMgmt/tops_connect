# frozen_string_literal: true

# Copyright (c) 2019 Valencia Management Group
# All rights reserved.

module TopsConnect
  class Address < Base
    attr_reader :owner

    TYPES = {
      'Main' => 1,
      'Home' => 2,
      'Work' => 3,
      'Other' => 4,
      'Return Payment' => 5,
      'Lockbox' => 6,
      'Community Office' => 7,
      'Management Office' => 8,
      'Alternate' => 9,
      'Billing' => 10,
      'Property' => 11,
      'Shipping' => 12
    }.freeze

    def initialize(data, owner:)
      super(data)

      @owner = owner
    end

    def type
      @data['Type']['Name']
    end

    def to_s
      lines = address_lines

      return if lines.empty?

      # Foreign addresses do not have City/State/Zip
      if @data['City'] && @data['State'] && @data['Zip']
        lines << "#{@data['City']}, #{@data['State']} #{@data['Zip']}"
      end

      lines.map(&:strip).join("\n")
    end
    alias formatted to_s

    protected

    def address_lines
      lines = []

      if @data['AddressLine1'].match?(/[[:graph:]]/)
        lines << @data['AddressLine1']
      end

      if @data['AddressLine2'].match?(/[[:graph:]]/)
        lines << @data['AddressLine2']
      end

      lines
    end
  end
end
