module SimpleBuild
  class Command
    def initialize(options = {})
      @options = {}
      options.each do |key, value|
        @options[key.to_sym] = value
      end
    end

    def command
      @options.fetch(:command)
    end

    alias_method :to_s, :command
  end
end
