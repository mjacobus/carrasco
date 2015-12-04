require "test_helper"

class CommandBuilderTest < Minitest::Test
  def test_can_inject_command_into_class
    klass = stub()
    klass.expects(:desc).with("the_help", "the_description")
    klass.expects(:class_eval)

    Carrasco::CommandBuilder.new.inject_command_into_class(command, klass)
  end

  def test_defines_command_in_the_class
    klass = Carrasco::CommandBuilder.new.from_config(config)

    assert klass.new.respond_to?(:command1)
  end

  def test_from_config_creates_commands
    klass = Carrasco::CommandBuilder.new.from_config(config)
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

  def config
    {
      commands: {
        command1: {
          description: "desc",
          command: "ls /tmp",
        }
      }
    }
  end
end
