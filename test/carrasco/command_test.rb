require "test_helper"

class CommandTest < Minitest::Test
  def test_can_create_command_from_hash_definition
    command_name = "my_command"
    options = { "command"     => "the_command",
                "description" => "the_description",
                "help"        => "the_help" }

    command = Carrasco::Command.new command_name, options
    assert_equal "my_command", command.command_name
    assert_equal "the_command", command.command
    assert_equal "the_description", command.description
    assert_equal "the_help", command.help
  end

  def test_help_defaults_to_command_name
    command = Carrasco::Command.new "the_command"
    assert_equal "the_command", command.help
  end

  def test_description_has_default
    command = Carrasco::Command.new "the_command"
    assert_equal "description not given", command.description
  end

  def test_command_defaults_to_command_name
    command = Carrasco::Command.new "command_name"
    assert_equal "command_name", command.command
  end

  def test_command_to_string_returns_command
    command = Carrasco::Command.new "command_name", command: "command"
    assert_equal "command", command.to_s
  end

  def test_injection_invokes_description
    klass = stub()
    klass.expects(:desc).with("list", "desc")
    klass.expects(:class_eval)

    command = Carrasco::Command.new(
      "command_name",
      help: "list",
      description: "desc",
      command: "ls"
    )

    command.inject_into_class(klass)
  end

  def test_can_inject_command_into_class
    command = Carrasco::Command.new("command_name", description: "list", command: "ls")
    klass = Class.new(Carrasco::Thor)

    command.inject_into_class(klass)
    assert klass.new.respond_to?(:command_name)
  end

end
