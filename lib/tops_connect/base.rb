# frozen_string_literal: true
module TopsConnect
  class Base
    def initialize(client)
      @client = client
    end

    def get(*args)
      @client.get(*args)
    end
  end
end
