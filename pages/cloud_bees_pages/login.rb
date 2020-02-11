require 'spec_helper'
require_relative '../../helpers/special_methods'

class CloudBeesLogin
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  USERNAME_FIELD_IL = '.at-login-username'
  USERNAME_FIELD_TA = 'cloud_bees:login_page:username'
  USERNAME_FIELD_EP = 'EP:cloud_bees:login_page:username'

  PASSWORD_FIELD_IL = '.at-login-password'
  PASSWORD_FIELD_TA = 'cloud_bees:login_page:password'
  PASSWORD_FIELD_EP = 'EP:cloud_bees:login_page:password'

  SIGN_IN_BTN_IL = '.at-login-button'
  SIGN_IN_BTN_TA = 'cloud_bees:login_page:sign_in_btn'
  SIGN_IN_BTN_EP = 'EP:cloud_bees:login_page:sign_in_btn'

  def fill_username_field(key = nil, username)
    post_processing key do
      return find(ta(USERNAME_FIELD_EP)).set(username) if key == :ep
      return find(:css, USERNAME_FIELD_IL).set(username) if key == :il
      find(:css, ta(USERNAME_FIELD_TA, USERNAME_FIELD_IL)).set(username)
    end
  end

  def fill_pass_field(key = nil, pass)
    post_processing key do
      return find(ta(PASSWORD_FIELD_EP)).set(pass) if key == :ep
      return find(:css, PASSWORD_FIELD_IL).set(pass) if key == :il
      find(:css, ta(PASSWORD_FIELD_TA, PASSWORD_FIELD_IL)).set(pass)
    end
  end

  def click_sign_in_button(key = nil)
    post_processing key do
      return find(ta(SIGN_IN_BTN_EP)).click if key == :ep
      return find(:css, SIGN_IN_BTN_IL).click if key == :il
      find(:css, ta(SIGN_IN_BTN_TA, SIGN_IN_BTN_IL)).click
    end
  end


end