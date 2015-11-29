# Carrasco

Heartless and easy script execution

[![Build Status](https://travis-ci.org/mjacobus/carrasco.svg)](https://travis-ci.org/mjacobus/carrasco)
[![Code Coverage](https://scrutinizer-ci.com/g/mjacobus/carrasco/badges/coverage.png?b=master)](https://scrutinizer-ci.com/g/mjacobus/carrasco/?branch=master)
[![Code Climate](https://codeclimate.com/github/mjacobus/carrasco/badges/gpa.svg)](https://codeclimate.com/github/mjacobus/carrasco)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/mjacobus/carrasco/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/mjacobus/carrasco/?branch=master)
[![Dependency Status](https://gemnasium.com/mjacobus/carrasco.svg)](https://gemnasium.com/mjacobus/carrasco)
[![Gem Version](https://badge.fury.io/rb/carrasco.svg)](https://badge.fury.io/rb/carrasco)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'carrasco'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrasco

## Usage

Given you have a config file like the following in the root of your project:

```yaml
# .carrasco.yml

commands:

  test:
    help: test
    description: execute ruby tests
    command: rake test

  phpunit:
    help: phpunit
    description: execute php tests
    command: ./bin/vendor/phpunit --configuration=tests/phpunit.xml

# to be implemented
groups:
  qa:
    - test
    - phpunit
```

You can execute:

```bash
carrasco all     # all your tasks
carrasco phpunit # phpunit only
carrasco qa      # all qa scripts
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mgjacobus/carrasco. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

