require 'spec_helper'

class VenusHome
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  THIRD_BANNER_IL = "(//a[@title='Shop Now'])[3]"
  THIRD_BANNER_TA = 'venus:home_page:third_banner'
  THIRD_BANNER_EP = 'EP:venus:home_page:third_banner'


  def click_third_banner(key = nil)
    return find(:xpath, ta(THIRD_BANNER_EP)).click if key == :ep
    return find(:xpath, THIRD_BANNER_IL).click if key == :il
    find(:xpath, ta(THIRD_BANNER_TA, THIRD_BANNER_IL)).click
  end

end
