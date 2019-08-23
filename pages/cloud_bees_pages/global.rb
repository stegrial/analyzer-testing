require 'spec_helper'

class CloudBeesGlobal
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  HAM_MENU_BTN_IL = '.at-main-menu-btn'
  HAM_MENU_BTN_TA = 'cloud_bees:ham_menu'
  HAM_MENU_BTN_EP = 'EP:cloud_bees:ham_menu'

  USERS_SECTION_IL = "//a[./span[text()='Users']]"
  USERS_SECTION_TA = 'cloud_bees:ham_menu:users'
  USERS_SECTION_EP = 'EP:cloud_bees:ham_menu:users'

  PIPELINES_SECTION_IL = '.at-main-menu-pipelines'
  PIPELINES_SECTION_TA = "ec_flow:pipelines"
  PIPELINES_SECTION_EP = "EP:ec_flow:pipelines"

  APPS_SECTION_IL = "a.at-main-menu-applications"
  APPS_SECTION_TA = "ec_flow:applications"
  APPS_SECTION_EP = "EP:ec_flow:applications"

  ADMIN_MENU_IL = "//div[@class='user at-user-logged-in']"
  ADMIN_MENU_TA = "cloud_bees:admin_menu"
  ADMIN_MENU_EP = "EP:cloud_bees:admin_menu"

  LOGOUT_BTN_IL = "//div[@class='user-menu-item at-user-menu-item-logout']"
  LOGOUT_BTN_TA = "cloud_bees:admin_menu:logout"
  LOGOUT_BTN_EP = "EP:cloud_bees:admin_menu:logout"

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

  def click_pipelines(key = nil)
    return find(ta(PIPELINES_SECTION_EP)).click if key == :ep
    return find(:xpath, PIPELINES_SECTION_IL).click if key == :il
    find(:xpath, ta(PIPELINES_SECTION_TA, PIPELINES_SECTION_IL)).click
  end

  def click_applications(key = nil)
    return find(ta(APPS_SECTION_EP)).click if key == :ep
    return find(:css, APPS_SECTION_IL).click if key == :il
    find(:css, ta(APPS_SECTION_TA, APPS_SECTION_IL)).click
  end

  def click_admin_menu(key = nil)
    return find(ta(ADMIN_MENU_EP)).click if key == :ep
    return find(:xpath, ADMIN_MENU_IL).click if key == :il
    find(:xpath, ta(ADMIN_MENU_TA, ADMIN_MENU_IL)).click
  end

  def click_logout_button(key = nil)
    return find(ta(LOGOUT_BTN_EP)).click if key == :ep
    return find(:xpath, LOGOUT_BTN_IL).click if key == :il
    find(:xpath, ta(LOGOUT_BTN_TA, LOGOUT_BTN_IL)).click
  end


end