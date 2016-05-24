# frozen_string_literal: true
require 'spec_helper'

RSpec.describe TopsConnect::Communities do
  let(:client) do
    TopsConnect::Client.new(6, 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE')
  end

  describe '#communities' do
    it 'GETs a list of communities' do
      communities = client.communities

      expect(communities).to be_a Array
      expect(communities.length).to be 13
    end
  end
end
