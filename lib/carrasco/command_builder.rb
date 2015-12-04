require "thor/core_ext/hash_with_indifferent_access"

module Carrasco
  class CommandBuilder
    def from_config(config)
      config = Thor::CoreExt::HashWithIndifferentAccess.new(config)
      klass = Class.new(Thor)

      config['commands'].each do |method, options|
        command = Command.new(method, options)
        inject_command_into_class(command, klass)
      end

      klass
    end

    def inject_command_into_class(command, klass)
      klass.desc(command.help, command.description)
      klass.class_eval do
        define_method(command.command_name) do
          execute_command(command)
        end
      end
    end
  end
end
