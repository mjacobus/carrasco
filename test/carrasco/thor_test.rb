require "test_helper"

class ThorTest < Minitest::Test
  def test_executes_command
    skip
  end

  def test_can_override_command_executer
    assert_instance_of Carrasco::CommandExecuter, subject.command_executer
    object = stub
    subject.command_executer = object
    assert_same object, subject.command_executer
  end

  private

  def subject
    Carrasco::Thor.new
  end
end
