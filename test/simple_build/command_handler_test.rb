require 'test_helper'

require "simple_build/command"

class CommandHandlerTest < Minitest::Test
  def setup
    system("rm -rf #{test_file}")
  end

  def test_returns_exit_code
    assert handle("ls /tmp/foo 2&> /dev/null") > 0
    assert_equal 0, handle("touch #{test_file}")
    assert File.exist?(test_file)
  end

  private

  def handle(command)
    command = SimpleBuild::Command.new(command: command)
    SimpleBuild::CommandHandler.new.handle(command)
  end

  def test_file
    "/tmp/#{self.class}.txt"
  end
end
