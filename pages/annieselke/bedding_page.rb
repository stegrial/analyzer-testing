require 'spec_helper'
require_relative '../page_extension'

class BeddingPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  BEDDING_H1_IL = "//div[@class='header']/h1"
  BEDDING_H1_TA = "annieselke:bedding_page:bedding_h1"


  def should_see_bedding_h1(key = nil)
    post_processing key do
      return assert_selector(:xpath, BEDDING_H1_IL) if key == :il
      assert_selector(:xpath, ta(BEDDING_H1_TA, BEDDING_H1_IL))
    end
  end

end