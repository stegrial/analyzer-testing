require 'spec_helper'
require_relative '../page_extension'

class LoginPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  CLOSE_BANNER_BTN = "//button[@title='Close Dialog']"

  EMAIL_FIELD_IL = "//input[@class='text']"
  EMAIL_FIELD_TA = "annieselke:login_page:email_input"
  
  PASS_FIELD_IL = "//input[@class='text password']"
  PASS_FIELD_TA = "annieselke:login_page:pass_input"

  FIRST_NAME_IL = "//input[@id='register.firstName']"
  FIRST_NAME_TA = "annieselke:login_page:first_name"

  LAST_NAME_IL = "//input[@id='register.lastName']"
  LAST_NAME_TA = "annieselke:login_page:last_name"

  EMAIL_IL = "//input[@id='register.email']"
  EMAIL_TA = "annieselke:login_page:email_register"

  PASS_IL = "//input[@id='password']"
  PASS_TA = "annieselke:login_page:pass_register"

  CONFIRM_PASS_IL = "//input[@id='register.checkPwd']"
  CONFIRM_PASS_TA = "annieselke:login_page:confirm_pass"

  LOGIN_BTN_IL = "//button[@class='primary actionSet']"
  LOGIN_BTN_TA = "annieselke:login_page:pass_input"

  FORGOTTEN_PASS_LINK_IL = "//a[@class='password-forgotten']"
  FORGOTTEN_PASS_LINK_TA ="annieselke:login_page:forgotten_pass_link"

  CREATE_NEW_ACCOUNT_ARROW_IL = "//h3[text()='Create an Account']"
  CREATE_NEW_ACCOUNT_ARROW_TA = "annieselke:login_page:create_new_account_arrow"

  DROPDOWN_ARROW_IL = "//select[@name='titleCode']"
  DROPDOWN_ARROW_TA = "annieselke:login_page:dropdown_arrow"

  REGISTER_BTN_IL = "//button[text()='Register']"
  REGISTER_BTN_TA = "annieselke:login_page:register_btn"

  def search_item(key, name)
    locator_by key,
               "//select[@name='titleCode']/option[@value='#{name}']",
               "annieselke:login_page:#{ta_name(name)}"
  end

  def close_banner
    within_frame(1) do
      find(:xpath, CLOSE_BANNER_BTN).click
    end
  rescue
    puts 'Banner doesnt exist'
  end

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

  def click_create_new_account_arrow (key=nil)
    find_element_path(key, :xpath, CREATE_NEW_ACCOUNT_ARROW_TA, CREATE_NEW_ACCOUNT_ARROW_IL).click
  end

  def click_dropdown_arrow (key=nil)
    find_element_path(key, :xpath, DROPDOWN_ARROW_TA, DROPDOWN_ARROW_IL).click
  end

  def select_dropdown(key=nil, name)
    find_element_path(key, :xpath, search_item(:ta, name), search_item(:il, name)).click
  end

  def fill_first_name(key = nil, value)
    find_element_path(key, :xpath, FIRST_NAME_TA, FIRST_NAME_IL).set(value)
  end

  def fill_last_name(key = nil, value)
    find_element_path(key, :xpath, LAST_NAME_TA, LAST_NAME_IL).set(value)
  end

  def fill_email_name(key = nil, value)
    find_element_path(key, :xpath, EMAIL_TA, EMAIL_IL).set(value)
  end

  def fill_pass(key = nil, value)
    find_element_path(key, :xpath, PASS_TA, PASS_IL).set(value)
  end

  def confirm_pass(key = nil, value)
    find_element_path(key, :xpath, CONFIRM_PASS_TA, CONFIRM_PASS_IL).set(value)
  end

  def click_register_button(key=nil)
    find_element_path(key, :xpath, REGISTER_BTN_TA, REGISTER_BTN_IL).click
  end

end
