require 'spec_helper'
require_relative '../page_extension'

class FurniturePage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  FURNITURE_H1_IL = "//div[@class='header']/h1"
  FURNITURE_H1_TA = "annieselke:furniture_page:furniture_h1"


  def should_see_furniture_h1(key = nil)
    post_processing key do
      return assert_selector(:xpath, FURNITURE_H1_IL) if key == :il
      assert_selector(:xpath, ta(FURNITURE_H1_TA, FURNITURE_H1_IL))
    end
  end

end