require 'spec_helper'

class CloudBeesPipelinesRuns
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  FIRST_MULTI_MENU_IL = "(//span[contains(@class,'at-multi-actions-btn')])[1]"
  FIRST_MULTI_MENU_TA = "cloud_bees:pipelines_runs:first_multi_action_menu"
  FIRST_MULTI_MENU_EP = "EP:cloud_bees:pipelines_runs:first_multi_action_menu"

  PROPERTIES_MULTI_MENU_IL = "(//div[contains(@class,'at-slide-menu-item title')])[2]"
  PROPERTIES_MULTI_MENU_TA = "cloud_bees:pipelines_runs:properties_multi_menu"
  PROPERTIES_MULTI_MENU_EP = "EP:cloud_bees:pipelines_runs:properties_multi_menu"

  ACCESS_CONTROL_MULTI_MENU_IL = "(//div[contains(@class,'at-slide-menu-item title')])[4]"
  ACCESS_CONTROL_MULTI_MENU_TA = "cloud_bees:pipelines_runs:access_control_multi_menu"
  ACCESS_CONTROL_MULTI_MENU_EP = "EP:cloud_bees:pipelines_runs:access_control_multi_menu"

  CHANGE_HISTORY_MULTI_MENU_IL = "(//div[contains(@class,'at-slide-menu-item title')])[5]"
  CHANGE_HISTORY_MULTI_MENU_TA = "cloud_bees:pipelines_runs:change_history_multi_menu"
  CHANGE_HISTORY_MULTI_MENU_EP = "EP:cloud_bees:pipelines_runs:change_history_multi_menu"

  CLOSE_MODAL_PROPERTIES_ICON_IL = ".at-button-close-modal"
  CLOSE_MODAL_PROPERTIES_ICON_TA = "cloud_bees:pipelines_runs:close_modal_property"
  CLOSE_MODAL_PROPERTIES_ICON_EP = "EP:cloud_bees:pipelines_runs:close_modal_property"

  CLOSE_MODAL_ACCESS_ICON_IL = ".at-button-close-modal"
  CLOSE_MODAL_ACCESS_ICON_TA = "cloud_bees:pipelines_runs:close_modal_access"
  CLOSE_MODAL_ACCESS_ICON_EP = "EP:cloud_bees:pipelines_runs:close_modal_access"

  HISTORY_CLOSE_MODAL_ICON_IL = ".at-history-close"
  HISTORY_CLOSE_MODAL_ICON_TA = "cloud_bees:pipelines_runs:close_modal_history"
  HISTORY_CLOSE_MODAL_ICON_EP = "EP:cloud_bees:pipelines_runs:close_modal_history"


  def choose_pipeline_from_list(key = nil)
    return find(ta(CHOOSE_PIPELINE_EP)).click if key == :ep
    return find(:xpath, CHOOSE_PIPELINE_IL).click if key == :il
    find(:xpath, ta(CHOOSE_PIPELINE_TA, CHOOSE_PIPELINE_IL)).click
  end

  def click_multi_action_menu(key = nil)
    return find(ta(FIRST_MULTI_MENU_EP)).click if key == :ep
    return find(:xpath, FIRST_MULTI_MENU_IL).click if key == :il
    find(:xpath, ta(FIRST_MULTI_MENU_TA, FIRST_MULTI_MENU_IL)).click
  end

  def click_properties_multi_menu(key = nil)
    return find(ta(PROPERTIES_MULTI_MENU_EP)).click if key == :ep
    return find(:xpath, PROPERTIES_MULTI_MENU_IL).click if key == :il
    find(:xpath, ta(PROPERTIES_MULTI_MENU_TA, PROPERTIES_MULTI_MENU_IL)).click
  end

  def click_access_control_multi_menu(key = nil)
    return find(ta(ACCESS_CONTROL_MULTI_MENU_EP)).click if key == :ep
    return find(:xpath, ACCESS_CONTROL_MULTI_MENU_IL).click if key == :il
    find(:xpath, ta(ACCESS_CONTROL_MULTI_MENU_TA, ACCESS_CONTROL_MULTI_MENU_IL)).click
  end

  def click_change_history_multi_menu(key = nil)
    return find(ta(CHANGE_HISTORY_MULTI_MENU_EP)).click if key == :ep
    return find(:xpath, CHANGE_HISTORY_MULTI_MENU_IL).click if key == :il
    find(:xpath, ta(CHANGE_HISTORY_MULTI_MENU_TA, CHANGE_HISTORY_MULTI_MENU_IL)).click
  end

  def click_close_modal_properties(key = nil)
    return find(ta(CLOSE_MODAL_PROPERTIES_ICON_EP)).click if key == :ep
    return find(:css, CLOSE_MODAL_PROPERTIES_ICON_IL).click if key == :il
    find(:css, ta(CLOSE_MODAL_PROPERTIES_ICON_TA, CLOSE_MODAL_PROPERTIES_ICON_IL)).click
  end

  def click_close_modal_access(key = nil)
    return find(ta(CLOSE_MODAL_ACCESS_ICON_EP)).click if key == :ep
    return find(:css, CLOSE_MODAL_ACCESS_ICON_IL).click if key == :il
    find(:css, ta(CLOSE_MODAL_ACCESS_ICON_TA, CLOSE_MODAL_ACCESS_ICON_IL)).click
  end

  def click_history_close_modal(key = nil)
    return find(ta( HISTORY_CLOSE_MODAL_ICON_EP)).click if key == :ep
    return find(:css,  HISTORY_CLOSE_MODAL_ICON_IL).click if key == :il
    find(:css, ta( HISTORY_CLOSE_MODAL_ICON_TA,  HISTORY_CLOSE_MODAL_ICON_IL)).click
  end
end