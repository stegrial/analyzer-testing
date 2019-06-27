require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'united_methods'

include PathCheck

module SandboxTests

  def initialize(*args)
    @second_heading_il = "//div[@id='div-01']//h4"
    @second_heading_ta = "sandbox:h4:test_1"
    super
  end

  def record_heading_4
    find(:xpath, ta(@second_heading_ta, @second_heading_il)).click
  end

  def check_heading_4
    check_element_path @second_heading_ta, @second_heading_il
  end

end