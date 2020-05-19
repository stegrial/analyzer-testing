require 'spec_helper'
require_relative '../page_extension'

class BathPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  BATH_H1_IL = "//div[@class='header']/h1"
  BATH_H1_TA = "annieselke:bath_page:bath_h1"


  def should_see_bath_h1(key = nil)
    post_processing key do
      return assert_selector(:xpath, BATH_H1_IL) if key == :il
      assert_selector(:xpath, ta(BATH_H1_TA, BATH_H1_IL))
    end
  end

end