require "watir"
require "page-object/page_factory"

class Home
  include PageObject
  # include TestObject
  # include Optimizely::Experiments::Collection


  # Description:
  #   The initial page url to possibly navigate to.
  #
  # @param [String] url - The initial url.
  page_url "https://www.google.com"

  # Description:
  #   The text field element to write to.
  #
  # @param [Hash] locators
  #   @opts key   - The selector to use, id, class, link, name, etc...
  #   @opts value - The value of the locator to use.
  text_field :search, name: "q"

  # Description:
  #   The button element to press
  #
  # @param [Hash] locators
  #   @opts key   - The selector to use, id, class, link, name, etc...
  #   @opts value - The value of the locator to use.
  button :submit, name: "btnK"

  # Description:
  #   Assign the experiment a new locator based on whether it is enabled/disabled.
  #
  # @param [Symbol] :example_1          - The experiment name.
  # @param [Symbol] :search             - The `already` defined element we want to override.
  # @param [Symbol] :text_field         - The element tag to use as a baseline.
  # @param [Hash] aria_label: "Search"  - the locator strategy to use to find the element.
  experiment :example_1, :search, :text_field, aria_label: "Search"

  # Description:
  #   A method that combines the input text and submit button into one fluid action.
  #
  # @param [String] value - The search string value to enter into the text field element.
  #
  def search_for(value)
    search_element.send_keys(value)
    submit_element.click
  end


  def example_1
    # puts methods.sort

  end
end

@browser = Watir::Browser.new(:chrome)
on(Home).example_1
# page = Home.new(@browser)
# page.example_1