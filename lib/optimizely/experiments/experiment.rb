module Optimizely
  module Experiments
    class Experiment

      def experiment(name, element_name, tag, locator = {})
        if Optimizely.enabled?(name)
          self.send(tag, element_name, locator)
        end
      end

    end
  end
end