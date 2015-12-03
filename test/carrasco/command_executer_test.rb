require "test_helper"

class CommandExecuter < Minitest::Test
  def setup
    system("rm -rf #{test_file}")
  end

  def test_returns_exit_code
    assert handle("ls /tmp/foo 2&> /dev/null") > 0
    assert_equal 0, handle("touch #{test_file}")
    assert File.exist?(test_file)
  end

  def test_execute_bang_throws_exception_when_command_fails
    script = "ls /tmp/foo 2&> /dev/null"

    error = assert_raises Carrasco::CommandExecuter::CommandError do
      command = Carrasco::Command.new("command", command: script)
      Carrasco::CommandExecuter.new.execute!(command)
    end

    expected_message = "Command '#{script}' exited with code 2"
    assert_equal expected_message, error.message
  end

  private

  def handle(command)
    command = Carrasco::Command.new(command)
    Carrasco::CommandExecuter.new.execute(command)
  end

  def test_file
    "/tmp/#{self.class}.txt"
  end
end
