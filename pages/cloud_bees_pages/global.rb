require 'spec_helper'
require_relative '../page_extension'

class CloudBeesGlobal
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  HAM_MENU_BTN_IL = '.at-main-menu-btn'
  HAM_MENU_BTN_TA = 'cloud_bees:ham_menu'
  HAM_MENU_BTN_EP = 'EP:cloud_bees:ham_menu'

  USERS_SECTION_IL = "//a[./span[text()='Users']]"
  USERS_SECTION_TA = 'cloud_bees:ham_menu:users'
  USERS_SECTION_EP = 'EP:cloud_bees:ham_menu:users'

  PIPELINES_SECTION_IL = '.at-main-menu-pipelines'
  PIPELINES_SECTION_TA = "cloud_bees:pipelines"
  PIPELINES_SECTION_EP = "EP:cloud_bees:pipelines"

  APPS_SECTION_IL = "a.at-main-menu-applications"
  APPS_SECTION_TA = "cloud_bees:applications"
  APPS_SECTION_EP = "EP:cloud_bees:applications"

  ENV_SECTION_IL = "a.at-main-menu-environments"
  ENV_SECTION_TA = "cloud_bees:environments"
  ENV_SECTION_EP = "EP:cloud_bees:environments"

  ADMIN_MENU_IL = "//div[@class='user at-user-logged-in']"
  ADMIN_MENU_TA = "cloud_bees:admin_menu"
  ADMIN_MENU_EP = "EP:cloud_bees:admin_menu"

  LOGOUT_BTN_IL = "//div[@class='user-menu-item at-user-menu-item-logout']"
  LOGOUT_BTN_TA = "cloud_bees:admin_menu:logout"
  LOGOUT_BTN_EP = "EP:cloud_bees:admin_menu:logout"

  RELEASE_CALENDAR_BTN_IL = ".at-icon-nav-item-releases-calendar"
  RELEASE_CALENDAR_BTN_TA = "cloud_bees:admin_menu:release_calendar_btn"
  RELEASE_CALENDAR_BTN_EP = "EP:cloud_bees:admin_menu:release_calendar_btn"

  CHANGE_HISTORY_SECTION_IL = '.at-main-menu-change_history'
  CHANGE_HISTORY_SECTION_TA = 'cloud_bees:change_history'
  CHANGE_HISTORY_SECTION_EP = 'EP:cloud_bees:change_history'

  def click_hamburger_menu(key = nil)
    post_processing key do
      return find(ta(HAM_MENU_BTN_EP)).click if key == :ep
      return find(:css, HAM_MENU_BTN_IL).click if key == :il
      find(:css, ta(HAM_MENU_BTN_TA, HAM_MENU_BTN_IL)).click
    end
  end

  def choose_users_section(key = nil)
    post_processing key do
      return find(ta(USERS_SECTION_EP)).click if key == :ep
      return find(:xpath, USERS_SECTION_IL).click if key == :il
      find(:xpath, ta(USERS_SECTION_TA, USERS_SECTION_IL)).click
    end
  end

  def click_pipelines(key = nil)
    post_processing key do
      return find(ta(PIPELINES_SECTION_EP)).click if key == :ep
      return find(:css, PIPELINES_SECTION_IL).click if key == :il
      find(:css, ta(PIPELINES_SECTION_TA, PIPELINES_SECTION_IL)).click
    end
  end

  def click_applications(key = nil)
    post_processing key do
      return find(ta(APPS_SECTION_EP)).click if key == :ep
      return find(:css, APPS_SECTION_IL).click if key == :il
      find(:css, ta(APPS_SECTION_TA, APPS_SECTION_IL)).click
    end
  end

  def click_environments(key = nil)
    post_processing key do
      return find(ta(ENV_SECTION_EP)).click if key == :ep
      return find(:css, ENV_SECTION_IL).click if key == :il
      find(:css, ta(ENV_SECTION_TA, ENV_SECTION_IL)).click
    end
  end

  def click_admin_menu(key = nil)
    post_processing key do
      return find(ta(ADMIN_MENU_EP)).click if key == :ep
      return find(:xpath, ADMIN_MENU_IL).click if key == :il
      find(:xpath, ta(ADMIN_MENU_TA, ADMIN_MENU_IL)).click
    end
  end

  def click_logout_button(key = nil)
    post_processing key do
      return find(ta(LOGOUT_BTN_EP)).click if key == :ep
      return find(:xpath, LOGOUT_BTN_IL).click if key == :il
      find(:xpath, ta(LOGOUT_BTN_TA, LOGOUT_BTN_IL)).click
    end
  end

  def click_release_calendar_btn(key = nil)
    post_processing key do
      return find(ta(RELEASE_CALENDAR_BTN_EP)).click if key == :ep
      return find(:css, RELEASE_CALENDAR_BTN_IL).click if key == :il
      find(:css, ta(RELEASE_CALENDAR_BTN_TA, RELEASE_CALENDAR_BTN_IL)).click
    end
  end

  def click_change_history(key = nil)
    post_processing key do
      return find(ta(CHANGE_HISTORY_SECTION_EP)).click if key == :ep
      return find(:css, CHANGE_HISTORY_SECTION_IL).click if key == :il
      find(:css, ta(CHANGE_HISTORY_SECTION_TA, CHANGE_HISTORY_SECTION_IL)).click
    end
  end
end