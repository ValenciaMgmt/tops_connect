# frozen_string_literal: true

# Copyright (c) 2019 Valencia Management Group
# All rights reserved.

module TopsConnect
  class Base
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def [](key)
      @data[key]
    end
  end
end
