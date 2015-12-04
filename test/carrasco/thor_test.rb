require "test_helper"

class ThorTest < Minitest::Test
  def setup
    subject.command_executer = nil
  end

  def test_executes_command
    skip
  end

  def test_can_override_command_executer
    assert_instance_of Carrasco::CommandExecuter, subject.command_executer
    object = stub
    subject.command_executer = object
    assert_same object, subject.command_executer
  end

  def test_can_execute_commands
    executer = stub
    executer.expects(:execute!).with("foo")
    subject.command_executer = executer
    subject.execute_command("foo")
  end

  private

  def subject
    Carrasco::Thor.new
  end
end
