# frozen_string_literal: true
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
