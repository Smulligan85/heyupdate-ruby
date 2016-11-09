# HeyUpdate Ruby Client

A Ruby toolkit for [HeyUpdate]() API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'heyupdate-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heyupdate-ruby

## Usage

Call for the HeyUpdate API are relative to the base url
[https://api.heyupdate.com](https://api.heyupdate.com)

API actions are available as methods on the client object. Currently, the
HeyUpdate client has the following methods:

| Action               	                   | Method             					                           |
|:-----------------------------------------|:--------------------------------------------------------|
| **Update**                               |                   					                             |
| Retrieve all update data          	     | `#updates`                         |
| Post a new update         	             | `#post_update(message, options={})` |
| Edit an existing update   	             | `#edit_update(update_id, message=nil, timestamp=nil)`               |

## Usage Examples


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/heyupdate. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
