require 'spec_helper'
require_relative '../page_extension'

class DecorPillowsPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  DECOR_PILLOWS_H1_IL = "//div[@class='header']/h1"
  DECOR_PILLOWS_H1_TA = "annieselke:decor_pillows_page:decor_pillows_h1"


  def should_see_decor_pillows_h1(key = nil)
    post_processing key do
      return assert_selector(:xpath, DECOR_PILLOWS_H1_IL) if key == :il
      assert_selector(:xpath, ta(DECOR_PILLOWS_H1_TA, DECOR_PILLOWS_H1_IL))
    end
  end

end