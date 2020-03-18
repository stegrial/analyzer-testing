require 'spec_helper'
require_relative '../page_extension'

class Forgotten_Pass_Page
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  SEND_EMAIL_BTN_IL = "//button[@class='primary password-request-submit-button']"
  SEND_EMAIL_BTN_TA = "annieselke:forgotten_pass_page:send_email_btn"

  RETURN_LOGIN_BTN_IL = "//a[@class='primary button']"
  RETURN_LOGIN_BTN_TA = "annieselke:forgotten_pass_page:return_login_btn"

  def click_send_email_btn(key=nil)
    find_element_path(key, :xpath, SEND_EMAIL_BTN_TA, SEND_EMAIL_BTN_IL).click
  end

  def click_return_login_btn(key=nil)
    find_element_path(key, :xpath, RETURN_LOGIN_BTN_TA, RETURN_LOGIN_BTN_IL).click
  end
end
