# TopsConnect

TopsConnect is a Ruby gem for accessing the Tops Connect API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tops_connect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tops_connect

## Usage

```ruby
TopsConnect.configure do |config|
  config.subscription_key = '0123456789abcdef0123456789abcdef'
  config.client_id = '00000000-1111-2222-3333-444444444444'
  config.software_key = '55555555-6666-7777-8888-999999999999'
  config.community_api_key = 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE'
end

tops = TopsConnect::Client.new

tops.communities.each do |community|
  puts community['Name']
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ValenciaMgmt/tops_connect.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
