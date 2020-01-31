require 'spec_helper'
random_string = SecureRandom.hex
class TheTiebarLoginPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  USERNAME_IL = "//input[contains(@id, 'Username')]"
  USERNAME_TA = "thetiebar:login_page:Username"
  USERNAME_EP = "EP:thetiebar:login_page:Username"

  LOGIN_PASS_IL = "//input[contains(@id, 'LoginPassword')]"
  LOGIN_PASS_TA = "thetiebar:login_page:login_pass"
  LOGIN_PASS_EP = "EP:thetiebar:login_page:login_pass"

  SIGN_IN_IL = "//input[contains(@id, 'btnSignIn')]"
  SIGN_IN_TA = "thetiebar:login_page:signIn"
  SIGN_IN_EP = "EP:thetiebar:login_page:signIn"

  CREATE_ACCOUNT_TAB_IL = "//span[contains(text(), 'Create an Account')]"
  CREATE_ACCOUNT_TAB_TA = "thetiebar:login_page:create_acc_tab"
  CREATE_ACCOUNT_TAB_EP = "EP:thetiebar:login_page:create_acc_tab"

  FIRST_NAME_IL = "//input[contains(@id, 'FirstName')]"
  FIRST_NAME_TA = "thetiebar:login_page:first_name"
  FIRST_NAME_EP = "EP:thetiebar:login_page:first_name"

  LAST_NAME_IL = "//input[contains(@id, 'LastName')]"
  LAST_NAME_TA = "thetiebar:login_page:last_name"
  LAST_NAME_EP = "EP:thetiebar:login_page:last_name"

  EMAIL_IL = "//input[contains(@id, 'Email')]"
  EMAIL_TA = "thetiebar:login_page:email"
  EMAIL_EP = "EP:thetiebar:login_page:email"

  PASSWORD_IL = "//input[(@id='Password')]"
  PASSWORD_TA = "thetiebar:login_page:password"
  PASSWORD_EP = "EP:thetiebar:login_page:password"

  CONFIRM_PASSWORD_IL = "//input[contains(@id, 'ConfirmPassword')]"
  CONFIRM_PASSWORD_TA = "thetiebar:login_page:confirm_password"
  CONFIRM_PASSWORD_EP = "EP:thetiebar:login_page:confirm_password"

  OPTION_INPUT_IL = "//input[contains(@id, 'OptIn')]"
  OPTION_INPUT_TA = "thetiebar:login_page:option_checkbox"
  OPTION_INPUT_EP = "EP:thetiebar:login_page:option_checkbox"

  CREATE_ACCOUNT_BTN_IL = "//input[contains(@id, 'signupButton')]"
  CREATE_ACCOUNT_BTN_TA = "thetiebar:login_page:create_acc"
  CREATE_ACCOUNT_BTN_EP = "EP:thetiebar:login_page:create_acc"

  def fill_username_field(key = nil, value)
    return find(ta(USERNAME_EP)).set(value) if key == :ep
    return find(:xpath, USERNAME_IL).set(value) if key == :il
    find(:xpath, ta(USERNAME_TA, USERNAME_IL)).set(value)
  end

  def fill_login_password(key = nil, value)
    return find(ta(LOGIN_PASS_EP)).set(value) if key == :ep
    return find(:xpath, LOGIN_PASS_IL).set(value) if key == :il
    find(:xpath, ta(LOGIN_PASS_TA, LOGIN_PASS_IL)).set(value)
  end

  def click_sing_in(key = nil)
    return find(ta(SIGN_IN_EP)).click if key == :ep
    return find(:xpath, SIGN_IN_IL).click if key == :il
    find(:xpath, ta(SIGN_IN_TA, SIGN_IN_IL)).click
  end

  def click_create_acc_tab(key = nil)
    return find(ta(CREATE_ACCOUNT_TAB_EP)).click if key == :ep
    return find(:xpath, CREATE_ACCOUNT_TAB_IL).click if key == :il
    find(:xpath, ta(CREATE_ACCOUNT_TAB_TA, CREATE_ACCOUNT_TAB_IL)).click
  end

  def fill_first_name(key = nil, value)
    return find(ta(FIRST_NAME_EP)).set(value + SecureRandom.hex(3)) if key == :ep
    return find(:xpath, FIRST_NAME_IL).set(value + SecureRandom.hex(3)) if key == :il
    find(:xpath, ta(FIRST_NAME_TA, FIRST_NAME_IL)).set(value + SecureRandom.hex(3))
  end

  def fill_last_name(key = nil, value)
    return find(ta(LAST_NAME_EP)).set(value) if key == :ep
    return find(:xpath, LAST_NAME_IL).set(value) if key == :il
    find(:xpath, ta(LAST_NAME_TA, LAST_NAME_IL)).set(value)
  end

  def fill_email(key = nil, value)
    return find(ta(EMAIL_EP)).set(SecureRandom.hex(3) + value) if key == :ep
    return find(:xpath, EMAIL_IL).set(SecureRandom.hex(3) + value) if key == :il
    find(:xpath, ta(EMAIL_TA, EMAIL_IL)).set(SecureRandom.hex(3) + value)
  end

  def fill_password(key = nil, value)
    return find(ta(PASSWORD_EP)).set(value) if key == :ep
    return find(:xpath, PASSWORD_IL).set(value) if key == :il
    find(:xpath, ta(PASSWORD_TA, PASSWORD_IL)).set(value)
  end

  def fill_confirm_password(key = nil, value)
    return find(ta(CONFIRM_PASSWORD_EP)).set(value) if key == :ep
    return find(:xpath, CONFIRM_PASSWORD_IL).set(value) if key == :il
    find(:xpath, ta(CONFIRM_PASSWORD_TA, CONFIRM_PASSWORD_IL)).set(value)
  end

  def click_uncheck_checkbox(key = nil)
    return find(ta(OPTION_INPUT_EP)).click if key == :ep
    return find(:xpath, OPTION_INPUT_IL).click if key == :il
    find(:xpath, ta(OPTION_INPUT_TA, OPTION_INPUT_IL)).click
  end

  def click_create_acc_btn(key = nil)
    return find(ta(CREATE_ACCOUNT_BTN_EP)).click if key == :ep
    return find(:xpath, CREATE_ACCOUNT_BTN_IL).click if key == :il
    find(:xpath, ta(CREATE_ACCOUNT_BTN_TA, CREATE_ACCOUNT_BTN_IL)).click
  end

end