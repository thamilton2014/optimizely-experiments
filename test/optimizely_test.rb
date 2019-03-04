require "test_helper"

class OptimizelyTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::Optimizely::Experiments::VERSION
  end

end
