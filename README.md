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
| Retrieve all update data          	     | `#updates`                                              |
| Post a new update         	             | `#post_update(message, options={})`                     |
| Edit an existing update   	             | `#edit_update(update_id,message=nil,timestamp=nil)`     |

## Usage Examples

**Authentication**

First grab your API_KEY found in [your account settings](https://hookdev.heyupdate.com/user/settings) and initialize a new client.

After that, you can integrate with other services.

```ruby
require "heyupdate"

API_KEY = "<your_api_key>"

heyupdate_client = Heyupdate::Client.new(API_KEY)
```

Here are some common use cases for the HeyUpdate API client.

**You can retrieve all update data from your account.**

```ruby
heyupdate_client.updates

# =>
[{"id":67007,"timestamp":"2016-10-04T02:15:27+0000","created_at":"2016-10-04T02:15:27+0000","updated_at":"2016-10-04T02:15:27+0000","user":{"id":1311,"email":"rkcudjoe+dev@hookengine.com","name":"Raymond
        Cudjoe"},"team":{"id":521,"name":"hookdev"},"question":"What did you do today?","message":"I
        published a second article today and then shared it on Reddit, Twitter and
        Facebook."}]
```

**You can post a new update**

```ruby
heyupdate_client.post_update("I wrote a blog post on Angular today")

# =>
{"id":67147,"timestamp":"2016-10-05T03:14:33+0000","created_at":"2016-10-05T03:14:33+0000","updated_at":"2016-10-05T03:14:33+0000","user":{"id":1311,"email":"rkcudjoe+dev@hookengine.com","name":"Raymond
        Cudjoe"},"team":{"id":521,"name":"hookdev"},"question":"What did you do today?","message":"I
        wrote a blog post on Angular today"}
```

** You can edit an existing update**

```ruby
heyupdate_client.edit_update("67007", "I updated my Angular 2 blog post")

# =>
{"id":67007,"timestamp":"2016-10-04T02:15:27+0000","created_at":"2016-10-04T02:15:27+0000","updated_at":"2016-10-05T03:10:18+0000","user":{"id":1311,"email":"rkcudjoe+dev@hookengine.com","name":"Raymond
        Cudjoe"},"team":{"id":521,"name":"hookdev"},"question":"What did you do today?","message":"I
        updated my Angular 2 blog post"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/heyupdate. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it [https://github.com/hookengine/heyupdae-ruby/fork](https://github.com/hookengine/heyupdae-ruby/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
