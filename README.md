# Apply

[![Gem Version][gem-badge]][gem]
[![Build status][build-badge]][build]
[![Coverage Status][coverage-badge]][coverage]

Apply wraps single-argument procs in a conditional closure. If the condition is true for argument, then it is
passed to the proc. If the condition is false, the argument is returned immediately

## Usage

```ruby
require "apply"

# Upcase strings that start with a lowercase letter
upcaser = Apply(&:upcase).if { |value| value =~ /^[a-z]/ }

%w{ Alice bob Carol }.map(&upcaser) # => [ "Alice", "BOB", "Carol" ]

# Parenthesize non-nil values
parenthesizer = Apply { |text| "(#{text})" }.unless(&:nil?)

[ "Alice", nil, "Carol" ].map(&parenthesizer) # => [ "(Alice)", nil, "(Bob)" ]

```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apply'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install apply

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.
 You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update
the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the
version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johncarney/apply. This project is
intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[gem-badge]:        https://badge.fury.io/rb/apply.svg
[gem]:              http://badge.fury.io/rb/apply
[build-badge]:      https://travis-ci.org/johncarney/apply.svg?branch=master
[build]:            https://travis-ci.org/johncarney/apply
[coverage-badge]:   https://img.shields.io/coveralls/johncarney/apply.svg
[coverage]:         https://coveralls.io/r/johncarney/apply?branch=master
