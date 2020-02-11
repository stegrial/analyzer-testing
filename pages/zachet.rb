require 'spec_helper'
require_relative '../helpers/special_methods'

class Zachet
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  ZACHET_LOGO_IL = "//div[@class='logo top-menu']"
  ZACHET_LOGO_TA = "zachet:logotype"
  ZACHET_LOGO_EP = "EP:zachet:logotype"

  def click_logotype(key = nil)
    post_processing key do
      return find(:xpath, ta(ZACHET_LOGO_EP)).click if key == :ep
      return find(:xpath, ZACHET_LOGO_IL).click if key == :il
      find(:xpath, ta(ZACHET_LOGO_TA, ZACHET_LOGO_IL)).click
    end
  end

end

