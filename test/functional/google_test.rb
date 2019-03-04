require "test_helper"

class GoogleTest < Minitest::Test
  # include PageObject::PageFactory


  def test_that_experiments_are_not_configured
    @browser = Watir::Browser.new(:chrome)
    @browser.goto("https://www.google.com")

    attribute, value = on(Google).search_element.selector.first

    assert_equal(:name, attribute)
    assert_equal("q", value)

    @browser.quit
  end

  def test_that_experiments_are_configured
    Optimizely::Experiments.activate(:example_1)

    @browser = Watir::Browser.new(:chrome)
    @browser.goto("https://www.google.com")

    attribute, value = PageObject::PageFactory.on(Google).search_element.selector.first
    # attribute, value = on(Google).search_element.selector.first
    assert_equal(:aria_label, attribute)
    assert_equal("Search", value)

    @browser.quit
  end

end