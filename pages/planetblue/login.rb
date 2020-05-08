require 'spec_helper'
require_relative '../page_extension'

class Login

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  EMAIL_FIELD_TA = "planetblue:login:email_field"
  EMAIL_FIELD_IL = "#customer_login input[type='email']"

  PASSWORD_FIELD_TA = "planetblue:login:password_field"
  PASSWORD_FIELD_IL = "#customer_login input[type='password']"

  SIGN_IN_BUTTON_TA = "planetblue:login:sign_in_button"
  SIGN_IN_BUTTON_IL = "#customer_login [type='submit']"

  def fill_email_field(key = nil, value)
    find_element_path(key, :css, EMAIL_FIELD_TA, EMAIL_FIELD_IL).fill_in with: value
  end

  def fill_password_field(key = nil, value)
    find_element_path(key, :css, PASSWORD_FIELD_TA, PASSWORD_FIELD_IL).fill_in with: value
  end

  def click_sign_in_button(key = nil)
    find_element_path(key, :css, SIGN_IN_BUTTON_TA, SIGN_IN_BUTTON_IL).click
  end

end