require 'spec_helper'
require_relative '../page_extension'

class Login_Page
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  EMAIL_FIELD_IL = "//input[@class='text']"
  EMAIL_FIELD_TA = "annieselke:login_page:email_input"
  
  PASS_FIELD_IL = "//input[@class='text password']"
  PASS_FIELD_TA = "annieselke:login_page:pass_input"

  LOGIN_BTN_IL = "//button[@class='primary actionSet']"
  LOGIN_BTN_TA = "annieselke:login_page:pass_input"

  FORGOTTEN_PASS_LINK_IL = "//a[@class='password-forgotten']"
  FORGOTTEN_PASS_LINK_TA ="annieselke:login_page:forgotten_pass_link"

  CREATE_NEW_ACCOUNT_ARROW_IL = "//span[text()='Create an Account']"
  CREATE_NEW_ACCOUNT_ARROW_TA = "annieselke:login_page:create_new_account_arrow"

  def fill_email_input(key = nil, value)
    find_element_path(key, :xpath, EMAIL_FIELD_TA, EMAIL_FIELD_IL).set(value)
  end

  def fill_pass_input(key = nil, value)
    find_element_path(key, :xpath, PASS_FIELD_TA, PASS_FIELD_IL).set(value)
  end

  def click_login_btn(key = nil)
    find_element_path(key, :xpath, LOGIN_BTN_TA, LOGIN_BTN_IL).click
  end

  def click_forgot_pass_link(key=nil)
    find_element_path(key, :xpath, FORGOTTEN_PASS_LINK_TA, FORGOTTEN_PASS_LINK_IL).click
  end

  def click_create_new_account_arrow
    find_element_path(key, :xpath, FORGOTTEN_PASS_LINK_TA, FORGOTTEN_PASS_LINK_IL).click
  end
end
