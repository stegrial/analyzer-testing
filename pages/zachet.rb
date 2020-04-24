require 'spec_helper'
require_relative 'page_extension'

class Zachet
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  ZACHET_LOGO_IL = "//div[@class='logo']"
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

