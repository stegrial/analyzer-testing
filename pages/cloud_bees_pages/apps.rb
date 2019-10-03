require 'spec_helper'

class CloudBeesApps
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  APPLICATION_FROM_LIST_IL = "//a[@title='app_with_artifacts_gwt_field(scope)']"
  APPLICATION_FROM_LIST_TA = "cloud_bees:apps:application_from_list"
  APPLICATION_FROM_LIST_EP = "EP:cloud_bees:apps:application_from_list"

  NEW_APPLICATION_BTN_IL = "//div[text()='New']"
  NEW_APPLICATION_BTN_TA = 'cloud_bees:apps:new_application'
  NEW_APPLICATION_BTN_EP = 'EP:cloud_bees:apps:new_application'

  CREATE_NEW_APPLICATION_IL = "//div[@class='object-create__type' and text()='Create New...']"
  CREATE_NEW_APPLICATION_TA = 'cloud_bees:apps:create_new_application'
  CREATE_NEW_APPLICATION_EP = 'EP:cloud_bees:apps:create_new_application'

  APPLICATION_NAME_IL = "//input[@class='Form__input at-app-name-input']"
  APPLICATION_NAME_TA = 'cloud_bees:apps:application_name'
  APPLICATION_NAME_EP = 'EP:cloud_bees:apps:application_name'

  SELECT_PROJECT_IL = "//div[text()='Select Project']"
  SELECT_PROJECT_TA = 'cloud_bees:apps:select_project'
  SELECT_PROJECT_EP = 'EP:cloud_bees:apps:select_project'

  SELECT_DEFAULT_PROJECT_IL = "//div[@title='Default' and contains(@class, 'ec-project-select-picker__option')]"
  SELECT_DEFAULT_PROJECT_TA = 'cloud_bees:apps:select_default_project'
  SELECT_DEFAULT_PROJECT_EP = 'EP:cloud_bees:apps:select_default_project'

  CONFIRM_NEW_APPLICATION_IL = "//div[text()='OK']"
  CONFIRM_NEW_APPLICATION_TA = 'cloud_bees:apps:confirm_new_application'
  CONFIRM_NEW_APPLICATION_EP = 'EP:cloud_bees:apps:confirm_new_application'

  COMPONENT_TIER_IL = "//div[@class='tier at-starting-tier']"
  COMPONENT_TIER_TA = 'cloud_bees:apps:component_tier'
  COMPONENT_TIER_EP = 'EP:cloud_bees:apps:component_tier'

  CREATE_NEW_COMPONENT_IL = "//div[@class='object-create__type']//span[text()='Create New...']"
  CREATE_NEW_COMPONENT_TA = 'cloud_bees:apps:create_new_component'
  CREATE_NEW_COMPONENT_EP = 'EP:cloud_bees:apps:create_new_component'

  COMPONENT_NAME_IL = "//input[@class='Form__input at-component-name-input']"
  COMPONENT_NAME_TA = 'cloud_bees:apps:component_name'
  COMPONENT_NAME_EP = 'EP:cloud_bees:apps:component_name'

  COMPONENT_NEXT_IL = "//div[text()='Next']"
  COMPONENT_NEXT_TA = 'cloud_bees:apps:component_next'
  COMPONENT_NEXT_EP = 'EP:cloud_bees:apps:component_next'

  CONTENT_LOCATION_IL = "//div[text()='Content location']"
  CONTENT_LOCATION_TA = 'cloud_bees:apps:content_location'
  CONTENT_LOCATION_EP = 'EP:cloud_bees:apps:content_location'

  SELECT_EC_ARTIFACT_IL = "//span[text()='EC-Artifact']"
  SELECT_EC_ARTIFACT_TA = 'cloud_bees:apps:select_ec_artifact'
  SELECT_EC_ARTIFACT_EP = 'EP:cloud_bees:apps:select_ec_artifact'

  ARTIFACT_NAME_IL = "//input[@class='gwt-SuggestBox GAMBAOGN-']"
  ARTIFACT_NAME_TA = 'cloud_bees:apps:artifact_name'
  ARTIFACT_NAME_EP = 'EP:cloud_bees:apps:artifact_name'

  CONFIRM_NEW_ARTIFACT_IL = "//div[text()='OK']"
  CONFIRM_NEW_ARTIFACT_TA = 'cloud_bees:apps:confirm_new_artifact'
  CONFIRM_NEW_ARTIFACT_EP = 'EP:cloud_bees:apps:confirm_new_artifact'

  FIND_APPLICATION_FIELD_IL = ".control-bar-container input[placeholder='Find...']"
  FIND_APPLICATION_FIELD_TA = 'cloud_bees:apps:find_application_field'
  FIND_APPLICATION_FIELD_EP = 'EP:cloud_bees:apps:find_application_field'

  CHOOSE_APPLICATION_IL = "//div[contains(@class, 'object at-application-list') and .//a[@title='appName']]"
  CHOOSE_APPLICATION_TA = 'cloud_bees:apps:choose_application'
  CHOOSE_APPLICATION_EP = 'EP:cloud_bees:apps:choose_application'

  APPLICATION_LIST_ITEM_IL = ".at-application-list-item"
  APPLICATION_LIST_ITEM_TA = 'cloud_bees:apps:application_list_item'
  APPLICATION_LIST_ITEM_EP = 'EP:cloud_bees:apps:application_list_item'

  DELETE_APPLICATION_IL = "//span[text()='Delete']"
  DELETE_APPLICATION_TA = 'cloud_bees:apps:delete_application'
  DELETE_APPLICATION_EP = 'EP:cloud_bees:apps:delete_application'

  CONFIRM_DELETE_APPLICATION_IL = "//div[text()='OK']"
  CONFIRM_DELETE_APPLICATION_TA = 'cloud_bees:apps:confirm_delete_application'
  CONFIRM_DELETE_APPLICATION_EP = 'EP:cloud_bees:apps:confirm_delete_application'

  CREATE_EXISTING_MASTER_COMPONENT_IL = "//div[./span[contains(.,'Existing Master Component')]]"
  CREATE_EXISTING_MASTER_COMPONENT_TA = 'cloud_bees:apps:existing_master_component'
  CREATE_EXISTING_MASTER_COMPONENT_EP = 'EP:cloud_bees:apps:existing_master_component'

  COMPONENT_JBOSSMC_IL = "//span[text()='JBossMC']"
  COMPONENT_JBOSSMC_TA = 'cloud_bees:apps:component_jbossmc'
  COMPONENT_JBOSSMC_EP = 'EP:cloud_bees:apps:component_jbossmc'

  CHECKBOX_NEAR_JBOSSMC_IL = "//div[@title='JBossMC']//following-sibling::div//span[@title='Use Master Component']"
  CHECKBOX_NEAR_JBOSSMC_TA = 'cloud_bees:apps:checkbox_near_jbossmc'
  CHECKBOX_NEAR_JBOSSMC_EP = 'EP:cloud_bees:apps:checkbox_near_jbossmc'

  CLOSE_ATTENTION_IN_COMPONENT_IL = "//div[@class='sds-icon remove at-close-attention']"
  CLOSE_ATTENTION_IN_COMPONENT_TA = 'cloud_bees:apps:close_attention_in_component'
  CLOSE_ATTENTION_IN_COMPONENT_EP = 'EP:cloud_bees:apps:close_attention_in_component'

  COMPONENT_EXISTING_MASTER_NEXT_IL = "//div[text()='Next']"
  COMPONENT_EXISTING_MASTER_NEXT_TA = 'cloud_bees:apps:component_existing_master_next'
  COMPONENT_EXISTING_MASTER_NEXT_EP = 'EP:cloud_bees:apps:component_existing_master_next'

  COMPONENT_OK_BTN_IL = "//div[text()='OK']"
  COMPONENT_OK_BTN_TA = 'cloud_bees:apps:component_ok_btn'
  COMPONENT_OK_BTN_EP = 'EP:cloud_bees:apps:component_ok_btn'

  DROPDOWN_IN_TIER_IL = "//span[@title='Component Processes']"
  DROPDOWN_IN_TIER_TA = 'cloud_bees:apps:dropdown_in_tier'
  DROPDOWN_IN_TIER_EP = 'EP:cloud_bees:apps:dropdown_in_tier'

  NEW_COMPONENT_PROCESSES_IL = '.sds-svg-icon__wrapper--icon-component-process-add'
  NEW_COMPONENT_PROCESSES_TA = 'cloud_bees:apps:new_component_processes'
  NEW_COMPONENT_PROCESSES_EP = 'EP:cloud_bees:apps:new_component_processes'

  CREATE_NEW_COMPONENT_PROCESSES_IL = "//div[text()='Create New...']"
  CREATE_NEW_COMPONENT_PROCESSES_TA = 'cloud_bees:apps:create_new_component_processes'
  CREATE_NEW_COMPONENT_PROCESSES_EP = 'EP:cloud_bees:apps:create_new_component_processes'

  PROCESS_NAME_IL = "//input[@class='Form__input at-process-name-input at-react-form-txt-input']"
  PROCESS_NAME_TA = 'cloud_bees:apps:process_name_field'
  PROCESS_NAME_EP = 'EP:cloud_bees:apps:process_name_field'

  DROPDOWN_DEPLOY_UNDEPLOY_IL = "(//div[@class='at-select-header-title ec-select-header-title'])[1]"
  DROPDOWN_DEPLOY_UNDEPLOY_TA = 'cloud_bees:apps:dropdown_deploy_undeploy'
  DROPDOWN_DEPLOY_UNDEPLOY_EP = 'EP:cloud_bees:apps:dropdown_deploy_undeploy'

  DROPDOWN_UNDEPLOY_IL = "//div[@class='ec-select-option at-select-option at-select-option-2']"
  DROPDOWN_UNDEPLOY_TA = 'cloud_bees:apps:dropdown_undeploy'
  DROPDOWN_UNDEPLOY_EP = 'EP:cloud_bees:apps:dropdown_undeploy'

  DROPDOWN_SELECT_WORKSPACE_IL = "(//div[@class='at-select-header-title ec-select-header-title'])[2]"
  DROPDOWN_SELECT_WORKSPACE_TA = 'cloud_bees:apps:dropdown_select_workspace'
  DROPDOWN_SELECT_WORKSPACE_EP = 'EP:cloud_bees:apps:dropdown_select_workspace'

  DEFAULT_DROPDOWN_SELECT_WORKSPACE_IL = "//span[@title='default']"
  DEFAULT_DROPDOWN_SELECT_WORKSPACE_TA = "cloud_bees:apps:default_dropdown_select_workspace"
  DEFAULT_DROPDOWN_SELECT_WORKSPACE_EP = "EP:cloud_bees:apps:default_dropdown_select_workspace"

  CONFIRM_NEW_COMPONENT_PROCESS_IL = "//div[text()='OK']"
  CONFIRM_NEW_COMPONENT_PROCESS_TA = 'cloud_bees:apps:confirm_new_component_process'
  CONFIRM_NEW_COMPONENT_PROCESS_EP = 'EP:cloud_bees:apps:confirm_new_component_process'

  NEW_STEP_IL = "//div[@class='step-footer at-define-step-btn']"
  NEW_STEP_TA = 'cloud_bees:apps:new_step'
  NEW_STEP_EP = 'EP:cloud_bees:apps:new_step'

  STEP_NAME_IL = "//input[@class='Form__input at-react-form-txt-input']"
  STEP_NAME_TA = 'cloud_bees:apps:step_name'
  STEP_NAME_EP = 'EP:cloud_bees:apps:step_name'

  STEP_NEXT_IL = "//div[text()='Next']"
  STEP_NEXT_TA = 'cloud_bees:apps:step_next'
  STEP_NEXT_EP = 'EP:cloud_bees:apps:step_next'

  STEP_TYPE_COMMAND_IL = "//span[text()='Command']"
  STEP_TYPE_COMMAND_TA = 'cloud_bees:apps:step_type_command'
  STEP_TYPE_COMMAND_EP = 'EP:cloud_bees:apps:step_type_command'

  COMMAND_TEXTAREA_IL = "//textarea[@class='Form__textarea at-react-form-textarea']"
  COMMAND_TEXTAREA_TA = 'cloud_bees:apps:command_textarea'
  COMMAND_TEXTAREA_EP = 'EP:cloud_bees:apps:command_textarea'

  CONFIRM_DEFINE_STEP_IL = "//div[text()='OK']"
  CONFIRM_DEFINE_STEP_TA = 'cloud_bees:apps:confirm_define_step'
  CONFIRM_DEFINE_STEP_EP = 'EP:cloud_bees:apps:confirm_define_step'

  HUMBURGER_OF_COMPONENT_STEP_IL = '.at-show-step-menu-btn'
  HUMBURGER_OF_COMPONENT_STEP_TA = 'cloud_bees:apps:humburger_of_component_step'
  HUMBURGER_OF_COMPONENT_STEP_EP = 'EP:cloud_bees:apps:humburger_of_component_step'

  DELETE_COMPONENT_STEP_IL = "//div[text()='Delete']"
  DELETE_COMPONENT_STEP_TA = 'cloud_bees:apps:delete_component_step'
  DELETE_COMPONENT_STEP_EP = 'EP:cloud_bees:apps:delete_component_step'

  CONFIRM_DELETE_COMPONENT_STEP_IL = "//div[text()='OK']"
  CONFIRM_DELETE_COMPONENT_STEP_TA = 'cloud_bees:apps:confirm_delete_component_step'
  CONFIRM_DELETE_COMPONENT_STEP_EP = 'EP:cloud_bees:apps:confirm_delete_component_step'


  def select_application_from_list(key = nil)
    return find(ta(APPLICATION_FROM_LIST_EP)).click if key == :ep
    return find(:xpath, APPLICATION_FROM_LIST_IL).click if key == :il
    find(:xpath, ta(APPLICATION_FROM_LIST_TA, APPLICATION_FROM_LIST_IL)).click
  end

  def click_new_application(key = nil)
    return find(ta(NEW_APPLICATION_BTN_EP)).click if key == :ep
    return find(:xpath, NEW_APPLICATION_BTN_IL).click if key == :il
    find(:xpath, ta(NEW_APPLICATION_BTN_TA, NEW_APPLICATION_BTN_IL)).click
  end

  def create_new_application(key = nil)
    return find(ta(CREATE_NEW_APPLICATION_EP)).click if key == :ep
    return find(:xpath, CREATE_NEW_APPLICATION_IL).click if key == :il
    find(:xpath, ta(CREATE_NEW_APPLICATION_TA, CREATE_NEW_APPLICATION_IL)).click
  end

  def fill_application_name_field(key = nil, appname)
    return find(ta(APPLICATION_NAME_EP)).set(appname) if key == :ep
    return find(:xpath, APPLICATION_NAME_IL).set(appname) if key == :il
    find(:xpath, ta(APPLICATION_NAME_TA, APPLICATION_NAME_IL)).set(appname)
  end

  def click_on_select_project(key = nil)
    return find(ta(SELECT_PROJECT_EP)).click if key == :ep
    return find(:xpath, SELECT_PROJECT_IL).click if key == :il
    find(:xpath, ta(SELECT_PROJECT_TA, SELECT_PROJECT_IL)).click
  end

  def select_default_project(key = nil)
    return find(ta(SELECT_DEFAULT_PROJECT_EP)).click if key == :ep
    return find(:xpath, SELECT_DEFAULT_PROJECT_IL).click if key == :il
    find(:xpath, ta(SELECT_DEFAULT_PROJECT_TA, SELECT_DEFAULT_PROJECT_IL)).click
  end

  def confirm_create_new_application(key = nil)
    return find(ta(CONFIRM_NEW_APPLICATION_EP)).click if key == :ep
    return find(:xpath, CONFIRM_NEW_APPLICATION_IL).click if key == :il
    find(:xpath, ta(CONFIRM_NEW_APPLICATION_TA, CONFIRM_NEW_APPLICATION_IL)).click
  end

  def click_component_tier(key = nil)
    return find(ta(COMPONENT_TIER_EP)).click if key == :ep
    return find(:xpath, COMPONENT_TIER_IL).click if key == :il
    find(:xpath, ta(COMPONENT_TIER_TA, COMPONENT_TIER_IL)).click
  end

  def create_new_component(key = nil)
    return find(ta(CREATE_NEW_COMPONENT_EP)).click if key == :ep
    return find(:xpath, CREATE_NEW_COMPONENT_IL).click if key == :il
    find(:xpath, ta(CREATE_NEW_COMPONENT_TA, CREATE_NEW_COMPONENT_IL)).click
  end

  def fill_component_name_field(key = nil, compname)
    return find(ta(COMPONENT_NAME_EP)).set(compname) if key == :ep
    return find(:xpath, COMPONENT_NAME_IL).set(compname) if key == :il
    find(:xpath, ta(COMPONENT_NAME_TA, COMPONENT_NAME_IL)).set(compname)
  end

  def click_component_next(key = nil)
    return find(ta(COMPONENT_NEXT_EP)).click if key == :ep
    return find(:xpath, COMPONENT_NEXT_IL).click if key == :il
    find(:xpath, ta(COMPONENT_NEXT_TA, COMPONENT_NEXT_IL)).click
  end

  def click_on_content_location(key = nil)
    return find(ta(CONTENT_LOCATION_EP)).click if key == :ep
    return find(:xpath, CONTENT_LOCATION_IL).click if key == :il
    find(:xpath, ta(CONTENT_LOCATION_TA, CONTENT_LOCATION_IL)).click
  end

  def select_ec_artifact(key = nil)
    return find(ta(SELECT_EC_ARTIFACT_EP)).click if key == :ep
    return find(:xpath, SELECT_EC_ARTIFACT_IL).click if key == :il
    find(:xpath, ta(SELECT_EC_ARTIFACT_TA, SELECT_EC_ARTIFACT_IL)).click
  end

  def fill_artifact_name_field(key = nil, artname)
    return find(ta(ARTIFACT_NAME_EP)).set(artname) if key == :ep
    return find(:xpath, ARTIFACT_NAME_IL).set(artname) if key == :il
    find(:xpath, ta(ARTIFACT_NAME_TA, ARTIFACT_NAME_IL)).set(artname)
  end

  def confirm_new_artifact(key = nil)
    return find(ta(CONFIRM_NEW_ARTIFACT_EP)).click if key == :ep
    return find(:xpath, CONFIRM_NEW_ARTIFACT_IL).click if key == :il
    find(:xpath, ta(CONFIRM_NEW_ARTIFACT_TA, CONFIRM_NEW_ARTIFACT_IL)).click
  end

  def find_application_name_field(key = nil, appname)
    return find(ta(FIND_APPLICATION_FIELD_EP)).set(appname) if key == :ep
    return find(:css, FIND_APPLICATION_FIELD_IL).set(appname) if key == :il
    find(:css, ta(FIND_APPLICATION_FIELD_TA, FIND_APPLICATION_FIELD_IL)).set(appname)
  end

  def select_app_list_item(key = nil)
    return find(ta(APPLICATION_LIST_ITEM_EP)).click if key == :ep
    return find(:css, APPLICATION_LIST_ITEM_IL).click if key == :il
    find(:css, ta(APPLICATION_LIST_ITEM_TA, APPLICATION_LIST_ITEM_IL)).click
  end

  def delete_application(key = nil)
    return find(ta(DELETE_APPLICATION_EP)).click if key == :ep
    return find(:xpath, DELETE_APPLICATION_IL).click if key == :il
    find(:xpath, ta(DELETE_APPLICATION_TA, DELETE_APPLICATION_IL)).click
  end

  def confirm_delete_application(key = nil)
    return find(ta(CONFIRM_DELETE_APPLICATION_EP)).click if key == :ep
    return find(:xpath, CONFIRM_DELETE_APPLICATION_IL).click if key == :il
    find(:xpath, ta(CONFIRM_DELETE_APPLICATION_TA, CONFIRM_DELETE_APPLICATION_IL)).click
  end

  def create_existing_master_component(key = nil)
    return find(ta(CREATE_EXISTING_MASTER_COMPONENT_EP)).click if key == :ep
    return find(:xpath, CREATE_EXISTING_MASTER_COMPONENT_IL).click if key == :il
    find(:xpath, ta(CREATE_EXISTING_MASTER_COMPONENT_TA, CREATE_EXISTING_MASTER_COMPONENT_IL)).click
  end

  def choose_jbossmc_component(key = nil)
    return find(ta(COMPONENT_JBOSSMC_EP)).click if key == :ep
    return find(:xpath, COMPONENT_JBOSSMC_IL).click if key == :il
    find(:xpath, ta(COMPONENT_JBOSSMC_TA, COMPONENT_JBOSSMC_IL)).click
  end

  def click_on_checkbox_near_jbossmc(key = nil)
    return find(ta(CHECKBOX_NEAR_JBOSSMC_EP)).click if key == :ep
    return find(:xpath, CHECKBOX_NEAR_JBOSSMC_IL).click if key == :il
    find(:xpath, ta(CHECKBOX_NEAR_JBOSSMC_TA, CHECKBOX_NEAR_JBOSSMC_IL)).click
  end

  def close_attention_in_component(key = nil)
    return find(ta(CLOSE_ATTENTION_IN_COMPONENT_EP)).click if key == :ep
    return find(:xpath, CLOSE_ATTENTION_IN_COMPONENT_IL).click if key == :il
    find(:xpath, ta(CLOSE_ATTENTION_IN_COMPONENT_TA, CLOSE_ATTENTION_IN_COMPONENT_IL)).click
  end

  def component_existing_master_next(key = nil)
    return find(ta(COMPONENT_EXISTING_MASTER_NEXT_EP)).click if key == :ep
    return find(:xpath, COMPONENT_EXISTING_MASTER_NEXT_IL).click if key == :il
    find(:xpath, ta(COMPONENT_EXISTING_MASTER_NEXT_TA, COMPONENT_EXISTING_MASTER_NEXT_IL)).click
  end

  def click_component_ok(key = nil)
    return find(ta(COMPONENT_OK_BTN_EP)).click if key == :ep
    return find(:xpath, COMPONENT_OK_BTN_IL).click if key == :il
    find(:xpath, ta(COMPONENT_OK_BTN_TA, COMPONENT_OK_BTN_IL)).click
  end

  def click_on_dropdown_in_tier(key = nil)
    return find(ta(DROPDOWN_IN_TIER_EP)).click if key == :ep
    return find(:xpath, DROPDOWN_IN_TIER_IL).click if key == :il
    find(:xpath, ta(DROPDOWN_IN_TIER_TA, DROPDOWN_IN_TIER_IL)).click
  end

  def click_on_new_component_processes(key = nil)
    return find(ta(NEW_COMPONENT_PROCESSES_EP)).click if key == :ep
    return find(:css, NEW_COMPONENT_PROCESSES_IL).click if key == :il
    find(:css, ta(NEW_COMPONENT_PROCESSES_TA, NEW_COMPONENT_PROCESSES_IL)).click
  end

  def create_new_component_processes(key = nil)
    return find(ta(CREATE_NEW_COMPONENT_PROCESSES_EP)).click if key == :ep
    return find(:xpath, CREATE_NEW_COMPONENT_PROCESSES_IL).click if key == :il
    find(:xpath, ta(CREATE_NEW_COMPONENT_PROCESSES_TA, CREATE_NEW_COMPONENT_PROCESSES_IL)).click
  end

  def fill_process_name_field(key = nil, processname)
    return find(ta(PROCESS_NAME_EP)).set(processname) if key == :ep
    return find(:xpath, PROCESS_NAME_IL).set(processname) if key == :il
    find(:xpath, ta(PROCESS_NAME_TA, PROCESS_NAME_IL)).set(processname)
  end

  def click_on_dropdown_deploy_undeploy(key = nil)
    return find(ta(DROPDOWN_DEPLOY_UNDEPLOY_EP)).click if key == :ep
    return find(:xpath, DROPDOWN_DEPLOY_UNDEPLOY_IL).click if key == :il
    find(:xpath, ta(DROPDOWN_DEPLOY_UNDEPLOY_TA, DROPDOWN_DEPLOY_UNDEPLOY_IL)).click
  end

  def click_on_dropdown_undeploy(key = nil)
    return find(ta(DROPDOWN_UNDEPLOY_EP)).click if key == :ep
    return find(:xpath, DROPDOWN_UNDEPLOY_IL).click if key == :il
    find(:xpath, ta(DROPDOWN_UNDEPLOY_TA, DROPDOWN_UNDEPLOY_IL)).click
  end

  def click_on_dropdown_select_workspace(key = nil)
    return find(ta(DROPDOWN_SELECT_WORKSPACE_EP)).click if key == :ep
    return find(:xpath, DROPDOWN_SELECT_WORKSPACE_IL).click if key == :il
    find(:xpath, ta(DROPDOWN_SELECT_WORKSPACE_TA, DROPDOWN_SELECT_WORKSPACE_IL)).click
  end

  def click_default_dropdown_select_workspace(key = nil)
    return find(ta(DEFAULT_DROPDOWN_SELECT_WORKSPACE_EP)).click if key == :ep
    return find(:xpath, DEFAULT_DROPDOWN_SELECT_WORKSPACE_IL).click if key == :il
    find(:xpath, ta(DEFAULT_DROPDOWN_SELECT_WORKSPACE_TA, DEFAULT_DROPDOWN_SELECT_WORKSPACE_IL)).click
  end

  def confirm_new_component_process(key = nil)
    return find(ta(CONFIRM_NEW_COMPONENT_PROCESS_EP)).click if key == :ep
    return find(:xpath, CONFIRM_NEW_COMPONENT_PROCESS_IL).click if key == :il
    find(:xpath, ta(CONFIRM_NEW_COMPONENT_PROCESS_TA, CONFIRM_NEW_COMPONENT_PROCESS_IL)).click
  end

  def click_on_new_step(key = nil)
    return find(ta(NEW_STEP_EP)).click if key == :ep
    return find(:xpath, NEW_STEP_IL).click if key == :il
    find(:xpath, ta(NEW_STEP_TA, NEW_STEP_IL)).click
  end

  def fill_step_name_field(key = nil, stepname)
    return find(ta(STEP_NAME_EP)).set(stepname) if key == :ep
    return find(:xpath, STEP_NAME_IL).set(stepname) if key == :il
    find(:xpath, ta(STEP_NAME_TA, STEP_NAME_IL)).set(stepname)
  end

  def click_on_next_step(key = nil)
    return find(ta(STEP_NEXT_EP)).click if key == :ep
    return find(:xpath, STEP_NEXT_IL).click if key == :il
    find(:xpath, ta(STEP_NEXT_TA, STEP_NEXT_IL)).click
  end

  def click_on_command_step_type(key = nil)
    return find(ta(STEP_TYPE_COMMAND_EP)).click if key == :ep
    return find(:xpath, STEP_TYPE_COMMAND_IL).click if key == :il
    find(:xpath, ta(STEP_TYPE_COMMAND_TA, STEP_TYPE_COMMAND_IL)).click
  end

  def fill_command_name_field(key = nil, commandname)
    return find(ta(COMMAND_TEXTAREA_EP)).set(commandname) if key == :ep
    return find(:xpath, COMMAND_TEXTAREA_IL).set(commandname) if key == :il
    find(:xpath, ta(COMMAND_TEXTAREA_TA, COMMAND_TEXTAREA_IL)).set(commandname)
  end

  def confirm_define_step(key = nil)
    return find(ta(CONFIRM_DEFINE_STEP_EP)).click if key == :ep
    return find(:xpath, CONFIRM_DEFINE_STEP_IL).click if key == :il
    find(:xpath, ta(CONFIRM_DEFINE_STEP_TA, CONFIRM_DEFINE_STEP_IL)).click
  end

  def click_on_humburger_component_step(key = nil)
    return find(ta(HUMBURGER_OF_COMPONENT_STEP_EP)).click if key == :ep
    return find(:css, HUMBURGER_OF_COMPONENT_STEP_IL).click if key == :il
    find(:css, ta(HUMBURGER_OF_COMPONENT_STEP_TA, HUMBURGER_OF_COMPONENT_STEP_IL)).click
  end

  def delete_component_step(key = nil)
    return find(ta(DELETE_COMPONENT_STEP_EP)).click if key == :ep
    return find(:xpath, DELETE_COMPONENT_STEP_IL).click if key == :il
    find(:xpath, ta(DELETE_COMPONENT_STEP_TA, DELETE_COMPONENT_STEP_IL)).click
  end

  def confirm_delete_component_step(key = nil)
    return find(ta(CONFIRM_DELETE_COMPONENT_STEP_EP)).click if key == :ep
    return find(:xpath, CONFIRM_DELETE_COMPONENT_STEP_IL).click if key == :il
    find(:xpath, ta(CONFIRM_DELETE_COMPONENT_STEP_TA, CONFIRM_DELETE_COMPONENT_STEP_IL)).click
  end

end