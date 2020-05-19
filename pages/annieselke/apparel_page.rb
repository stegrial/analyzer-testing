require 'spec_helper'
require_relative '../page_extension'

class ApparelPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  APPAREL_H1_IL = "//div[@class='header']/h1"
  APPAREL_H1_TA = "annieselke:apparel_page:apparel_h1"


  def should_see_apparel_h1(key = nil)
    post_processing key do
      return assert_selector(:xpath, APPAREL_H1_IL) if key == :il
      assert_selector(:xpath, ta(APPAREL_H1_TA, APPAREL_H1_IL))
    end
  end

end