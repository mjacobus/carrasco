$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

def simplecov
  require "simplecov"

  SimpleCov.start do
    add_filter "/test/"
    add_group "lib", "lib"
  end
end

if ENV['COVERALLS']
  require "coveralls"
  Coveralls.wear!
end

if ENV['COVERAGE']
  simplecov
end

if ENV['SCRUTINIZER']
  require "scrutinizer/ocular"
  Scrutinizer::Ocular.watch!
end

require 'carrasco'
require 'minitest/autorun'
require 'mocha/mini_test'
