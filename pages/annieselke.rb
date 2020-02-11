require 'spec_helper'
require_relative '../helpers/special_methods'

class Annieselke
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  LOGIN_BTN_IL = "(//a[text()='Login'])[1]"
  LOGIN_BTN_TA = "annieselke:login_btn"
  LOGIN_BTN_EP = "EP:annieselke:login_btn"

  CREATE_ACC_IL = "//h3[text()='Create an Account']"
  CREATE_ACC_TA = "annieselke:create_acc"
  CREATE_ACC_EP = "EP:annieselke:create_acc"

  FIRST_NAME_IL = "//input[@name='firstName']"
  FIRST_NAME_TA = "annieselke:first_name"
  FIRST_NAME_EP = "EP:annieselke:first_name"

  LAST_NAME_IL = "//input[@name='lastName']"
  LAST_NAME_TA = "annieselke:last_name"
  LAST_NAME_EP = "EP:annieselke:last_name"

  EMAIL_IL = "//input[@name='email']"
  EMAIL_TA = "annieselke:email"
  EMAIL_EP = "EP:annieselke:email"

  PASS_IL = "//input[@id='password']"
  PASS_TA = "annieselke:pass"
  PASS_EP = "EP:annieselke:pass"

  CHECK_PWD_IL = "//input[@id='register.checkPwd']"
  CHECK_PWD_TA = "annieselke:check_pwd"
  CHECK_PWD_EP = "EP:annieselke:check_pwd"

  SUBSCRIBE_IL = "//label[@for='subscribe']"
  SUBSCRIBE_TA = "annieselke:subscribe"
  SUBSCRIBE_EP = "EP:annieselke:subscribe"

  REGISTER_IL = "(//button[@class='primary actionSet'])[2]"
  REGISTER_TA = "annieselke:register"
  REGISTER_EP = "EP:annieselke:register"

  def login_btn(key = nil)
    post_processing key do
      return find(:xpath, ta(LOGIN_BTN_EP)).click if key ==:ep
      return find(:xpath, LOGIN_BTN_IL).click if key ==:il
      find(:xpath, ta(LOGIN_BTN_TA, LOGIN_BTN_IL)).click
    end
  end

  def create_acc(key = nil)
    post_processing key do
      return find(:xpath, ta(CREATE_ACC_EP)).click if key ==:ep
      return find(:xpath, CREATE_ACC_IL).click if key ==:il
      find(:xpath, ta(CREATE_ACC_TA, CREATE_ACC_IL)).click
    end
  end

  def set_any_first_name(key = nil)
    post_processing key do
      return find(:xpath, ta(FIRST_NAME_EP)).set("name") if key ==:ep
      return find(:xpath, FIRST_NAME_IL).set("name") if key ==:il
      find(:xpath, ta(FIRST_NAME_TA, FIRST_NAME_IL)).set("name")
    end
  end

  def set_any_last_name(key = nil)
    post_processing key do
      return find(:xpath, ta(LAST_NAME_EP)).click if key ==:ep
      return find(:xpath, LAST_NAME_IL).click if key ==:il
      find(:xpath, ta(LAST_NAME_TA, LAST_NAME_IL)).set("last_name")
    end
  end

  def set_any_email(key = nil)
    post_processing key do
      return find(:xpath, ta(EMAIL_EP)).set("youre.example@gmail.com") if key ==:ep
      return find(:xpath, EMAIL_IL).set("youre.example@gmail.com") if key ==:il
      find(:xpath, ta(EMAIL_TA, EMAIL_IL)).set("youre.example@gmail.com")
    end
  end

  def set_any_pass(key = nil)
    post_processing key do
      return find(:xpath, ta(PASS_EP)).set("pass") if key ==:ep
      return find(:xpath, PASS_IL).set("pass") if key ==:il
      find(:xpath, ta(PASS_TA, PASS_IL)).set("pass")
    end
  end

  def check_any_pass(key = nil)
    post_processing key do
      return find(:xpath, ta(CHECK_PWD_EP)).set("pass") if key ==:ep
      return find(:xpath, CHECK_PWD_IL).set("pass") if key ==:il
      find(:xpath, ta(CHECK_PWD_TA, CHECK_PWD_IL)).set("pass")
    end
  end

  def click_subscribe(key = nil)
    post_processing key do
      return find(:xpath, ta(SUBSCRIBE_EP)).click if key ==:ep
      return find(:xpath, SUBSCRIBE_IL).click if key ==:il
      find(:xpath, ta(SUBSCRIBE_TA, SUBSCRIBE_IL)).click
    end
  end

  def click_register_btn(key = nil)
    post_processing key do
      return find(:xpath, ta(REGISTER_EP)).click if key ==:ep
      return find(:xpath, REGISTER_IL).click if key ==:il
      find(:xpath, ta(REGISTER_TA, REGISTER_IL)).click
    end
  end

  def close_modal
    if page.has_xpath?("//iframe[@title='Sign up for 15% Off!']")
      within_frame(1) do
        find(:xpath, "//button[@title='Close Dialog']").click
      end
    end

  end

end
