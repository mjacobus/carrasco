require "test_helper"

class CommandBuilderTest < Minitest::Test
  def test_defines_command_in_the_class
    klass = Carrasco::CommandBuilder.new.from_config(config)

    assert klass.new.respond_to?(:command1)
  end

  def test_from_config_creates_commands
    klass = Carrasco::CommandBuilder.new.from_config(config)
  end

  def test_does_not_break_with_empty_config
    klass = Carrasco::CommandBuilder.new.from_config({})
  end

  def test_creates_groups
    assert generated_class.new.respond_to?(:group1)
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

  def generated_class
    Carrasco::CommandBuilder.new.from_config(config)
  end

  def config
    {
      commands: {
        command1: {
          description: "desc",
          command: "ls /tmp",
        },
        command2: {
          description: "desc",
          command: "ls /tmp",
        }
      },
      groups: {
        group1: {
          description: "command group",
          commands: [
            :command1,
            :command2,
          ]
        }
      }
    }
  end
end
