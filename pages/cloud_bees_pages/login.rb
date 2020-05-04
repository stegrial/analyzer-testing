require 'spec_helper'
require_relative '../page_extension'

class CloudBeesLogin
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  USERNAME_FIELD_IL = '.at-login-username'
  USERNAME_FIELD_TA = 'cloud_bees:login_page:username'

  PASSWORD_FIELD_IL = '.at-login-password'
  PASSWORD_FIELD_TA = 'cloud_bees:login_page:password'

  SIGN_IN_BTN_IL = '.at-login-button'
  SIGN_IN_BTN_TA = 'cloud_bees:login_page:sign_in_btn'

  def fill_username_field(key = nil, username)
    find_element(key, il_type: :css, tl: USERNAME_FIELD_TA, il: USERNAME_FIELD_IL ).set(username)
  end

  def fill_pass_field(key = nil, pass)
    find_element(key, il_type: :css, tl: PASSWORD_FIELD_TA, il: PASSWORD_FIELD_IL).set(pass)
  end

  def click_sign_in_button(key = nil)
    find_element(key, il_type: :css, tl: SIGN_IN_BTN_TA, il: SIGN_IN_BTN_IL).click
  end


end