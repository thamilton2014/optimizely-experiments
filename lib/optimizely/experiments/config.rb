module Optimizely
  module Experiments
    class Config

      @features = {}

      class << self
        attr_accessor :features

        def configure
          yield(features) if block_given?
        end

      end # => self
    end # => end Config
  end # => end Experiments
end # => end Optimizely