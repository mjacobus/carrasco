require "test_helper"

class CommandBuilderTest < Minitest::Test
  def test_can_inject_command_into_class
    klass = stub()
    klass.expects(:desc).with("the_help", "the_description")
    klass.expects(:class_eval)

    Carrasco::CommandBuilder.new.inject_command_into_class(command, klass)
  end

  def test_defines_command_in_the_class
    klass = Class.new(::Thor)

    Carrasco::CommandBuilder.new.inject_command_into_class(command, klass)

    assert klass.new.respond_to?(:command_name)
  end

  private

  def command
    command = stub({
      "command"      => "the_command",
      "command_name" => "command_name",
      "description"  => "the_description",
      "help"         => "the_help"
    })
  end
end
