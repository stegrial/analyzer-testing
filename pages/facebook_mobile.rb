require 'spec_helper'

class FacebookMobile


  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  EMAIL_IL = "//input[@name='email']"
  EMAIL_TA = "facebook_mobile:email"
  EMAIL_EP = "EP:facebook_mobile:email"

  PASS_IL = "//input[@name='pass']"
  PASS_TA = "facebook_mobile:pass"
  PASS_EP = "EP:facebook_mobile:pass"

  LOGIN_BTN_IL = "//button[@data-sigil='touchable m_login_button']"
  LOGIN_BTN_TA = "facebook_mobile:login_btn"
  LOGIN_BTN_EP = "EP:facebook_mobile:login_btn"

  OK_BTN_IL = "//button[@value='OK']"
  OK_BTN_TA = "facebook_mobile:ok_btn"
  OK_BTN_EP = "EP:facebook_mobile:ok_btn"

  NEW_POST_IL = "//div[@role='textbox']"
  NEW_POST_TA = "facebook_mobile:newpost"
  NEW_POST_EP = "EP:facebook_mobile:newpost"

  SET_TEXT_IL = "//textarea[@class='composerInput mentions-input']"
  SET_TEXT_TA = "facebook_mobile:set_text"
  SET_TEXT_EP = "EP:facebook_mobile:set_text"

  POST_BTN_IL = "//button[@value='Post']"
  POST_BTN_TA = "facebook_mobile:post_btn"
  POST_BTN_EP = "EP:facebook_mobile:post_btn"

  MULTI_MENU_BTN_IL = "(//a[@data-sigil='touchable'])[1]"
  MULTI_MENU_BTN_TA = "facebook_mobile:multi_menu_btn"
  MULTI_MENU_BTN_EP = "EP:facebook_mobile:multi_menu_btn"

  DELETE_POST_IL = "//a[@data-sigil='touchable touchable removeStoryButton enabled_action']"
  DELETE_POST_TA = "facebook_mobile:delete_post"
  DELETE_POST_EP = "EP:facebook_mobile:delete_post"

  CONFIRM_DELETE_IL = "//a[@title='Delete']"
  CONFIRM_DELETE_TA = "facebook_mobile:accept_delete"
  CONFIRM_DELETE_EP = "EP:facebook_mobile:accept_delete"

  def set_email(login, key = nil)
    return find(:xpath, ta(EMAIL_EP)).set(login) if key ==:ep
    return find(:xpath, ta(EMAIL_IL)).set(login) if key ==:il
    find(:xpath, ta(EMAIL_TA, EMAIL_IL)).set(login)
  end

  def set_pass (pass, key = nil)
    return find(:xpath, ta(PASS_EP)).set(pass) if key ==:ep
    return find(:xpath, ta(PASS_IL)).set(pass) if key ==:il
    find(:xpath, ta(PASS_TA, PASS_IL)).set(pass)
  end

  def click_login_btn(key = nil)
    return find(:xpath, ta(LOGIN_BTN_EP)).click if key ==:ep
    return find(:xpath, ta(LOGIN_BTN_IL)).click if key ==:il
    find(:xpath, ta(LOGIN_BTN_TA, LOGIN_BTN_IL)).click
  end

  def click_ok_btn(key = nil)
    return find(:xpath, ta(OK_BTN_EP)).click if key ==:ep
    return find(:xpath, ta(OK_BTN_IL)).click if key ==:il
    find(:xpath, ta(OK_BTN_TA, OK_BTN_IL)).click
  end

  def click_new_post(key = nil)
    return find(:xpath, ta(NEW_POST_EP)).click if key ==:ep
    return find(:xpath, ta(NEW_POST_IL)).click if key ==:il
    find(:xpath, ta(NEW_POST_TA, NEW_POST_IL)).click
  end

  def add_text_in_post(key = nil)
    return find(:xpath, ta(SET_TEXT_EP)).set('text') if key ==:ep
    return find(:xpath, ta(SET_TEXT_IL)).set('text') if key ==:il
    find(:xpath, ta(SET_TEXT_TA, SET_TEXT_IL)).set('text')
  end

  def expect_publishing
    expect(page).to have_text("Your post is now published")
    expect(page).to have_no_text("Your post is now published")
  end

  def click_post_btn(key = nil)
    return find(:xpath, ta(POST_BTN_EP)).click if key ==:ep
    return find(:xpath, ta(POST_BTN_IL)).click if key ==:il
    find(:xpath, ta(POST_BTN_TA, POST_BTN_IL)).click
  end

  def click_multi_menu(key = nil)
    return find(:xpath, ta(MULTI_MENU_BTN_EP)).click if key ==:ep
    return find(:xpath, ta(MULTI_MENU_BTN_IL)).click if key ==:il
    find(:xpath, ta(MULTI_MENU_BTN_TA, MULTI_MENU_BTN_IL)).click
  end

  def deleting_post(key = nil)
    return find(:xpath, ta(DELETE_POST_EP)).click if key ==:ep
    return find(:xpath, ta(DELETE_POST_IL)).click if key ==:il
    find(:xpath, ta(DELETE_POST_TA, DELETE_POST_IL)).click
  end

  def confirm_delete(key = nil)
    return find(:xpath, ta(CONFIRM_DELETE_EP)).click if key ==:ep
    return find(:xpath, ta(CONFIRM_DELETE_IL)).click if key ==:il
    find(:xpath, ta(CONFIRM_DELETE_TA, CONFIRM_DELETE_IL)).click
  end

end