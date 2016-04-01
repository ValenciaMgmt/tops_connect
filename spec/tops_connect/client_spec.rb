# frozen_string_literal: true
require 'spec_helper'

RSpec.describe TopsConnect::Client do
  describe '#new' do
    it 'creates a new client with a 32-character subscription key' do
      key = '0123456789abcdef0123456789abcdef'

      TopsConnect.configure { |config| config.subscription_key = key }

      expect(TopsConnect::Client.new).to be_a TopsConnect::Client
    end

    it 'fails when the subscription key is not 32 hex characters' do
      keys = [
        '0' * 31, '0' * 33, nil, '', '0123456789abcdef0123456789abcdeG',
        'abcdefghijklmnopqrstuvwxyz0123456', 'äbcdef0123456789äbcdef0123456789'
      ]

      keys.each do |key|
        expect do
          TopsConnect.configure { |config| config.subscription_key = key }
        end.to raise_exception RuntimeError
      end
    end
  end
end
