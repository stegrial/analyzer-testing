require 'spec_helper'
require_relative '../page_extension'

class OutletPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  OUTLET_IMG_IL = "//img[@title='Annie Selke Outlet']"
  OUTLET_IMG_TA = "annieselke:outlet_page:outlet_img"


  def should_see_outlet_img(key = nil)
    post_processing key do
      return assert_selector(:xpath, OUTLET_IMG_IL) if key == :il
      assert_selector(:xpath, ta(OUTLET_IMG_TA, OUTLET_IMG_IL))
    end
  end

end