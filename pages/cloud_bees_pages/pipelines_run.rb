require 'spec_helper'
require_relative '../../helpers/special_methods'

class CloudBeesPipelinesRuns
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

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

  # SVG CLOSE_MODAL_PROPERTIES_ICON_IL = ".at-button-close-modal"
  CLOSE_MODAL_PROPERTIES_ICON_IL = ".ec-react-wizard__breadcrumbs span"
  CLOSE_MODAL_PROPERTIES_ICON_TA = "cloud_bees:pipelines_runs:close_modal_property"
  CLOSE_MODAL_PROPERTIES_ICON_EP = "EP:cloud_bees:pipelines_runs:close_modal_property"

  # SVG CLOSE_MODAL_ACCESS_ICON_IL = ".at-button-close-modal"
  CLOSE_MODAL_ACCESS_ICON_IL = ".ec-react-wizard__breadcrumbs span"
  CLOSE_MODAL_ACCESS_ICON_TA = "cloud_bees:pipelines_runs:close_modal_access"
  CLOSE_MODAL_ACCESS_ICON_EP = "EP:cloud_bees:pipelines_runs:close_modal_access"

  HISTORY_CLOSE_MODAL_ICON_IL = ".at-history-close"
  HISTORY_CLOSE_MODAL_ICON_TA = "cloud_bees:pipelines_runs:close_modal_history"
  HISTORY_CLOSE_MODAL_ICON_EP = "EP:cloud_bees:pipelines_runs:close_modal_history"

  PROJ_SELECT_IL = "(//div[contains(@class,'at-project-select')])[1]"
  PROJ_SELECT_TA = "cloud_bees:pipelines_runs:proj_select"
  PROJ_SELECT_EP = "EP:cloud_bees:pipelines_runs:proj_select"

  EC_EXAMPLES_PROJ_IL = "//div[text()='EC-Examples']"
  EC_EXAMPLES_PROJ_TA = "cloud_bees:pipelines_runs:ec_examples_proj"
  EC_EXAMPLES_PROJ_EP = "EP:cloud_bees:pipelines_runs:ec_examples_proj"

  ACCEPT_DROPDOWN_SELECTION_IL = ".at-project-select-submit"
  ACCEPT_DROPDOWN_SELECTION_TA = "cloud_bees:pipelines_runs:accept_proj_selection"
  ACCEPT_DROPDOWN_SELECTION_EP = "EP:cloud_bees:pipelines_runs:accept_proj_selection"

  RUN_STATUS_SELECT_IL = "(//div[contains(@class,'at-status-select')])[1]"
  RUN_STATUS_SELECT_TA = "cloud_bees:pipelines_runs:run_status_select"
  RUN_STATUS_SELECT_EP = "EP:cloud_bees:pipelines_runs:run_status_select"

  SUCCESSFUL_RUN_STATUS_IL = ".at-run-status-successful"
  SUCCESSFUL_RUN_STATUS_TA = "cloud_bees:pipelines_runs:successful_run_status_select"
  SUCCESSFUL_RUN_STATUS_EP = "EP:cloud_bees:pipelines_runs:successful_run_status_select"

  ERROR_RUN_STATUS_IL = ".at-run-status-error"
  ERROR_RUN_STATUS_TA = "cloud_bees:pipelines_runs:error_run_status_select"
  ERROR_RUN_STATUS_EP = "EP:cloud_bees:pipelines_runs:error_run_status_select"

  APPLY_RUN_STATUS_IL = ".at-multiselect-picker-submit"
  APPLY_RUN_STATUS_TA = "cloud_bees:pipelines_runs:apply_run_status"
  APPLY_RUN_STATUS_EP = "EP:cloud_bees:pipelines_runs:apply_run_status"

  def click_to_select_proj(key = nil)
    post_processing key do
      return find(ta(PROJ_SELECT_EP)).click if key == :ep
      return find(:xpath, PROJ_SELECT_IL).click if key == :il
      find(:xpath, ta(PROJ_SELECT_TA, PROJ_SELECT_IL)).click
    end
  end

  def click_to_select_ec_examples_proj(key = nil)
    post_processing key do
      return find(ta(EC_EXAMPLES_PROJ_EP)).click if key == :ep
      return find(:xpath, EC_EXAMPLES_PROJ_IL).click if key == :il
      find(:xpath, ta(EC_EXAMPLES_PROJ_TA, EC_EXAMPLES_PROJ_IL)).click
    end
  end

  def click_to_accept_proj(key = nil)
    post_processing key do
      return find(ta(ACCEPT_DROPDOWN_SELECTION_EP)).click if key == :ep
      return find(:css, ACCEPT_DROPDOWN_SELECTION_IL).click if key == :il
      find(:css, ta(ACCEPT_DROPDOWN_SELECTION_TA, ACCEPT_DROPDOWN_SELECTION_IL)).click
    end
  end

  def click_to_run_status(key = nil)
    post_processing key do
      return find(ta(RUN_STATUS_SELECT_EP)).click if key == :ep
      return find(:xpath, RUN_STATUS_SELECT_IL).click if key == :il
      find(:xpath, ta(RUN_STATUS_SELECT_TA, RUN_STATUS_SELECT_IL)).click
    end
  end

  def click_to_select_successful_status(key = nil)
    post_processing key do
      return find(ta(SUCCESSFUL_RUN_STATUS_EP)).click if key == :ep
      return find(:css, SUCCESSFUL_RUN_STATUS_IL).click if key == :il
      find(:css, ta(SUCCESSFUL_RUN_STATUS_TA, SUCCESSFUL_RUN_STATUS_IL)).click
    end
  end

  def click_to_select_error_status(key = nil)
    post_processing key do
      return find(ta(ERROR_RUN_STATUS_EP)).click if key == :ep
      return find(:css, ERROR_RUN_STATUS_IL).click if key == :il
      find(:css, ta(ERROR_RUN_STATUS_TA, ERROR_RUN_STATUS_IL)).click
    end
  end

  def click_to_apply_status(key = nil)
    post_processing key do
      return find(ta(APPLY_RUN_STATUS_EP)).click if key == :ep
      return find(:css, APPLY_RUN_STATUS_IL).click if key == :il
      find(:css, ta(APPLY_RUN_STATUS_TA, APPLY_RUN_STATUS_IL)).click
    end
  end

  def click_multi_action_menu(key = nil)
    post_processing key do
      return find(ta(FIRST_MULTI_MENU_EP)).click if key == :ep
      return find(:xpath, FIRST_MULTI_MENU_IL).click if key == :il
      find(:xpath, ta(FIRST_MULTI_MENU_TA, FIRST_MULTI_MENU_IL)).click
    end
  end

  def click_properties_multi_menu(key = nil)
    post_processing key do
      return find(ta(PROPERTIES_MULTI_MENU_EP)).click if key == :ep
      return find(:xpath, PROPERTIES_MULTI_MENU_IL).click if key == :il
      find(:xpath, ta(PROPERTIES_MULTI_MENU_TA, PROPERTIES_MULTI_MENU_IL)).click
    end
  end

  def click_access_control_multi_menu(key = nil)
    post_processing key do
      return find(ta(ACCESS_CONTROL_MULTI_MENU_EP)).click if key == :ep
      return find(:xpath, ACCESS_CONTROL_MULTI_MENU_IL).click if key == :il
      find(:xpath, ta(ACCESS_CONTROL_MULTI_MENU_TA, ACCESS_CONTROL_MULTI_MENU_IL)).click
    end
  end

  def click_change_history_multi_menu(key = nil)
    post_processing key do
      return find(ta(CHANGE_HISTORY_MULTI_MENU_EP)).click if key == :ep
      return find(:xpath, CHANGE_HISTORY_MULTI_MENU_IL).click if key == :il
      find(:xpath, ta(CHANGE_HISTORY_MULTI_MENU_TA, CHANGE_HISTORY_MULTI_MENU_IL)).click
    end
  end

  def click_close_modal_properties(key = nil)
    post_processing key do
      return find(ta(CLOSE_MODAL_PROPERTIES_ICON_EP)).click if key == :ep
      return find(:css, CLOSE_MODAL_PROPERTIES_ICON_IL).click if key == :il
      find(:css, ta(CLOSE_MODAL_PROPERTIES_ICON_TA, CLOSE_MODAL_PROPERTIES_ICON_IL)).click
    end
  end

  def click_close_modal_access(key = nil)
    post_processing key do
      return find(ta(CLOSE_MODAL_ACCESS_ICON_EP)).click if key == :ep
      return find(:css, CLOSE_MODAL_ACCESS_ICON_IL).click if key == :il
      find(:css, ta(CLOSE_MODAL_ACCESS_ICON_TA, CLOSE_MODAL_ACCESS_ICON_IL)).click
    end
  end

  def click_history_close_modal(key = nil)
    post_processing key do
      return find(ta( HISTORY_CLOSE_MODAL_ICON_EP)).click if key == :ep
      return find(:css,  HISTORY_CLOSE_MODAL_ICON_IL).click if key == :il
      find(:css, ta( HISTORY_CLOSE_MODAL_ICON_TA,  HISTORY_CLOSE_MODAL_ICON_IL)).click
    end
  end
end