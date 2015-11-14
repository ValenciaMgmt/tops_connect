require 'spec_helper'

RSpec.describe TopsConnect::Client do
  def create_client(key)
    TopsConnect::Client.new(subscription_key: key, sandbox: true)
  end

  describe '#new' do
    it 'creates a new client with a 32-character subscription key' do
      key = '0123456789abcdef0123456789abcdef'

      expect(create_client key)
        .to be_a TopsConnect::Client
    end

    it 'fails when the subscription key is not 32 hex characters' do
      keys = ['0' * 31, '0' * 33, nil, '', '0123456789abcdef0123456789abcdeG']

      keys.each do |key|
        expect { create_client key }.to raise_exception RuntimeError
      end
    end
  end
end
