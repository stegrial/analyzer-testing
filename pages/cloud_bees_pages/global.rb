require 'spec_helper'
require_relative '../page_extension'

class CloudBeesGlobal
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  HAM_MENU_BTN_IL = '.at-main-menu-btn'
  HAM_MENU_BTN_TA = 'cloud_bees:ham_menu'

  USERS_SECTION_IL = "//a[./span[text()='Users']]"
  USERS_SECTION_TA = 'cloud_bees:ham_menu:users'

  PIPELINES_SECTION_IL = '.at-main-menu-pipelines'
  PIPELINES_SECTION_TA = "cloud_bees:pipelines"

  APPS_SECTION_IL = "a.at-main-menu-applications"
  APPS_SECTION_TA = "cloud_bees:applications"

  ENV_SECTION_IL = "a.at-main-menu-environments"
  ENV_SECTION_TA = "cloud_bees:environments"

  ADMIN_MENU_IL = "//div[@class='user at-user-logged-in']"
  ADMIN_MENU_TA = "cloud_bees:admin_menu"

  LOGOUT_BTN_IL = "//div[@class='user-menu-item at-user-menu-item-logout']"
  LOGOUT_BTN_TA = "cloud_bees:admin_menu:logout"

  RELEASE_CALENDAR_BTN_IL = ".at-icon-nav-item-releases-calendar"
  RELEASE_CALENDAR_BTN_TA = "cloud_bees:admin_menu:release_calendar_btn"

  CHANGE_HISTORY_SECTION_IL = '.at-main-menu-change_history'
  CHANGE_HISTORY_SECTION_TA = 'cloud_bees:change_history'


  def click_hamburger_menu(key = nil)
    find_element(key, il_type: :css, tl: HAM_MENU_BTN_TA, il: HAM_MENU_BTN_IL).click
  end

  def choose_users_section(key = nil)
    find_element(key, il_type: :xpath, tl: USERS_SECTION_TA, il: USERS_SECTION_IL).click
  end

  def click_pipelines(key = nil)
    find_element(key, il_type: :css, tl: PIPELINES_SECTION_TA, il: PIPELINES_SECTION_IL).click
  end

  def click_applications(key = nil)
    find_element(key, il_type: :css, tl: APPS_SECTION_TA, il: APPS_SECTION_IL).click
  end

  def click_environments(key = nil)
    find_element(key, il_type: :css, tl: ENV_SECTION_TA, il: ENV_SECTION_IL).click
  end

  def click_admin_menu(key = nil)
    find_element(key, il_type: :xpath, tl: ADMIN_MENU_TA, il: ADMIN_MENU_IL).click
  end

  def click_logout_button(key = nil)
    find_element(key, il_type: :xpath, tl: LOGOUT_BTN_TA, il: LOGOUT_BTN_IL).click
  end

  def click_release_calendar_btn(key = nil)
    find_element(key, il_type: :css, tl: RELEASE_CALENDAR_BTN_TA, il: RELEASE_CALENDAR_BTN_IL).click
  end

  def click_change_history(key = nil)
    find_element(key, il_type: :css, tl: CHANGE_HISTORY_SECTION_TA, il: CHANGE_HISTORY_SECTION_IL).click
  end

end