require "thor"

module Carrasco
  class Thor < ::Thor
    CommandFailed = Class.new(StandardError)

    no_commands do
      def execute_command(command)
        command_executer.execute!(command)
      end

      def command_executer=(command_executer)
        @@command_executer = command_executer
      end

      def command_executer
        @@command_executer ||= CommandExecuter.new
      end

      def execute_commands(commands, break_on_failure)
        if break_on_failure
          return execute_with_break_on_failure(commands)
        end

        errors = []

        commands.each do |command|
          begin
            send(command)
          rescue StandardError => e
            errors << e.message
          end
        end

        unless errors.empty?
          messages = errors.map {|e| "'#{e}'"}
          raise CommandFailed, "Failed with messages: #{messages.join(', ')}"
        end
      end

      private

      def execute_with_break_on_failure(commands)
        commands.each do |command|
          send(command)
        end
      end
    end
  end
end
