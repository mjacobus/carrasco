# SimpleBuild

Execution of scripts made easy

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_build'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_build

## Usage

Given you have a config file like the following in the root of your project:

```yaml
# .simple_build.yml

commands:

  phpunit:
    command: ./bin/vendor/phpunit --configuration=tests/phpunit.xml

  phpcs:
    command: ./bin/vendor/php-cs-fixer fix --level=psr2 lib

  sass:
    command: grunt sass

groups:
  qa:
    - phpunit
    - phpcs
```

You can execute:

```bash
simple_build all     # all your tasks
simple_build phpunit # phpunit only
simple_build qa      # all qa scripts
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mgjacobus/simple_build. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

