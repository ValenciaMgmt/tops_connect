# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TopsConnect::Owner do
  let(:client) do
    TopsConnect::Client.new(6, 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE')
  end
  let(:owner) { client.owner(3) }
  let(:offsite_owner) { client.owner(999) }

  describe '#addresses' do
    it 'does a thing' do
      addresses = offsite_owner.addresses

      alternate_addresses = addresses
        .filter { |address| address.type == 'Alternate' }

      expect(alternate_addresses.count).to eq 1

      alternate = alternate_addresses[0]

      expect(alternate.formatted).to eq "123 Main Street\nAnytown, CA 12345"
    end
  end

  describe '#alternate_mailing_addresses' do
    it 'loads mailing addresses for the owner' do
      mailing_addresses = offsite_owner.alternate_mailing_addresses

      expect(mailing_addresses.length).to eq 1

      expect(mailing_addresses[0]).to eq "123 Main Street\nAnytown, CA 12345"
    end
  end

  describe '#balance' do
    it 'GETs an owner\'s balance' do
      balance = client.balance(owner.owner_key)

      expect(balance['BalanceTotal']).to eq 35
    end
  end

  describe '#hold_payment?' do
    it 'indicates if an owner\'s payments are on hold status' do
      expect(owner.hold_payment?).to be false
    end
  end

  describe '#charges' do
    it 'GETs the charges on an owner\'s account' do
      charges = client.charges(owner.id)

      expect(charges.length).to eq 1
    end
  end
end
