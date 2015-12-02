require "thor"

module Carrasco
  class Thor < ::Thor
    no_commands do
      def execute_command(command)
        command_executer.execute(command)
      end

      def command_executer=(command_executer)
        @command_executer = command_executer
      end

      def command_executer
        @command_executer ||= CommandExecuter.new
      end
    end
  end
end
