require_relative '../page_extension'

class CloudBeesPipelinesRuns < PageExtension

  FIRST_MULTI_MENU_IL = "(//span[contains(@class,'at-multi-actions-btn')])[1]"
  FIRST_MULTI_MENU_TA = "cloud_bees:pipelines_runs:first_multi_action_menu"

  PROPERTIES_MULTI_MENU_IL = "(//div[contains(@class,'at-slide-menu-item title')])[2]"
  PROPERTIES_MULTI_MENU_TA = "cloud_bees:pipelines_runs:properties_multi_menu"

  ACCESS_CONTROL_MULTI_MENU_IL = "(//div[contains(@class,'at-slide-menu-item title')])[4]"
  ACCESS_CONTROL_MULTI_MENU_TA = "cloud_bees:pipelines_runs:access_control_multi_menu"

  CHANGE_HISTORY_MULTI_MENU_IL = "(//div[contains(@class,'at-slide-menu-item title')])[5]"
  CHANGE_HISTORY_MULTI_MENU_TA = "cloud_bees:pipelines_runs:change_history_multi_menu"

  # SVG CLOSE_MODAL_PROPERTIES_ICON_IL = ".at-button-close-modal"
  CLOSE_MODAL_PROPERTIES_ICON_IL = ".ec-react-wizard__breadcrumbs span"
  CLOSE_MODAL_PROPERTIES_ICON_TA = "cloud_bees:pipelines_runs:close_modal_property"

  # SVG CLOSE_MODAL_ACCESS_ICON_IL = ".at-button-close-modal"
  CLOSE_MODAL_ACCESS_ICON_IL = ".ec-react-wizard__breadcrumbs span"
  CLOSE_MODAL_ACCESS_ICON_TA = "cloud_bees:pipelines_runs:close_modal_access"

  HISTORY_CLOSE_MODAL_ICON_IL = ".at-history-close"
  HISTORY_CLOSE_MODAL_ICON_TA = "cloud_bees:pipelines_runs:close_modal_history"

  PROJ_SELECT_IL = "(//div[contains(@class,'at-project-select')])[1]"
  PROJ_SELECT_TA = "cloud_bees:pipelines_runs:proj_select"

  EC_EXAMPLES_PROJ_IL = "//div[text()='EC-Examples']"
  EC_EXAMPLES_PROJ_TA = "cloud_bees:pipelines_runs:ec_examples_proj"

  ACCEPT_DROPDOWN_SELECTION_IL = ".at-project-select-submit"
  ACCEPT_DROPDOWN_SELECTION_TA = "cloud_bees:pipelines_runs:accept_proj_selection"

  RUN_STATUS_SELECT_IL = "(//div[contains(@class,'at-status-select')])[1]"
  RUN_STATUS_SELECT_TA = "cloud_bees:pipelines_runs:run_status_select"

  SUCCESSFUL_RUN_STATUS_IL = ".at-run-status-successful"
  SUCCESSFUL_RUN_STATUS_TA = "cloud_bees:pipelines_runs:successful_run_status_select"

  ERROR_RUN_STATUS_IL = ".at-run-status-error"
  ERROR_RUN_STATUS_TA = "cloud_bees:pipelines_runs:error_run_status_select"

  APPLY_RUN_STATUS_IL = ".at-multiselect-picker-submit"
  APPLY_RUN_STATUS_TA = "cloud_bees:pipelines_runs:apply_run_status"

  def click_to_select_proj(key = nil)
    find_element(key, il_type: :xpath, tl: PROJ_SELECT_TA, il: PROJ_SELECT_IL).click
  end

  def click_to_select_ec_examples_proj(key = nil)
    find_element(key, il_type: :xpath, tl: EC_EXAMPLES_PROJ_TA, il: EC_EXAMPLES_PROJ_IL).click
  end

  def click_to_accept_proj(key = nil)
    find_element(key, il_type: :css, tl: ACCEPT_DROPDOWN_SELECTION_TA, il: ACCEPT_DROPDOWN_SELECTION_IL).click
  end

  def click_to_run_status(key = nil)
    find_element(key, il_type: :xpath, tl: RUN_STATUS_SELECT_TA, il: RUN_STATUS_SELECT_IL).click
  end

  def click_to_select_successful_status(key = nil)
    find_element(key, il_type: :css, tl: SUCCESSFUL_RUN_STATUS_TA, il: SUCCESSFUL_RUN_STATUS_IL).click
  end

  def click_to_select_error_status(key = nil)
    find_element(key, il_type: :css, tl: ERROR_RUN_STATUS_TA, il: ERROR_RUN_STATUS_IL).click
  end

  def click_to_apply_status(key = nil)
    find_element(key, il_type: :css, tl: APPLY_RUN_STATUS_TA, il: APPLY_RUN_STATUS_IL).click
  end

  def click_multi_action_menu(key = nil)
    find_element(key, il_type: :xpath, tl: FIRST_MULTI_MENU_TA, il: FIRST_MULTI_MENU_IL).click
  end

  def click_properties_multi_menu(key = nil)
    find_element(key, il_type: :xpath, tl: PROPERTIES_MULTI_MENU_TA, il: PROPERTIES_MULTI_MENU_IL).click
  end

  def click_access_control_multi_menu(key = nil)
    find_element(key, il_type: :xpath, tl: ACCESS_CONTROL_MULTI_MENU_TA, il: ACCESS_CONTROL_MULTI_MENU_IL).click
  end

  def click_change_history_multi_menu(key = nil)
    find_element(key, il_type: :xpath, tl: CHANGE_HISTORY_MULTI_MENU_TA, il: CHANGE_HISTORY_MULTI_MENU_IL).click
  end

  def click_close_modal_properties(key = nil)
    find_element(key, il_type: :css, tl: CLOSE_MODAL_PROPERTIES_ICON_TA, il: CLOSE_MODAL_PROPERTIES_ICON_IL).click
  end

  def click_close_modal_access(key = nil)
    find_element(key, il_type: :css, tl: CLOSE_MODAL_ACCESS_ICON_TA, il: CLOSE_MODAL_ACCESS_ICON_IL).click
  end

  def click_history_close_modal(key = nil)
    find_element(key, il_type: :css, tl: HISTORY_CLOSE_MODAL_ICON_TA, il: HISTORY_CLOSE_MODAL_ICON_IL).click
  end
end