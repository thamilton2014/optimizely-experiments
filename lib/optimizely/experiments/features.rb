module Optimizely
  module Experiments
    class Features
      attr_accessor :features

      # Description:
      #   The main class in which we interact with our features.
      #
      def initialize
        @features = {}

        yield(self) if block_given?
      end

      # Description:
      #   The main method that creates a default object if one does not exist.
      #
      def self.default
        @@default ||= Features.new
      end

      # Description:
      #   Creates a new Experiments object.
      #
      # Example:
      #   Optimizely::Experiments::Features.configure do |items|
      #     items[:example_item] = true
      #   end
      #
      def configure
        yield(self) if block_given?
      end

      # Description:
      #   Adds a key/value pair to our items hash.
      #
      # @param [Symbol] name - the name of the experiment.
      # @param [Boolean] value - The value of the experiment (true/false).
      #
      def []=(name, value)
        @features[name] = value
      end
    end
  end
end