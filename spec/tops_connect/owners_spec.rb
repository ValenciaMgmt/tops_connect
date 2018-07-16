# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TopsConnect::Owners do
  let(:client) do
    TopsConnect::Client.new(6, 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE')
  end

  describe '#owners' do
    it 'GETs a list of owners' do
      owners = client.owners

      expect(owners).to be_a Array
      expect(owners[0]).to be_a TopsConnect::Owner
      expect(owners.length).to be 58
    end

    it 'GETs a list of owners by property ID' do
      owners = client.owners(12)

      expect(owners).to be_a Array
      expect(owners[0]).to be_a TopsConnect::Owner
      expect(owners.length).to eq 2
    end
  end

  describe '#owner' do
    it 'GETs a specific owner' do
      owner = client.owner(12)

      expect(owner).to be_a TopsConnect::Owner
      expect(owner.legal_name).to eq 'Yvette Harvey'
    end
  end
end
