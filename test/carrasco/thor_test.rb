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

  def test_execute_commands_throw_exceptions_if_fail
    subject = test_class.new
    subject.execute_commands([:add_one, :add_two], true)

    assert_equal [1, 2], subject.register
  end

  def test_throws_one_exception_if_should_not_break_on_failure
    error = assert_raises Carrasco::Thor::CommandFailed do
      test_class.new.execute_commands([:throw1, :throw2], false)
    end

    assert_equal "Failed with messages: 'throw1', 'throw2'", error.message
  end

  def test_throws_first_error_when_it_does_not_break_on_failure
    error = assert_raises StandardError do
      test_class.new.execute_commands([:throw1, :throw2], true)
    end

    assert_equal "throw1", error.message
  end

  private

  def subject
    Carrasco::Thor.new
  end

  def test_class
    Class.new(Carrasco::Thor) do
      no_commands do
        def register
          @register ||= []
        end

        def add_one
          register << 1
        end

        def add_two
          register << 2
        end

        def throw1
          raise "throw1"
        end

        def throw2
          raise "throw2"
        end
      end
    end
  end
end
