require 'spec_helper'
require_relative '../page_extension'

class Login

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  EMAIL_FIELD_TA = "planetblue:login:email_field"
  EMAIL_FIELD_IL = "input[type='email']"

  def fill_email_field(key = nil, value)
    find_element_path(key, :css, EMAIL_FIELD_TA, EMAIL_FIELD_IL).fill_in with: value
  end

  PASSWORD_FIELD_TA = "planetblue:login:password_field"
  PASSWORD_FIELD_IL = "input[type='password']"

  def fill_password_field(key = nil, value)
    find_element_path(key, :css, PASSWORD_FIELD_TA, PASSWORD_FIELD_IL).fill_in with: value
  end

  SIGN_IN_BUTTON_TA = "planetblue:login:sign_in_button"
  SIGN_IN_BUTTON_IL = "button[type='submit']"

  def click_sign_in_button(key = nil)
    find_element_path(key, :css, SIGN_IN_BUTTON_TA, SIGN_IN_BUTTON_IL).click
  end

end