require "thor/core_ext/hash_with_indifferent_access"

module Carrasco
  class Command
    attr_reader :command_name, :command, :description, :help

    def initialize(command_name, options = {})
      options = Thor::CoreExt::HashWithIndifferentAccess.new(options)
      @command_name = command_name
      @command      = options[:command]
      @help         = options[:help] || command_name
      @description  = options[:description] || "description not given"
    end
  end
end
