# FaradayBoolean

Faraday response parser for boolean body

[![Gem Version](https://badge.fury.io/rb/faraday_boolean.svg)](https://badge.fury.io/rb/faraday_boolean)
[![Build Status](https://travis-ci.org/sue445/faraday_boolean.svg?branch=master)](https://travis-ci.org/sue445/faraday_boolean)
[![Coverage Status](https://coveralls.io/repos/sue445/faraday_boolean/badge.svg?branch=master&service=github)](https://coveralls.io/github/sue445/faraday_boolean?branch=master)
[![Code Climate](https://codeclimate.com/github/sue445/faraday_boolean/badges/gpa.svg)](https://codeclimate.com/github/sue445/faraday_boolean)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'faraday_boolean'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install faraday_boolean

## Usage

```sh
$ curl http://example.com/boolean/true
true
```

```ruby
require "faraday_boolean"

connection =
  Faraday.new(url: "http://example.com") do |conn|
    conn.response :boolean
    conn.adapter Faraday.default_adapter
  end

res = connection.get("/boolean/true")

res.body
#=> true

res.body.class
#=> TrueClass
```

If don't use `conn.response :boolean`, return `"true"` of `String` class

```ruby
connection =
  Faraday.new(url: "http://example.com") do |conn|
    # conn.response :boolean
    conn.adapter Faraday.default_adapter
  end

res = connection.get("/boolean/true")

res.body
#=> "true"

res.body.class
#=> String
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sue445/faraday_boolean.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

