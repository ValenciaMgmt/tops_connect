# frozen_string_literal: true
module TopsConnect
  class Base
    class << self
      attr_accessor :client
    end

    def get(*args)
      TopsConnect::Base.client.get(*args)
    end
  end
end
