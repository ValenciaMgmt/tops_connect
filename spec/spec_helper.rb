# frozen_string_literal: true
require 'webmock/rspec'
require 'tops_connect'

def stubbed_get_response(path)
  data_path = "../../data/#{path.gsub(%r{/?sandbox/api/?}, '')}.json"

  {
    body: File.new(File.expand_path(data_path, __FILE__)),
    status: 200,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Cache-Control': 'no-cache',
      # 'Content-Length': '435',
      'Date': 'Wed, 30 Mar 2016 17:49:27 GMT',
      'Expires': '-1',
      'Pragma': 'no-cache',
      'Vary': 'Accept-Encoding',
      'X-AspNet-Version': '4.0.30319',
      'X-Powered-By': 'ASP.NET'
    }
  }
end

TopsConnect.configure do |config|
  config.subscription_key = '0123456789abcdef0123456789abcdef'
  config.client_id = '00000000-1111-2222-3333-444444444444'
  config.software_key = '55555555-6666-7777-8888-999999999999'
  config.community_api_key = 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE'
  config.sandbox = true
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.disable_monkey_patching!
  config.warnings = true
  # config.profile_examples = 10
  config.order = :random

  Kernel.srand config.seed
end

# We never want to actually hit the API. All data should be stored in the data
# directory, and new data can be found through the Postman client.
WebMock.disable_net_connect!

WebMock.stub_request(:get, %r{topsconnectapi.azure-api.net/sandbox/api})
  .to_return { |request| stubbed_get_response(request.uri.path) }
