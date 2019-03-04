module Optimizely
  module Experiments

    # Description:
    #   Configures any experiments that are within the scope of the page object.
    #
    # Example:
    #   Optimizely::Experiments.configure do |experiments|
    #     experiments[:example_name_1] = true
    #     experiments[:example_name_2] = false
    #   end
    #
    def self.configure
      if block_given?
        yield(Optimizely::Experiments::Config.features)
      else
        Optimizely::Experiments::Config.features
      end
    end

    class << self

      # Description:
      #   Adds the ability to get all "experiments" back as a Ruby hash.
      #
      # Example:
      #   Optimizely::Experiments.all
      #
      def all
        Optimizely::Experiments::Config.features
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
        Optimizely::Experiments::Config.features[name] = value
      end

      # Description:
      #   Adds experiments by loading up YAML or JSON files.
      #
      # Example:
      #   Optimizely::Experiments.load_file("example.json")
      #   Optimizely::Experiments.load_file("example.yaml")
      #
      # @param [String] file_path - The path to the file including the file name and extension.
      #
      def load_file(file_path)
        file = File.open(file_path)
        ext  = File.extname(file_path)
        case ext
        when ".yaml", ".yml"
          load_yaml(file)
        when ".json"
          load_json(file)
        else
          raise Exception, "[Error] File type not found for: #{file_path}"
        end
      end

      # Description:
      #   Adds experiments by loading up a YAML file.
      #
      # Example:
      #   yaml = File.open("example.yaml") # or
      #   yml  = File.open("example.yml")
      #
      #   Optimizely::Experiments.load_yaml(yaml)
      #
      # @param [File] file
      #
      def load_yaml(file)
        yaml = YAML.load(file)
        load_experiments(yaml)
      end

      # Description:
      #   Adds experiments by loading up a JSON file.
      #
      # Example:
      #   json = File.open("example.json")
      #
      #   Optimizely::Experiments.load_json("json")
      #
      # @param [File] file
      #
      def load_json(file)
        json = JSON.load(file)
        load_experiments(json)
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
        feature = Optimizely::Experiments::Config.features[name]
        (feature && feature == true) ? true : false
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

      private

      # Description:
      #   This loads the json or yaml data structure and iterates over their keys
      #   assigning them the appropriate boolean values.
      #
      # Note:
      #   private API
      #
      def load_experiments(struct)
        struct.each do |key, value|
          add(key.to_sym, value)
        end
      end
    end
  end
end # => end Optimizely

