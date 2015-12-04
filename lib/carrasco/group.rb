require "thor/core_ext/hash_with_indifferent_access"

module Carrasco
  class Group
    InvalidGroupError = Class.new(StandardError)

    attr_reader :command_name, :commands, :description, :help, :break_on_failure

    def initialize(group_name, options = {})
      options = Thor::CoreExt::HashWithIndifferentAccess.new(options)
      @command_name     = group_name
      @help             = options[:help] || command_name
      @description      = options[:description] || "description not given"
      @break_on_failure = options[:break_on_failure]
      @break_on_failure = true if break_on_failure.nil?
      @commands         = options.fetch('commands') do
        raise InvalidGroupError, "Commands not provided for group '#{group_name}'"
      end
    end

    def inject_into_class(klass)
      group = self
      klass.desc(help, description)
      klass.class_eval do
        define_method(group.command_name) do
          execute_commands(group.commands, group.break_on_failure)
        end
      end
    end
  end
end
