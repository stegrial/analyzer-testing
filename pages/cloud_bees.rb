require 'spec_helper'

class CloudBees
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  USERNAME_FIELD_IL = '.at-login-username'
  USERNAME_FIELD_TA = 'cloud_bees:login_page:username'
  USERNAME_FIELD_EP = 'EP:cloud_bees:login_page:username'

  PASSWORD_FIELD_IL = '.at-login-password'
  PASSWORD_FIELD_TA = 'cloud_bees:login_page:password'
  PASSWORD_FIELD_EP = 'EP:cloud_bees:login_page:password'

  SIGN_IN_BTN_IL = '.at-login-button'
  SIGN_IN_BTN_TA = 'cloud_bees:login_page:sign_in_btn'
  SIGN_IN_BTN_EP = 'EP:cloud_bees:login_page:sign_in_btn'

  HAM_MENU_BTN_IL = '.at-main-menu-btn'
  HAM_MENU_BTN_TA = 'cloud_bees:ham_menu'
  HAM_MENU_BTN_EP = 'EP:cloud_bees:ham_menu'

  USERS_SECTION_IL = "//a[./span[text()='Users']]"
  USERS_SECTION_TA = 'cloud_bees:ham_menu:users'
  USERS_SECTION_EP = 'EP:cloud_bees:ham_menu:users'

  CREATE_USER_BTN_IL = "//td[@id='pageHeader_actionList_actionList0']/a"
  CREATE_USER_BTN_TA = 'cloud_bees:users_page:create_user_btn'
  CREATE_USER_BTN_EP = 'EP:cloud_bees:users_page:create_user_btn'

  USER_NAME_FIELD_IL = '[id=userName]'
  USER_NAME_FIELD_TA = 'cloud_bees:new_user:user_name_fld'
  USER_NAME_FIELD_EP = 'EP:cloud_bees:new_user:user_name_fld'

  REAL_NAME_FIELD_IL = '[id=fullUserName]'
  REAL_NAME_FIELD_TA = 'cloud_bees:new_user:real_name_fld'
  REAL_NAME_FIELD_EP = 'EP:cloud_bees:new_user:real_name_fld'



  def fill_username_field(key = nil, username)
    return find(ta(USERNAME_FIELD_EP)).set(username) if key == :ep
    return find(:css, USERNAME_FIELD_IL).set(username) if key == :il
    find(:css, ta(USERNAME_FIELD_TA, USERNAME_FIELD_IL)).set(username)
  end

  def fill_pass_field(key = nil, pass)
    return find(ta(PASSWORD_FIELD_EP)).set(pass) if key == :ep
    return find(:css, PASSWORD_FIELD_IL).set(pass) if key == :il
    find(:css, ta(PASSWORD_FIELD_TA, PASSWORD_FIELD_IL)).set(pass)
  end

  def click_sign_in_button(key = nil)
    return find(ta(SIGN_IN_BTN_EP)).click if key == :ep
    return find(:css, SIGN_IN_BTN_IL).click if key == :il
    find(:css, ta(SIGN_IN_BTN_TA, SIGN_IN_BTN_IL)).click
  end

  def click_hamburger_menu(key = nil)
    return find(ta(HAM_MENU_BTN_EP)).click if key == :ep
    return find(:css, HAM_MENU_BTN_IL).click if key == :il
    find(:css, ta(HAM_MENU_BTN_TA, HAM_MENU_BTN_IL)).click
  end

  def choose_users_section(key = nil)
    return find(ta(USERS_SECTION_EP)).click if key == :ep
    return find(:xpath, USERS_SECTION_IL).click if key == :il
    find(:xpath, ta(USERS_SECTION_TA, USERS_SECTION_IL)).click
  end

  def press_create_user_btn(key = nil)
    within_frame(0) do
      return find(ta(CREATE_USER_BTN_EP)).click if key == :ep
      return find(:xpath, CREATE_USER_BTN_IL).click if key == :il
      find(:xpath, ta(CREATE_USER_BTN_TA, CREATE_USER_BTN_IL)).click
    end
  end

  def fill_user_name_field(key = nil, name)
    within_frame(0) do
      return find(ta(USER_NAME_FIELD_EP)).set(name) if key == :ep
      return find(:css, USER_NAME_FIELD_IL).set(name) if key == :il
      find(:css, ta(USER_NAME_FIELD_TA, USER_NAME_FIELD_IL)).set(name)
    end
  end

  def fill_real_name_field(key = nil, name)
    within_frame(0) do
      return find(ta(REAL_NAME_FIELD_EP)).set(name) if key == :ep
      return find(:css, REAL_NAME_FIELD_IL).set(name) if key == :il
      find(:css, ta(REAL_NAME_FIELD_TA, REAL_NAME_FIELD_IL)).set(name)
    end
  end



end