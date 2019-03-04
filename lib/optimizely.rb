require "optimizely/experiments/version"

module Optimizely
  class << self

    # Description:
    #   Configures any experiments that are within the scope of the page object.
    #
    # Example:
    #   Optimizely.configure do |experiments|
    #     experiments[:example_name_1] = true
    #     experiments[:example_name_2] = false
    #   end
    #
    def configure
      # TBD
    end

    # Description:
    #   Adds the ability to get all "experiments" back as a Ruby hash.
    #
    # Example:
    #   Optimizely.all
    #
    def all
      Experiments.all
    end

    # Description:
    #   Adds experiments prior to page object initialization.
    #
    # Example:
    #   Optimizely.add(:example_1, true)
    #   Optimizely.add(:example_2, false)
    #
    # @param [Symbol] name - The experiment/feature name to enable/disable.
    # @param [Boolean] value - Enables or disables the experiment/feature based on boolean value.
    #
    def add(name, value)
      Experiments.add(name, value)
    end

    # Description:
    #   Adds experiments by loading up YAML or JSON files.
    #
    # Example:
    #   Optimizely.load_file("example.json")
    #   Optimizely.load_file("example.yaml")
    #
    # @param [String] file_path - The path to the file including the file name and extension.
    #
    def load_file(file_path)
      Experiments.load_file(file_path)
    end

    # Description:
    #   Adds experiments by loading up a YAML file.
    #
    # Example:
    #   yaml = File.open("example.yaml") # or
    #   yml  = File.open("example.yml")
    #
    #   Optimizely.load_yaml(yaml)
    #
    # @param [File] file
    #
    def load_yaml(file)
      Experiments.load_yaml(file)
    end

    # Description:
    #   Adds experiments by loading up a JSON file.
    #
    # Example:
    #   json = File.open("example.json")
    #
    #   Optimizely.load_json("json")
    #
    # @param [File] file
    #
    def load_json(file)
      Experiments.load_json(file)
    end

    # Description:
    #   A helper method that enables/updates an experiment/feature to `true`.
    #
    # Example:
    #   Optimizely.activate(:example_1) # => true
    #
    # @param [Symbol] name - The experiment/feature to enable.
    #
    def activate(name)
      Experiments.activate(name)
    end

    # Description:
    #   Determines if the experiment/feature is enabled.
    #
    # Example:
    #   Optimizely.activated?(:example_1) # => true
    #   Optimizely.activated?(:example_2) # => false
    #
    # @param [Symbol] name - The experiment/feature to enable.
    #
    def activated?(name)
      Experiments.activated?(name)
    end

    # Description:
    #   A ruby-block to efficiently run code only within this scope
    #  (as long as the experiment/feature is enabled).
    #
    # Example:
    #   Optimizely.while_activated(:example_1) do
    #     # Code you wish you had here...
    #   end
    #
    # @param [Symbol] name - The experiment/feature to enable.
    #
    def while_activated(name)
      # TBD
    end

  end # end self
end # => end Optimizely
