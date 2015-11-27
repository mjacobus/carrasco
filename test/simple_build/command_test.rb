require 'test_helper'

class CommandTest < Minitest::Test
  def test_responds_to_command
    command = SimpleBuild::Command.new('command' => 'foo')
    assert_equal 'foo', command.command
  end

  def test_raises_error_when_no_command_is_passed
    assert_raises KeyError do
      SimpleBuild::Command.new.command
    end
  end

  def test_can_be_converted_to_string
    command = SimpleBuild::Command.new('command' => 'foo')
    assert_equal 'foo', command.to_s
  end
end
