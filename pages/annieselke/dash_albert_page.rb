require 'spec_helper'
require_relative '../page_extension'

class DashAlbertPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  DASH_AN_ALBERT_IMG_IL = "//img[@title='Dash & Albert']"
  DASH_AN_ALBERT_IMG_TA = "annieselke:dash_albert_page:dash_an_albert_img"


  def should_see_dash_an_albert_img(key = nil)
    post_processing key do
      return assert_selector(:xpath, DASH_AN_ALBERT_IMG_IL) if key == :il
      assert_selector(:xpath, ta(DASH_AN_ALBERT_IMG_TA, DASH_AN_ALBERT_IMG_IL))
    end
  end

end