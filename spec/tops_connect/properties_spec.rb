# frozen_string_literal: true
require 'spec_helper'

RSpec.describe TopsConnect::Owners do
  let(:client) do
    TopsConnect::Client.new(6, 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE')
  end

  describe '#properties' do
    it 'GETs a list of properties' do
      properties = client.properties

      expect(properties).to be_a Array
      expect(properties[0]).to be_a TopsConnect::Property
      expect(properties.length).to be 58
    end
  end

  describe '#property' do
    it 'GETs a specific property' do
      property = client.property(6)

      expect(property).to be_a TopsConnect::Property
      expect(property.account_number).to eq '113CVD'
    end
  end
end
