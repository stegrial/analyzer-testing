require 'spec_helper'
require_relative '../page_extension'

class TAWebsite
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  HOME_LOGIN_BTN_IL = "//div[./span[text()='Login']]"
  HOME_LOGIN_BTN_TA = 'ta:website:home:login_btn'
  HOME_LOGIN_BTN_EP = 'EP:ta:website:home:login_btn'

  def click_login_btn_on_home(key = nil)
    post_processing key do
      return find(ta(HOME_LOGIN_BTN_EP)).click if key == :ep
      return find(:xpath, HOME_LOGIN_BTN_IL).click if key == :il
      find(:xpath, ta(HOME_LOGIN_BTN_TA, HOME_LOGIN_BTN_IL)).click
    end
  end

end