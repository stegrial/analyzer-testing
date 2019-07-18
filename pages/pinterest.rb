require 'spec_helper'

class Pinterest
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  EMAIL_IL = "//input[@name='id']"
  EMAIL_TA = "pinterest:email"
  EMAIL_EP = "EP:pinterest:email"

  PASSWORD_IL = "//input[@name='password']"
  PASSWORD_TA = "pinterest:pass"
  PASSWORD_EP = "EP:pinterest:pass"

  OK_BTN_IL = "//button[@class='red SignupButton active']"
  OK_BTN_TA = "pinterest:ok_btn"
  OK_BTN_EP = "EP:pinterest:ok_btn"

  SOME_PIN_IL = "(//a[@data-force-refresh])[4]"
  SOME_PIN_TA = "pinterest:some_pin"
  SOME_PIN_EP = "EP:pinterest:some_pin"

  def set_email(key = nil, email)
    return find(:xpath, ta(EMAIL_EP)).set(email) if key == :ep
    return find(:xpath, EMAIL_IL).set(email) if key == :il
    find(:xpath, ta(EMAIL_TA, EMAIL_IL)).set(email)
  end

  def set_password(key = nil, pass)
    return find(:xpath, ta(PASSWORD_EP)).set(pass) if key == :ep
    return find(:xpath, PASSWORD_IL).set(pass) if key == :il
    find(:xpath, ta(PASSWORD_TA, PASSWORD_IL)).set(pass)
  end

  def click_ok_btn(key = nil)
    return find(:xpath, ta(OK_BTN_EP)).click if key == :ep
    return find(:xpath, OK_BTN_IL).click if key == :il
    find(:xpath, ta(OK_BTN_TA, OK_BTN_IL)).click
  end

  def click_to_open_pin(key = nil)
    return find(:xpath, ta(SOME_PIN_EP)).click if key == :ep
    return find(:xpath, SOME_PIN_IL).click if key == :il
    find(:xpath, ta(SOME_PIN_TA, SOME_PIN_IL)).click
  end
end