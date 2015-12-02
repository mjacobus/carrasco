module Carrasco
  class CommandExecuter
    def execute(command)
      system(command.to_s)
    end
  end
end
