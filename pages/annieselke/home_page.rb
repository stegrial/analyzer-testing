require 'spec_helper'
require_relative '../page_extension'

class HomePage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  ANNIE_SELKE_IMG_IL = "//img[@title='Annie Selke']"
  ANNIE_SELKE_IMG_TA = "annieselke:home_page:annie_selke_img"


  def should_see_annie_selke_img(key = nil)
    post_processing key do
      return assert_selector(:xpath, ANNIE_SELKE_IMG_IL) if key == :il
      assert_selector(:xpath, ta(ANNIE_SELKE_IMG_TA, ANNIE_SELKE_IMG_IL))
    end
  end

end
