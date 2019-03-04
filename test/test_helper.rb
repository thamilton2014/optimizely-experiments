$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "optimizely/experiments"

require "watir"
require "page-object"
require "minitest/autorun"

require_relative "functional/pages/google"