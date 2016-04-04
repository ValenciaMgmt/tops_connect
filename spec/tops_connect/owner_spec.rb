# frozen_string_literal: true
require 'spec_helper'

RSpec.describe TopsConnect::Owner do
  let(:client) { TopsConnect::Client.new }
  let(:owner) { client.owner(3) }

  describe '#balance' do
    it 'GETs an owner\'s balance' do
      balance = owner.balance

      expect(balance['BalanceTotal']).to eq 35
    end
  end

  describe '#charges' do
    it 'GETs the charges on an owner\'s account' do
      charges = owner.charges

      expect(charges.length).to eq 1
    end
  end
end
