require 'spec_helper'

class AnnieselkeMobile

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  LOGIN_BTN_IL = "(//a[text()='Login'])[1]"
  LOGIN_BTN_TA = "annieselke_mobile:login_btn"
  LOGIN_BTN_EP = "EP:annieselke_mobile:login_btn"

  EMAIL_IL = "//input[@id='j_username']"
  EMAIL_TA = "annieselke_mobile:email"
  EMAIL_EP = "EP:annieselke_mobile:email"

  PASS_IL = "//input[@id='j_password']"
  PASS_TA = "annieselke_mobile:pass"
  PASS_EP = "EP:annieselke_mobile:pass"

  LOGIN_IL = "(//button[@class='primary'])[1]"
  LOGIN_TA = "annieselke_mobile:register"
  LOGIN_EP = "EP:annieselke_mobile:register"

  HAMBURGER_MENU_IL = "//button[@aria-label='Menu']"
  HAMBURGER_MENU_TA = "annieselke_mobile:humburger_menu"
  HAMBURGER_MENU_EP = "EP:annieselke_mobile:humburger_menu"

  MY_ACCOUNT_IL = "//a[text()='My Account']"
  MY_ACCOUNT_TA = "annieselke_mobile:my_account"
  MY_ACCOUNT_EP = "EP:annieselke_mobile:my_account"


  PERSONAL_DETEILS_IL = "//a[text()='Update personal details']"
  PERSONAL_DETEILS_TA = "annieselke_mobile:personal_details"
  PERSONAL_DETEILS_EP = "EP:annieselke_mobile:personal_details"

  GENDER_IL = "//select[@id='profile.title']"
  GENDER_TA = "annieselke_mobile:gender"
  GENDER_EP = "EP:annieselke_mobile:gender"

  SAVE_BTN_IL = "//button[text()='Save Updates']"
  SAVE_BTN_TA = "annieselke_mobile:save_btn"
  SAVE_BTN_EP = "EP:annieselke_mobile:save_btn"

  def login_btn(key = nil)
    return find(:xpath, ta(LOGIN_BTN_EP)).click if  key ==:ep
    return find(:xpath, LOGIN_BTN_IL).click if  key ==:il
    find(:xpath, ta(LOGIN_BTN_TA, LOGIN_BTN_IL)).click
  end

  def set_email(key = nil)
    return find(:xpath, ta(EMAIL_EP)).set("julia.arapova@softesis.com") if key ==:ep
    return find(:xpath, EMAIL_IL).set("julia.arapova@softesis.com") if key ==:il
    find(:xpath, ta(EMAIL_TA, EMAIL_IL)).set("julia.arapova@softesis.com")
  end

  def set_pass(key = nil)
    return find(:xpath, ta(PASS_EP)).set("1234tesT") if key ==:ep
    return find(:xpath, PASS_IL).set("1234tesT") if key ==:il
    find(:xpath, ta(PASS_TA, PASS_IL)).set("1234tesT")
  end

  def click_login_btn(key = nil)
    return find(:xpath, ta(LOGIN_EP)).click if key ==:ep
    return find(:xpath, LOGIN_IL).click if key ==:il
    find(:xpath, ta(LOGIN_TA, LOGIN_IL)).click
  end

  def click_hamburger_menu(key = nil)
    return find(:xpath, ta(HAMBURGER_MENU_EP)).click if key == :ep
    return find(:xpath, HAMBURGER_MENU_IL).click if key == :il
    find(:xpath, ta(HAMBURGER_MENU_TA, HAMBURGER_MENU_IL)).click
  end

  def click_my_acc_btn(key = nil)
    return find(:xpath, ta(MY_ACCOUNT_EP)).click if key ==:ep
    return find(:xpath, MY_ACCOUNT_IL).click if key ==:il
    find(:xpath, ta(MY_ACCOUNT_TA, MY_ACCOUNT_IL)).click
  end

  def click_personal_info_btn(key = nil)
    return find(:xpath, ta(PERSONAL_DETEILS_EP)).click if key ==:ep
    return find(:xpath, PERSONAL_DETEILS_IL).click if key ==:il
    find(:xpath, ta(PERSONAL_DETEILS_TA, PERSONAL_DETEILS_IL)).click
  end

  def select_gender(key = nil, gender)
    return find(:xpath, ta(GENDER_EP)).select(gender) if key ==:ep
    return find(:xpath, GENDER_IL).select(gender) if key ==:il
    find(:xpath, ta(GENDER_TA, GENDER_IL)).select(gender)
  end
  GENDER__SELECT_IL = "profile.title"
  GENDER__SELECT_TA = "annieselke_mobile:gender_select"
  GENDER__SELECT_EP = "EP:annieselke_mobile:gender_select"

  OPTION__MR_IL = "option[2]"
  OPTION__MR_TA = "annieselke_mobile:gender_mr"
  OPTION__MR_EP = "EP:annieselke_mobile:gender_mr"

  OPTION__MS_IL = "option[3]"
  OPTION__MS_TA = "annieselke_mobile:gender_ms"
  OPTION__MS_EP = "EP:annieselke_mobile:gender_ms"

  def click_save_btn(key = nil)
    return find(:xpath, ta(SAVE_BTN_EP)).click if key ==:ep
    return find(:xpath, SAVE_BTN_IL).click if key ==:il
    find(:xpath, ta(SAVE_BTN_TA, SAVE_BTN_IL)).click
  end

  def close_modal
    if page.has_xpath?("//iframe[@title='Sign up for 15% Off!']")
      within_frame(1) do
        find(:xpath, "//button[@title='Close Dialog']").click
      end
    end
  end


end