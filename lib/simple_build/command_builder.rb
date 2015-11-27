require "thor"

module SimpleBuild
  class CommandBuilder
    def definitions(file = nil)
      {
        commands: {
          phpunit: {
            help: "phpunit ARGS",
            description: "A description for phpunit",
            command: "phpunit --version"
          },
          phpcs: {
            help: "phpcs ARGS",
            description: "A description for php cs",
            command: "phpcs --version"
          }
        }
      }
    end

    def from_file(file = nil)

      klass = Class.new(Thor)


      definitions[:commands].each do |method, options|
        help        = options.fetch(:help)
        description = options.fetch(:description)
        command     = options.fetch(:command)

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
