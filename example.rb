require "optimizely/experiments"

Optimizely::Experiments.configure do |experiments|
  experiments[:example_1] = true
end

puts Optimizely.methods.sort
#
# Optimizely::Experiments.load_file("test/fixtures/example.json")
#
# puts Optimizely::Experiments.all
#
# puts Optimizely::Experiments.activated?(:example_1)
#
# Optimizely::Experiments.load_file("test/fixtures/example.yaml")
#
# puts Optimizely::Experiments.activated?(:example_1)
#
# Optimizely::Experiments.activate(:example_1)
#
# Optimizely::Experiments.while_activated(:example_1) do
#   puts "Active"
# end
