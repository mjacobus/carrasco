module Carrasco
  class CommandExecuter
    CommandError = Class.new(StandardError)
    def execute(command)
      system(command.to_s)
      $?.exitstatus
    end

    def execute!(command)
      code = execute(command)

      unless code == 0
        raise CommandError.new("Command '#{command}' exited with code #{code}")
      end
    end
  end
end
