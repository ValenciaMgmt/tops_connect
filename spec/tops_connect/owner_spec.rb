# frozen_string_literal: true
require 'spec_helper'

RSpec.describe TopsConnect::Owner do
  let(:client) do
    TopsConnect::Client.new(6, 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE')
  end
  let(:owner) { client.owner(3) }

  describe '#balance' do
    it 'GETs an owner\'s balance' do
      balance = client.balance(owner.owner_key)

      expect(balance['BalanceTotal']).to eq 35
    end
  end

  describe '#charges' do
    it 'GETs the charges on an owner\'s account' do
      charges = client.charges(owner.id)

      expect(charges.length).to eq 1
    end
  end
end
