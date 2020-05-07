require 'spec_helper'
require_relative '../page_extension'

class CloudBeesApps < PageExtension
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  APPLICATION_FROM_LIST_IL = "//a[@title='app_with_artifacts_gwt_field(scope)']"
  APPLICATION_FROM_LIST_TA = "cloud_bees:apps:application_from_list"

  NEW_APPLICATION_BTN_IL = "//div[text()='New']"
  NEW_APPLICATION_BTN_TA = 'cloud_bees:apps:new_application'

  CREATE_NEW_APPLICATION_IL = "//div[@class='object-create__type' and text()='Create New...']"
  CREATE_NEW_APPLICATION_TA = 'cloud_bees:apps:create_new_application'

  APPLICATION_NAME_IL = "//input[@class='Form__input at-app-name-input']"
  APPLICATION_NAME_TA = 'cloud_bees:apps:application_name'

  SELECT_PROJECT_IL = "//div[text()='Select Project']"
  SELECT_PROJECT_TA = 'cloud_bees:apps:select_project'

  SELECT_DEFAULT_PROJECT_IL = "//div[@title='Default' and contains(@class, 'ec-project-select-picker__option')]"
  SELECT_DEFAULT_PROJECT_TA = 'cloud_bees:apps:select_default_project'

  CONFIRM_NEW_APPLICATION_IL = "//div[text()='OK']"
  CONFIRM_NEW_APPLICATION_TA = 'cloud_bees:apps:confirm_new_application'

  COMPONENT_TIER_IL = "//div[@class='tier at-starting-tier']"
  COMPONENT_TIER_TA = 'cloud_bees:apps:component_tier'

  CREATE_NEW_COMPONENT_IL = "//div[@class='object-create__type']//span[text()='Create New...']"
  CREATE_NEW_COMPONENT_TA = 'cloud_bees:apps:create_new_component'

  COMPONENT_NAME_IL = "//input[@class='Form__input at-component-name-input']"
  COMPONENT_NAME_TA = 'cloud_bees:apps:component_name'

  COMPONENT_NEXT_IL = "//div[text()='Next']"
  COMPONENT_NEXT_TA = 'cloud_bees:apps:component_next'

  CONTENT_LOCATION_IL = "//div[text()='Content location']"
  CONTENT_LOCATION_TA = 'cloud_bees:apps:content_location'

  SELECT_EC_ARTIFACT_IL = "//span[text()='EC-Artifact']"
  SELECT_EC_ARTIFACT_TA = 'cloud_bees:apps:select_ec_artifact'

  ARTIFACT_NAME_IL = "//input[@class='gwt-SuggestBox GAMBAOGN-']"
  ARTIFACT_NAME_TA = 'cloud_bees:apps:artifact_name'

  CONFIRM_NEW_ARTIFACT_IL = "//div[text()='OK']"
  CONFIRM_NEW_ARTIFACT_TA = 'cloud_bees:apps:confirm_new_artifact'

  FIND_APPLICATION_FIELD_IL = ".control-bar-container input[placeholder='Find...']"
  FIND_APPLICATION_FIELD_TA = 'cloud_bees:apps:find_application_field'

  CHOOSE_APPLICATION_IL = "//div[contains(@class, 'object at-application-list') and .//a[@title='appName']]"
  CHOOSE_APPLICATION_TA = 'cloud_bees:apps:choose_application'

  APPLICATION_LIST_ITEM_IL = ".at-application-list-item"
  APPLICATION_LIST_ITEM_TA = 'cloud_bees:apps:application_list_item'

  DELETE_APPLICATION_IL = "//span[text()='Delete']"
  DELETE_APPLICATION_TA = 'cloud_bees:apps:delete_application'

  CONFIRM_DELETE_APPLICATION_IL = "//div[text()='OK']"
  CONFIRM_DELETE_APPLICATION_TA = 'cloud_bees:apps:confirm_delete_application'

  CREATE_EXISTING_MASTER_COMPONENT_IL = "//div[./span[contains(.,'Existing Master Component')]]"
  CREATE_EXISTING_MASTER_COMPONENT_TA = 'cloud_bees:apps:existing_master_component'

  COMPONENT_JBOSSMC_IL = "//span[text()='JBossMC']"
  COMPONENT_JBOSSMC_TA = 'cloud_bees:apps:component_jbossmc'

  CHECKBOX_NEAR_JBOSSMC_IL = "//div[@title='JBossMC']//following-sibling::div//span[@title='Use Master Component']"
  CHECKBOX_NEAR_JBOSSMC_TA = 'cloud_bees:apps:checkbox_near_jbossmc'

  CLOSE_ATTENTION_IN_COMPONENT_IL = "//div[@class='sds-icon remove at-close-attention']"
  CLOSE_ATTENTION_IN_COMPONENT_TA = 'cloud_bees:apps:close_attention_in_component'

  COMPONENT_EXISTING_MASTER_NEXT_IL = "//div[text()='Next']"
  COMPONENT_EXISTING_MASTER_NEXT_TA = 'cloud_bees:apps:component_existing_master_next'

  COMPONENT_OK_BTN_IL = "//div[text()='OK']"
  COMPONENT_OK_BTN_TA = 'cloud_bees:apps:component_ok_btn'

  DROPDOWN_IN_TIER_IL = "//span[@title='Component Processes']"
  DROPDOWN_IN_TIER_TA = 'cloud_bees:apps:dropdown_in_tier'

  NEW_COMPONENT_PROCESSES_IL = '.sds-svg-icon__wrapper--icon-component-process-add'
  NEW_COMPONENT_PROCESSES_TA = 'cloud_bees:apps:new_component_processes'

  CREATE_NEW_COMPONENT_PROCESSES_IL = "//div[text()='Create New...']"
  CREATE_NEW_COMPONENT_PROCESSES_TA = 'cloud_bees:apps:create_new_component_processes'

  PROCESS_NAME_IL = "//input[@class='Form__input at-process-name-input at-react-form-txt-input']"
  PROCESS_NAME_TA = 'cloud_bees:apps:process_name_field'

  DROPDOWN_DEPLOY_UNDEPLOY_IL = "(//div[@class='at-select-header-title ec-select-header-title'])[1]"
  DROPDOWN_DEPLOY_UNDEPLOY_TA = 'cloud_bees:apps:dropdown_deploy_undeploy'

  DROPDOWN_UNDEPLOY_IL = "//div[@class='ec-select-option at-select-option at-select-option-2']"
  DROPDOWN_UNDEPLOY_TA = 'cloud_bees:apps:dropdown_undeploy'

  DROPDOWN_SELECT_WORKSPACE_IL = "(//div[@class='at-select-header-title ec-select-header-title'])[2]"
  DROPDOWN_SELECT_WORKSPACE_TA = 'cloud_bees:apps:dropdown_select_workspace'

  DEFAULT_DROPDOWN_SELECT_WORKSPACE_IL = "//span[@title='default']"
  DEFAULT_DROPDOWN_SELECT_WORKSPACE_TA = "cloud_bees:apps:default_dropdown_select_workspace"

  CONFIRM_NEW_COMPONENT_PROCESS_IL = "//div[text()='OK']"
  CONFIRM_NEW_COMPONENT_PROCESS_TA = 'cloud_bees:apps:confirm_new_component_process'

  NEW_STEP_IL = "//div[@class='step-footer at-define-step-btn']"
  NEW_STEP_TA = 'cloud_bees:apps:new_step'

  STEP_NAME_IL = "//input[@class='Form__input at-react-form-txt-input']"
  STEP_NAME_TA = 'cloud_bees:apps:step_name'

  STEP_NEXT_IL = "//div[text()='Next']"
  STEP_NEXT_TA = 'cloud_bees:apps:step_next'

  STEP_TYPE_COMMAND_IL = "//span[text()='Command']"
  STEP_TYPE_COMMAND_TA = 'cloud_bees:apps:step_type_command'

  COMMAND_TEXTAREA_IL = "//textarea[@class='Form__textarea at-react-form-textarea']"
  COMMAND_TEXTAREA_TA = 'cloud_bees:apps:command_textarea'

  CONFIRM_DEFINE_STEP_IL = "//div[text()='OK']"
  CONFIRM_DEFINE_STEP_TA = 'cloud_bees:apps:confirm_define_step'

  HUMBURGER_OF_COMPONENT_STEP_IL = '.at-show-step-menu-btn'
  HUMBURGER_OF_COMPONENT_STEP_TA = 'cloud_bees:apps:humburger_of_component_step'

  DELETE_COMPONENT_STEP_IL = "//div[text()='Delete']"
  DELETE_COMPONENT_STEP_TA = 'cloud_bees:apps:delete_component_step'

  CONFIRM_DELETE_COMPONENT_STEP_IL = "//div[text()='OK']"
  CONFIRM_DELETE_COMPONENT_STEP_TA = 'cloud_bees:apps:confirm_delete_component_step'


  def select_application_from_list(key = nil)
    find_element(key, il_type: :xpath, tl: APPLICATION_FROM_LIST_TA, il: APPLICATION_FROM_LIST_IL).click
  end

  def click_new_application(key = nil)
    find_element(key, il_type: :xpath, tl: NEW_APPLICATION_BTN_TA, il: NEW_APPLICATION_BTN_IL).click
  end

  def create_new_application(key = nil)
    find_element(key, il_type: :xpath, tl: CREATE_NEW_APPLICATION_TA, il: CREATE_NEW_APPLICATION_IL).click
  end

  def fill_application_name_field(key = nil, appname)
    find_element(key, il_type: :xpath, tl: APPLICATION_NAME_TA, il: APPLICATION_NAME_IL).set(appname)
  end

  def click_on_select_project(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_PROJECT_TA, il: SELECT_PROJECT_IL).click
  end

  def select_default_project(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_DEFAULT_PROJECT_TA, il: SELECT_DEFAULT_PROJECT_IL).click
  end

  def confirm_create_new_application(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_NEW_APPLICATION_TA, il: CONFIRM_NEW_APPLICATION_IL).click
  end

  def click_component_tier(key = nil)
    find_element(key, il_type: :xpath, tl: COMPONENT_TIER_TA, il: COMPONENT_TIER_IL).click
  end

  def create_new_component(key = nil)
    find_element(key, il_type: :xpath, tl: CREATE_NEW_COMPONENT_TA, il: CREATE_NEW_COMPONENT_IL).click
  end

  def fill_component_name_field(key = nil, compname)
    find_element(key, il_type: :xpath, tl: COMPONENT_NAME_TA, il: COMPONENT_NAME_IL).set(compname)
  end

  def click_component_next(key = nil)
    find_element(key, il_type: :xpath, tl: COMPONENT_NEXT_TA, il: COMPONENT_NEXT_IL).click
  end

  def click_on_content_location(key = nil)
    find_element(key, il_type: :xpath, tl: CONTENT_LOCATION_TA, il: CONTENT_LOCATION_IL).click
  end

  def select_ec_artifact(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_EC_ARTIFACT_TA, il: SELECT_EC_ARTIFACT_IL).click
  end

  def fill_artifact_name_field(key = nil, artname)
    find_element(key, il_type: :xpath, tl: ARTIFACT_NAME_TA, il: ARTIFACT_NAME_IL).set(artname)
  end

  def confirm_new_artifact(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_NEW_ARTIFACT_TA, il: CONFIRM_NEW_ARTIFACT_IL).click
  end

  def find_application_name_field(key = nil, appname)
    find_element(key, il_type: :css, tl: FIND_APPLICATION_FIELD_TA, il: FIND_APPLICATION_FIELD_IL).set(appname)
  end

  def select_app_list_item(key = nil)
    find_element(key, il_type: :css, tl: APPLICATION_LIST_ITEM_TA, il: APPLICATION_LIST_ITEM_IL).click
  end

  def delete_application(key = nil)
    find_element(key, il_type: :xpath, tl: DELETE_APPLICATION_TA, il: DELETE_APPLICATION_IL).click
  end

  def confirm_delete_application(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_DELETE_APPLICATION_TA, il: CONFIRM_DELETE_APPLICATION_IL).click
  end

  def create_existing_master_component(key = nil)
    find_element(key, il_type: :xpath, tl: CREATE_EXISTING_MASTER_COMPONENT_TA, il: CREATE_EXISTING_MASTER_COMPONENT_IL).click
  end

  def choose_jbossmc_component(key = nil)
    find_element(key, il_type: :xpath, tl: COMPONENT_JBOSSMC_TA, il: COMPONENT_JBOSSMC_IL).click
  end

  def click_on_checkbox_near_jbossmc(key = nil)
    find_element(key, il_type: :xpath, tl: CHECKBOX_NEAR_JBOSSMC_TA, il: CHECKBOX_NEAR_JBOSSMC_IL).click
  end

  def close_attention_in_component(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_ATTENTION_IN_COMPONENT_TA, il: CLOSE_ATTENTION_IN_COMPONENT_IL).click
  end

  def component_existing_master_next(key = nil)
    find_element(key, il_type: :xpath, tl: COMPONENT_EXISTING_MASTER_NEXT_TA, il: COMPONENT_EXISTING_MASTER_NEXT_IL).click
  end

  def click_component_ok(key = nil)
    find_element(key, il_type: :xpath, tl: COMPONENT_OK_BTN_TA, il: COMPONENT_OK_BTN_IL).click
  end

  def click_on_dropdown_in_tier(key = nil)
    find_element(key, il_type: :xpath, tl: DROPDOWN_IN_TIER_TA, il: DROPDOWN_IN_TIER_IL).click
  end

  def click_on_new_component_processes(key = nil)
    find_element(key, il_type: :css, tl: NEW_COMPONENT_PROCESSES_TA, il: NEW_COMPONENT_PROCESSES_IL).click
  end

  def create_new_component_processes(key = nil)
    find_element(key, il_type: :xpath, tl: CREATE_NEW_COMPONENT_PROCESSES_TA, il: CREATE_NEW_COMPONENT_PROCESSES_IL).click
  end

  def fill_process_name_field(key = nil, processname)
    find_element(key, il_type: :xpath, tl: PROCESS_NAME_TA, il: PROCESS_NAME_IL).set(processname)
  end

  def click_on_dropdown_deploy_undeploy(key = nil)
    find_element(key, il_type: :xpath, tl: DROPDOWN_DEPLOY_UNDEPLOY_TA, il: DROPDOWN_DEPLOY_UNDEPLOY_IL).click
  end

  def click_on_dropdown_undeploy(key = nil)
    find_element(key, il_type: :xpath, tl: DROPDOWN_UNDEPLOY_TA, il: DROPDOWN_UNDEPLOY_IL).click
  end

  def click_on_dropdown_select_workspace(key = nil)
    find_element(key, il_type: :xpath, tl: DROPDOWN_SELECT_WORKSPACE_TA, il: DROPDOWN_SELECT_WORKSPACE_IL).click
  end

  def click_default_dropdown_select_workspace(key = nil)
    find_element(key, il_type: :xpath, tl: DEFAULT_DROPDOWN_SELECT_WORKSPACE_TA, il: DEFAULT_DROPDOWN_SELECT_WORKSPACE_IL).click
  end

  def confirm_new_component_process(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_NEW_COMPONENT_PROCESS_TA, il: CONFIRM_NEW_COMPONENT_PROCESS_IL).click
  end

  def click_on_new_step(key = nil)
    find_element(key, il_type: :xpath, tl: NEW_STEP_TA, il: NEW_STEP_IL).click
  end

  def fill_step_name_field(key = nil, stepname)
    find_element(key, il_type: :xpath, tl: STEP_NAME_TA, il: STEP_NAME_IL).set(stepname)
  end

  def click_on_next_step(key = nil)
    find_element(key, il_type: :xpath, tl: STEP_NEXT_TA, il: STEP_NEXT_IL).click
  end

  def click_on_command_step_type(key = nil)
    find_element(key, il_type: :xpath, tl: STEP_TYPE_COMMAND_TA, il: STEP_TYPE_COMMAND_IL).click
  end

  def fill_command_name_field(key = nil, commandname)
    find_element(key, il_type: :xpath, tl: COMMAND_TEXTAREA_TA, il: COMMAND_TEXTAREA_IL).set(commandname)
  end

  def confirm_define_step(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_DEFINE_STEP_TA, il: CONFIRM_DEFINE_STEP_IL).click
  end

  def click_on_humburger_component_step(key = nil)
    find_element(key, il_type: :css, tl: HUMBURGER_OF_COMPONENT_STEP_TA, il: HUMBURGER_OF_COMPONENT_STEP_IL).click
  end

  def delete_component_step(key = nil)
    find_element(key, il_type: :xpath, tl: DELETE_COMPONENT_STEP_TA, il: DELETE_COMPONENT_STEP_IL).click
  end

  def confirm_delete_component_step(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_DELETE_COMPONENT_STEP_TA, il: CONFIRM_DELETE_COMPONENT_STEP_IL).click
  end

end