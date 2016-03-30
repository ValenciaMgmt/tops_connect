# frozen_string_literal: true
require 'spec_helper'

RSpec.describe TopsConnect::Communities do
  let(:client) { TopsConnect::Client.new }

  def stubbed_response(path)
    data_path = "../../../data/#{path.gsub(%r{/?sandbox/api/?}, '')}.json"

    {
      body: File.new(File.expand_path(data_path, __FILE__)),
      status: 200,
      headers: { 'Content-Type': 'application/json; charset=utf-8' }
    }
  end

  describe '#communities' do
    it 'GETs a list of communities' do
      expect(client.communities).to be_a Array
    end
  end
end
