require "test_helper"

class GroupTest < Minitest::Test
  def test_raises_error_when_no_commands_are_given
    error = assert_raises Carrasco::Group::InvalidGroupError do
      Carrasco::Group.new 'foo', {}
    end

    assert_equal "Commands not provided for group 'foo'", error.message
  end

  def test_can_create_group_from_hash_definition
    group_name = "group_name"
    commands = [:foo, :bar]
    options = { "commands"     => commands,
                "description" => "the_description",
                "help"        => "the_help" }

    group = Carrasco::Group.new group_name, options
    assert_equal "group_name", group.command_name
    assert_equal commands, group.commands
    assert_equal "the_description", group.description
    assert_equal "the_help", group.help
  end

  def test_help_defaults_to_group_name
    group = Carrasco::Group.new "group_name", 'commands' =>  []
    assert_equal "group_name", group.help
  end

  def test_description_has_default
    group = Carrasco::Group.new "group_name", 'commands' => []
    assert_equal "description not given", group.description
  end

  def test_break_on_failure_has_default
    group = Carrasco::Group.new "group_name", 'commands' => []
    assert_equal true, group.break_on_failure

    group = Carrasco::Group.new "group_name", {
      'commands' => [],
      break_on_failure: false
    }

    assert_equal false, group.break_on_failure
  end
end
