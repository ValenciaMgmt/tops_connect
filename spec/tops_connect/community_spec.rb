# frozen_string_literal: true
require 'spec_helper'

RSpec.describe TopsConnect::Community do
  let(:client) { TopsConnect::Client.new }
  let(:community) { client.community(6) }

  describe '#balance' do
    it 'GETs a list of charge codes' do
      codes = community.charge_codes

      expect(codes.length).to eq 15
      expect(codes[4][:description]).to eq 'Interest'
    end
  end
end
