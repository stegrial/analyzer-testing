require 'spec_helper'
require_relative '../page_extension'

class Careers

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  CAREERS_HEADER_TA = "planetblue:careers:header"
  CAREERS_HEADER_IL = ".page-hero-page-careers"

  def find_careers_header(key = nil)
    locator_by key, CAREERS_HEADER_TA, CAREERS_HEADER_IL
  end

  def career_item(key, store, name)
    locator_by key, "//*[@class='careers-block']//h4[text()='#{store}']//following-sibling::ul//*[text()='#{name}']",
               "planetblue:careers:item"
  end

  def find_career_item(key = nil, store, name)
    find_element_path key, :xpath, career_item(:ta, store, name), career_item(:il, store, name)
  end

end