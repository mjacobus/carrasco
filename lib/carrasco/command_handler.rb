module Carrasco
  class CommandHandler
    def handle(command)
      system(command.to_s)
      $?.exitstatus
    end
  end
end
