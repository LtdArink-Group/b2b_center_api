# B2bCenterApi

API for http://www.b2b-center.ru/

## Installation

Add this line to your application's Gemfile:

    gem 'b2b_center_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install b2b_center_api

## Usage

```ruby
require 'b2b_center_api'

B2bCenterApi::Settings.soap_configure(
  wsdl: 'http://demo.b2b-center.ru/market/remote.html?wsdl',
  proxy: 'http://login:pass@address:port',
  env_namespace: 'SOAP-ENV',
  filters: [:password],
  pretty_print_xml: true,
  log: false
)

B2bCenterApi::Settings.auth_configure(
  auth: { login: 'login', password: 'pass' }
)

b2b = B2bCenterApi::Client.new

ps = b2b.remote_auction.get_participants(18_501)

puts 'participants:'
puts ps
puts 'offers for first participant:'
puts ps[0].offers
```

## Documentation

http://www.rubydoc.info/gems/b2b_center_api

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
