# frozen_string_literal: true
require 'spec_helper'

RSpec.describe TopsConnect::Communities do
  let(:client) { TopsConnect::Client.new }

  describe '#communities' do
    it 'GETs a list of communities' do
      communities = client.communities

      expect(communities).to be_a Array
      expect(communities.length).to be 13
    end
  end
end
