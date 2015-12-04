require "thor/core_ext/hash_with_indifferent_access"

module Carrasco
  class CommandBuilder
    def from_config(config)
      config = Thor::CoreExt::HashWithIndifferentAccess.new(config)
      klass = Class.new(Thor)

      build_commands(config[:commands] || [], klass)
      build_grups(config[:groups] || [], klass)

      klass
    end

    private

    def build_commands(commands, klass)
      commands.each do |method, options|
        command = Command.new(method, options)
        command.inject_into_class(klass)
      end
    end

    def build_grups(groups, klass)
      groups.each do |group_name, options|
        Group.new(group_name, options).inject_into_class(klass)
      end
    end
  end
end
