# Carrasco

Heartless and easy script execution.

Simple task runner, yaml config file.

Motivation:

Often in projects we have ./bin folder with project related scripts.
On top of that there's grunt, rake, composer... sass compilation tasks...

When trying to figure out what script/task to run we have to check many sources.

Then I decided to make it simpler and a bit more organized. Now we can run
`carrasco` and all tasks will be listed. Well, all of the tasks listed in the
`.carrasco.yml` file anyway.

[![Build Status](https://travis-ci.org/mjacobus/carrasco.svg)](https://travis-ci.org/mjacobus/carrasco)
[![Coverage Status](https://coveralls.io/repos/mjacobus/carrasco/badge.svg?branch=master&service=github)](https://coveralls.io/github/mjacobus/carrasco?branch=master)
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
    description: execute ruby tests
    command: rake test

  phpunit:
    description: execute php tests
    command: ./bin/vendor/phpunit --configuration=tests/phpunit.xml

  clear_cache:
    description: Clears the application cache
    command: rm -rf ./app/cache

  composer_install:
    description: install php dependencies
    command: composer install

  npm_install:
    description: install node dev tools
    command: npm_install

  clear_cache:
    description: clears application cache
    command: rm -rf ./storage/cache/*

  db_create:
    description: creates database
    command: ./bin/db_create.sh

  db_migrate:
    description: migrates database
    command: ./bin/db_migrate.sh

groups:
  qa:
    description: Runs qa tools
    # if you want phpunit to run even if the test task fails you should set
    # break_on_failure to true
    #
    # it will return non zero status code if any of the commands fail
    # even if break_on_failure is set to false
    #
    # this option defaults to true
    break_on_failure: false
    commands:
      - test
      - phpunit
      # - grunt test

  app_setup:
    description: run all commands to install the app
    commands:
      - composer_install
      - npm_install
      - clear_cache
      - db_create
      - db_migrate
```

You can execute:

1 - If you installed with `gem install`

```bash
carrasco            # list commands
carrasco phpunit    # phpunit only
carrasco qa         # all qa scripts
carrasco app_setup  # install the application dependencies
```

2 - If you used bundler

```bash
bundle exec carrasco            # list commands
bundle exec carrasco phpunit    # phpunit only
bundle exec carrasco qa         # all qa scripts
bundle exec carrasco app_setup  # install the application dependencies
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mjacobus/carrasco. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

