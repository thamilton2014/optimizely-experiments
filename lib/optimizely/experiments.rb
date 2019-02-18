require "optimizely/experiments/version"

module Optimizely
  module Experiments
    include Experiment

    def self.included(cls)
      cls.extend(Experiment)
    end

    class << self
      # Description:
      #   Configures any experiments that are within the scope of the page object.
      #
      # Example:
      #   Optimizely::Experiments.configure do |experiments|
      #     experiments[:example_name_1] = true
      #     experiments[:example_name_2] = false
      #   end
      #
      def configure
        if block_given?
          yield(Features.default)
        else
          Features.default
        end
      end

      # Description:
      #   Adds experiments prior to page object initialization.
      #
      # Example:
      #   Optimizely::Experiments.add(:example_1, true)
      #   Optimizely::Experiments.add(:example_2, false)
      #
      # @param [Symbol] name - The experiment/feature name to enable/disable.
      # @param [Boolean] value - Enables or disables the experiment/feature based on boolean value.
      #
      def add(name, value)
        Features.default.features[name] = value
      end

      # Description:
      #   A helper method that enables/updates an experiment/feature to `true`.
      #
      # Example:
      #   Optimizely::Experiments.activate(:example_1) # => true
      #
      # @param [Symbol] name - The experiment/feature to enable.
      #
      def activate(name)
        add(name, true)
      end

      # Description:
      #   A helper method that disables/updates an experiment/feature.
      #
      # Example:
      #   Optimizely::Experiments.deactivate(:example_2) # => false
      #
      # @param [Symbol] name - The experiment/feature to enable.
      #
      def deactivate(name)
        add(name, false)
      end

      # Description:
      #   Determines if the experiment/feature is enabled.
      #
      # Example:
      #   Optimizely::Experiments.activated?(:example_1) # => true
      #   Optimizely::Experiments.activated?(:example_2) # => false
      #
      # @param [Symbol] name - The experiment/feature to enable.
      #
      def activated?(name)
        if valid_experiment?(name)
          if Features.default.features[name]
            return true
          else
            return false
          end
        else
          warn("Experiment not found: #{name.class} - #{name.inspect}")
        end
      end

      # Description:
      #   A ruby-block to efficiently run code only within this scope
      #  (as long as the experiment/feature is enabled).
      #
      # Example:
      #   Optimizely::Experiments.while_activated(:example_1) do
      #     # Code you wish you had here...
      #   end
      #
      # @param [Symbol] name - The experiment/feature to enable.
      #
      def while_activated(name)
        if activated?(name)
          yield if block_given?
        end
      end

      # Description:
      #   Checks whether the key exists.
      #
      # Example:
      #   Optimizely::Experiments.valid_experiment?(:example_1) # => true/false
      #
      # @param [Symbol] name - The experiment/feature to enable.
      #
      def valid_experiment?(name)
        Features.default.features.has_key?(name)
      end

    end
  end
end # => end Optimizely

