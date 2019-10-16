require 'spec_helper'

class VenusLogin
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  EMAIL_FIELD_IL = 'ctl00_Body1_loginemail'
  EMAIL_FIELD_TA = 'venus:login_page:email_field'
  EMAIL_FIELD_EP = 'EP:venus:login_page:email_field'

  PASS_FIELD_IL = 'ctl00_Body1_loginpassword'
  PASS_FIELD_TA = 'venus:login_page:pass_field'
  PASS_FIELD_EP = 'EP:venus:login_page:pass_field'

  SIGN_IN_BTN_IL = 'ctl00_Body1_loginbutton'
  SIGN_IN_BTN_TA = 'venus:login_page:sign_in_btn'
  SIGN_IN_BTN_EP = 'EP:venus:login_page:sign_in_btn'

  CREATE_ACCOUNT_BTN_IL = "//a[text()='Create Account']"
  CREATE_ACCOUNT_BTN_TA = 'venus:login_page:create_account_btn'
  CREATE_ACCOUNT_BTN_EP = 'EP:venus:login_page:create_account_btn'


  def fill_email_field(key = nil, email)
    return find(:id, ta(EMAIL_FIELD_EP)).set(email) if key == :ep
    return find(:id, EMAIL_FIELD_IL).set(email) if key == :il
    find(:id, ta(EMAIL_FIELD_TA, EMAIL_FIELD_IL)).set(email)
  end

  def fill_pass_field(key = nil, pass)
    return find(:id, ta(PASS_FIELD_EP)).set(pass) if key == :ep
    return find(:id, PASS_FIELD_IL).set(pass) if key == :il
    find(:id, ta(PASS_FIELD_TA, PASS_FIELD_IL)).set(pass)
  end

  def click_sign_in_button(key = nil)
    return find(:id, ta(SIGN_IN_BTN_EP)).click if key == :ep
    return find(:id, SIGN_IN_BTN_IL).click if key == :il
    find(:id, ta(SIGN_IN_BTN_TA, SIGN_IN_BTN_IL)).click
  end

  def click_create_account_btn(key = nil)
    return find(ta(CREATE_ACCOUNT_BTN_EP)).click if key == :ep
    return find(:xpath, CREATE_ACCOUNT_BTN_IL).click if key == :il
    find(:xpath, ta(CREATE_ACCOUNT_BTN_TA, CREATE_ACCOUNT_BTN_IL)).click
  end

end
