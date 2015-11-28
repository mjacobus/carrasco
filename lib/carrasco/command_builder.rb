require "thor"

module Carrasco
  class CommandBuilder
    def from_config(config)
      klass = Class.new(Thor)

      config['commands'].each do |method, options|
        help        = options.fetch('help')
        description = options.fetch('description')
        command     = options.fetch('command')

        klass.class_eval do
          desc help, description
          define_method (method) do
            system(command)
          end
        end
      end

      klass
    end
  end
end
