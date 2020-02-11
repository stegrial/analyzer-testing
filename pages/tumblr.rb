require 'spec_helper'
require_relative '../helpers/special_methods'

class Tumblr
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  SIGN_UP_BTN_IL = "(//button/span[@class='signup_get_started_btn active'])[1]"
  SIGN_UP_BTN_TA = "tumblr:signup_btn"
  SIGN_UP_BTN_EP = "EP:tumblr:signup_btn"

  SIGN_UP_EMAIL_IL = "//input[@id='signup_email']"
  SIGN_UP_EMAIL_TA = "tumblr:signup_email"
  SIGN_UP_EMAIL_EP = "EP:tumblr:signup_email"

  SIGN_UP_PASSWORD_IL = "//input[@id='signup_password']"
  SIGN_UP_PASSWORD_TA = "tumblr:signup_password"
  SIGN_UP_PASSWORD_EP = "EP:tumblr:signup_password"

  SIGN_UP_LINK_IL = "//a[@class='signup_link login-button']"
  SIGN_UP_LINK_TA = "tumblr:signup_link"
  SIGN_UP_LINK_EP = "EP:tumblr:signup_link"

  REGISTR_EMAIL_IL = "//input[@id='signup_determine_email']"
  REGISTR_EMAIL_TA = "tumblr:signup_determine_email"
  REGISTR_EMAIL_EP = "EP:tumblr:signup_determine_email"

  NEXT_BTN_IL = "//span[@class='signup_determine_btn active']"
  NEXT_BTN_TA = "tumblr:signup_next_btn"
  NEXT_BTN_EP = "EP:tumblr:signup_next_btn"

  FORGOT_PASSWORD_LINK_IL = "(//a[@class='forgot_password_link'])[1]"
  FORGOT_PASSWORD_LINK_TA = "tumblr:forgot_password_link"
  FORGOT_PASSWORD_LINK_EP = "EP:tumblr:forgot_password_link"

  SIGN_UP_LOGIN_IL = "//span[@class='signup_login_btn active']"
  SIGN_UP_LOGIN_TA = "tumblr:signup_login_btn"
  SIGN_UP_LOGIN_EP = "EP:tumblr:signup_login_btn"

  ADD_POST_BTN_IL = "(//span[@class='icon_plus follow_icon'])[2]"
  ADD_POST_BTN_TA = "tumblr:dashboard:add_post_btn"
  ADD_POST_BTN_EP = "EP:tumblr:dashboard:add_post_btn"

  def click_sign_up_btn(key = nil)
    post_processing key do
      return find(:xpath, ta(SIGN_UP_BTN_EP)).click if key ==:ep
      return find(:xpath, SIGN_UP_BTN_IL).click if key ==:il
      find(:xpath, ta(SIGN_UP_BTN_TA, SIGN_UP_BTN_IL)).click
    end
  end

  def set_email(key = nil, email)
    post_processing key do
      return find(:xpath, ta(SIGN_UP_EMAIL_EP)).set(email) if key ==:ep
      return find(:xpath, SIGN_UP_EMAIL_IL).set(email) if key ==:il
      find(:xpath, ta(SIGN_UP_EMAIL_TA, SIGN_UP_EMAIL_IL)).set(email)
    end
  end

  def set_password(key = nil, password)
    post_processing key do
      return find(:xpath, ta(SIGN_UP_PASSWORD_EP)).set(password) if key ==:ep
      return find(:xpath, SIGN_UP_PASSWORD_IL).set(password) if key ==:il
      find(:xpath, ta(SIGN_UP_PASSWORD_TA, SIGN_UP_PASSWORD_IL)).set(password)
    end
  end

  def click_sign_up_link(key = nil)
    post_processing key do
      return find(:xpath, ta(SIGN_UP_LINK_EP)).click if key ==:ep
      return find(:xpath, SIGN_UP_LINK_IL).click if key ==:il
      find(:xpath, ta(SIGN_UP_LINK_TA, SIGN_UP_LINK_IL)).click
    end
  end

  def click_sign_up_determine_mail(key = nil, mail)
    post_processing key do
      return find(:xpath, ta(REGISTR_EMAIL_EP)).set(mail) if key ==:ep
      return find(:xpath, REGISTR_EMAIL_IL).set(mail) if key ==:il
      find(:xpath, ta(REGISTR_EMAIL_TA, REGISTR_EMAIL_IL)).set(mail)
    end
  end

  def click_sign_up_determine_btn(key = nil)
    post_processing key do
      return find(:xpath, ta(NEXT_BTN_EP)).click if key ==:ep
      return find(:xpath, NEXT_BTN_IL).click if key ==:il
      find(:xpath, ta(NEXT_BTN_TA, NEXT_BTN_IL)).click
    end
  end

  def click_forgot_password(key = nil)
    post_processing key do
      return find(:xpath, ta(FORGOT_PASSWORD_LINK_EP)).click if key ==:ep
      return find(:xpath, FORGOT_PASSWORD_LINK_IL).click if key ==:il
      find(:xpath, ta(FORGOT_PASSWORD_LINK_TA, FORGOT_PASSWORD_LINK_IL)).click
    end
  end

  def click_signup_for_login(key = nil)
    post_processing key do
      return find(:xpath, ta(SIGN_UP_LOGIN_EP)).click if key ==:ep
      return find(:xpath, SIGN_UP_LOGIN_IL).click if key ==:il
      find(:xpath, ta(SIGN_UP_LOGIN_TA, SIGN_UP_LOGIN_IL)).click
    end
  end

  def click_add_post(key = nil)
    post_processing key do
      return find(:xpath, ta(ADD_POST_BTN_EP)).click if key ==:ep
      return find(:xpath, ADD_POST_BTN_IL).click if key ==:il
      find(:xpath, ta(ADD_POST_BTN_TA, ADD_POST_BTN_IL)).click
    end
  end

end
