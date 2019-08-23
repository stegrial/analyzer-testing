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
  PIPELINES_SECTION_TA = "cloud_bees:pipelines"
  PIPELINES_SECTION_EP = "EP:cloud_bees:pipelines"

  APPS_SECTION_IL = "a.at-main-menu-applications"
  APPS_SECTION_TA = "cloud_bees:applications"
  APPS_SECTION_EP = "EP:cloud_bees:applications"

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
    return find(:css, PIPELINES_SECTION_IL).click if key == :il
    find(:css, ta(PIPELINES_SECTION_TA, PIPELINES_SECTION_IL)).click
  end

  def click_applications(key = nil)
    return find(ta(APPS_SECTION_EP)).click if key == :ep
    return find(:css, APPS_SECTION_IL).click if key == :il
    find(:css, ta(APPS_SECTION_TA, APPS_SECTION_IL)).click
  end


end