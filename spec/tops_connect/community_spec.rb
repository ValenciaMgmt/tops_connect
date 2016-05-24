# frozen_string_literal: true
require 'spec_helper'

RSpec.describe TopsConnect::Community do
  let(:client) do
    TopsConnect::Client.new(6, 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE')
  end

  let(:community) { client.community }

  describe '#balance' do
    it 'GETs a list of charge codes' do
      codes = community.charge_codes

      expect(codes.length).to eq 15
      expect(codes[4][:description]).to eq 'Interest'
    end
  end
end
