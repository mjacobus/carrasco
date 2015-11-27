require 'test_helper'

class SimpleBuildTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SimpleBuild::VERSION
  end
end
