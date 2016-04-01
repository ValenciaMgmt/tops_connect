# frozen_string_literal: true
require 'spec_helper'

RSpec.describe TopsConnect::Communities do
  let(:client) { TopsConnect::Client.new }

  describe '#owners' do
    it 'GETs a list of owners' do
      owners = client.owners

      expect(owners).to be_a Array
      expect(owners.length).to be 58
    end

    it 'GETs a list of owners by property' do
      owners = client.owners(12)

      expect(owners.length).to eq 2
    end
  end

  describe '#owner' do
    it 'GETs a specific owner' do
      owner = client.owner(12)

      expect(owner['LegalName']).to eq 'Yvette Harvey'
    end
  end

  describe '#balance' do
    it 'GETs an owner\'s balance' do
      balance = client.balance(3)

      expect(balance['BalanceTotal']).to eq 35
    end
  end
end
