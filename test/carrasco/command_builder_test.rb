require "test_helper"

class CommandBuilderTest < Minitest::Test
  def test_can_inject_command_into_class
    command = stub({ "command"      => "the_command",
                "command_name" => "command_name",
                "description"  => "the_description",
                "help"         => "the_help" })

    klass = stub()
    klass.expects(:desc).with("the_help", "the_description")
    klass.expects(:class_eval)

    Carrasco::CommandBuilder.new.inject_command_into_class(command, klass)
  end
end
