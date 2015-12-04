require "test_helper"

class CommandExecuter < Minitest::Test
  def setup
    system("rm -rf #{test_file}")
  end

  def test_returns_exit_code
    assert execute("ls /tmp/file_that_does_not_exist 2&> /dev/null") > 0,
      "failed command returns non zero"

    assert_equal 0, execute("touch #{test_file}"),
      "success command returns zero"

    assert File.exist?(test_file),
      "file was created"
  end

  def test_execute_bang_throws_exception_when_command_fails
    script = "ls /tmp/foo 2&> /dev/null"

    error = assert_raises Carrasco::CommandExecuter::CommandError do
      command = Carrasco::Command.new("command", command: script)
      Carrasco::CommandExecuter.new.execute!(command)
    end

    regexp = /Command '#{script}' exited with code \d/
    assert_match regexp, error.message
  end

  private

  def execute(command)
    command = Carrasco::Command.new(command)
    Carrasco::CommandExecuter.new.execute(command)
  end

  def test_file
    "/tmp/#{self.class}.txt"
  end
end
