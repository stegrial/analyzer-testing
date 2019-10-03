require 'spec_helper'

class CloudBeesPipelines
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  CHOOSE_PIPELINE_TA866_IL = "//div/a[@title='pipelineTA-866']"
  CHOOSE_PIPELINE_TA866_TA = "cloud_bees:pipeline:choose_pipeline_ta866"
  CHOOSE_PIPELINE_TA866_EP = "EP:cloud_bees:pipeline:choose_pipeline_ta866"

  NEW_PIPELINE_BTN_IL = "//div[text()='New']"
  NEW_PIPELINE_BTN_TA = 'cloud_bees:pipeline:new_pipeline'
  NEW_PIPELINE_BTN_EP = 'EP:cloud_bees:pipeline:new_pipeline'

  CREATE_NEW_PIPELINE_IL = "//div[@class='object-create__type' and text()='Create New...']"
  CREATE_NEW_PIPELINE_TA = 'cloud_bees:pipeline:create_new_pipeline'
  CREATE_NEW_PIPELINE_EP = 'EP:cloud_bees:pipeline:create_new_pipeline'

  PIPELINE_NAME_IL = "//input[@class='Form__input at-pipeline-name-input']"
  PIPELINE_NAME_TA = 'cloud_bees:pipeline:pipeline_name'
  PIPELINE_NAME_EP = 'EP:cloud_bees:pipeline:pipeline_name'

  SELECT_PROJECT_IL = "//div[text()='Select Project']"
  SELECT_PROJECT_TA = 'cloud_bees:pipeline:select_project'
  SELECT_PROJECT_EP = 'EP:cloud_bees:pipeline:select_project'

  SELECT_DEFAULT_PROJECT_IL = "//div[@title='Default' and contains(@class, 'ec-project-select-picker__option')]"
  SELECT_DEFAULT_PROJECT_TA = 'cloud_bees:pipeline:select_default_project'
  SELECT_DEFAULT_PROJECT_EP = 'EP:cloud_bees:pipeline:select_default_project'

  CONFIRM_NEW_PIPELINE_IL = "//div[text()='OK']"
  CONFIRM_NEW_PIPELINE_TA = 'cloud_bees:pipeline:confirm_new_pipeline'
  CONFIRM_NEW_PIPELINE_EP = 'EP:cloud_bees:pipeline:confirm_new_pipeline'

  NEW_TASK_BTN_IL = "//button[text()='Add']"
  NEW_TASK_BTN_TA = 'cloud_bees:pipeline:new_task'
  NEW_TASK_BTN_EP = 'EP:cloud_bees:pipeline:new_task'

  TASK_NAME_IL = "//input[@class='pipeline-kanban__input at-pipeline-kanban-form-input at-pipeline-kanban-form-input-0']"
  TASK_NAME_TA = 'cloud_bees:pipeline:task_name'
  TASK_NAME_EP = 'EP:cloud_bees:pipeline:task_name'

  SELECT_TASK_TYPE_IL = "//button[text()='Select Task Type']"
  SELECT_TASK_TYPE_TA = 'cloud_bees:pipeline:select_task_type'
  SELECT_TASK_TYPE_EP = 'EP:cloud_bees:pipeline:select_task_type'

  MANUAL_TASK_TYPE_IL = "//span[text()='Manual']"
  MANUAL_TASK_TYPE_TA = 'cloud_bees:pipeline:manual_task_type'
  MANUAL_TASK_TYPE_EP = 'EP:cloud_bees:pipeline:manual_task_type'

  CONFIRM_NEW_TASK_IL = "//button[text()='Done']"
  CONFIRM_NEW_TASK_TA = 'cloud_bees:pipeline:confirm_new_task'
  CONFIRM_NEW_TASK_EP = 'EP:cloud_bees:pipeline:confirm_new_task'

  FIND_PIPELINE_FIELD_IL = "//input[@class='sds-input search-collapsable__search-input at-search-collapsable-input']"
  FIND_PIPELINE_FIELD_TA = 'cloud_bees:pipeline:find_pipeline_field'
  FIND_PIPELINE_FIELD_EP = 'EP:cloud_bees:pipeline:find_pipeline_field'

  PIPELINE_LIST_ITEM_IL = ".at-object-list-row"
  PIPELINE_LIST_ITEM_TA = 'cloud_bees:pipeline:pipeline_list_item'
  PIPELINE_LIST_ITEM_EP = 'EP:cloud_bees:pipeline:pipeline_list_item'

  DELETE_PIPELINE_IL = "//span[text()='Delete']"
  DELETE_PIPELINE_TA = 'cloud_bees:pipeline:delete_pipeline'
  DELETE_PIPELINE_EP = 'EP:cloud_bees:pipeline:delete_pipeline'

  CONFIRM_DELETE_PIPELINE_IL = "//div[text()='OK']"
  CONFIRM_DELETE_PIPELINE_TA = 'cloud_bees:pipeline:confirm_delete_pipeline'
  CONFIRM_DELETE_PIPELINE_EP = 'EP:cloud_bees:pipeline:confirm_delete_pipeline'

  RUN_PIPELINE_BTN_IL = "//div[@class='object__action object__button object__button--run']"
  RUN_PIPELINE_BTN_TA = 'cloud_bees:pipeline:run_pipeline_btn'
  RUN_PIPELINE_BTN_EP = 'EP:cloud_bees:pipeline:run_pipeline_btn'

  NEW_RUN_PIPELINE_BTN_IL = "//div[text()='New Run']"
  NEW_RUN_PIPELINE_BTN_TA = 'cloud_bees:pipeline:new_run_pipeline_btn'
  NEW_RUN_PIPELINE_BTN_EP = 'EP:cloud_bees:pipeline:new_run_pipeline_btn'

  CONFIRM_RUN_PIPELINE_IL = "//div[text()='Run' and @class='at-pipeline-release-run-btn ec-wizard-btn ec-ok at-ok-btn']"
  CONFIRM_RUN_PIPELINE_TA = 'cloud_bees:pipeline:confirm_run_pipeline'
  CONFIRM_RUN_PIPELINE_EP = 'EP:cloud_bees:pipeline:confirm_run_pipeline'

  RESPONSE_REQUIRED_BNT_IL = "//div[text()='Response required']"
  RESPONSE_REQUIRED_BNT_TA = 'cloud_bees:pipeline:response_required_btn'
  RESPONSE_REQUIRED_BNT_EP = 'EP:cloud_bees:pipeline:response_required_btn'

  MANUAL_TASK_IL = "//div[@class='run-app-manual-approvals__item-name']"
  MANUAL_TASK_TA = 'cloud_bees:pipeline:manual_task'
  MANUAL_TASK_EP = 'EP:cloud_bees:pipeline:manual_task'

  COMPLETED_RADIO_BTN_IL = "//div[text()='Completed']"
  COMPLETED_RADIO_BTN_TA = 'cloud_bees:pipeline:completed_radio_btn'
  COMPLETED_RADIO_BTN_EP = 'EP:cloud_bees:pipeline:completed_radio_btn'

  CONFIRM_COMPLETED_TASK_IL = "//div[text()='OK']"
  CONFIRM_COMPLETED_TASK_TA = 'cloud_bees:pipeline:confirm_completed_task'
  CONFIRM_COMPLETED_TASK_EP = 'EP:cloud_bees:pipeline:confirm_completed_task'

  def choose_pipeline_ta866_from_list(key = nil)
    return find(ta(CHOOSE_PIPELINE_TA866_EP)).click if key == :ep
    return find(:xpath, CHOOSE_PIPELINE_TA866_IL).click if key == :il
    find(:xpath, ta(CHOOSE_PIPELINE_TA866_TA, CHOOSE_PIPELINE_TA866_IL)).click
  end

  def click_new_pipeline(key = nil)
    return find(ta(NEW_PIPELINE_BTN_EP)).click if key == :ep
    return find(:xpath, NEW_PIPELINE_BTN_IL).click if key == :il
    find(:xpath, ta(NEW_PIPELINE_BTN_TA, NEW_PIPELINE_BTN_IL)).click
  end

  def create_new_pipeline(key = nil)
    return find(ta(CREATE_NEW_PIPELINE_EP)).click if key == :ep
    return find(:xpath, CREATE_NEW_PIPELINE_IL).click if key == :il
    find(:xpath, ta(CREATE_NEW_PIPELINE_TA, CREATE_NEW_PIPELINE_IL)).click
  end

  def fill_pipeline_name_field(key = nil, pipename)
    return find(ta(PIPELINE_NAME_EP)).set(pipename) if key == :ep
    return find(:xpath, PIPELINE_NAME_IL).set(pipename) if key == :il
    find(:xpath, ta(PIPELINE_NAME_TA, PIPELINE_NAME_IL)).set(pipename)
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

  def confirm_create_new_pipeline(key = nil)
    return find(ta(CONFIRM_NEW_PIPELINE_EP)).click if key == :ep
    return find(:xpath, CONFIRM_NEW_PIPELINE_IL).click if key == :il
    find(:xpath, ta(CONFIRM_NEW_PIPELINE_TA, CONFIRM_NEW_PIPELINE_IL)).click
  end

  def click_new_task(key = nil)
    return find(ta(NEW_TASK_BTN_EP)).click if key == :ep
    return find(:xpath, NEW_TASK_BTN_IL).click if key == :il
    find(:xpath, ta(NEW_TASK_BTN_TA, NEW_TASK_BTN_IL)).click
  end

  def fill_task_name_field(key = nil, taskname)
    return find(ta(TASK_NAME_EP)).set(taskname) if key == :ep
    return find(:xpath, TASK_NAME_IL).set(taskname) if key == :il
    find(:xpath, ta(TASK_NAME_TA, TASK_NAME_IL)).set(taskname)
  end

  def select_task_type(key = nil)
    return find(ta(SELECT_TASK_TYPE_EP)).click if key == :ep
    return find(:xpath, SELECT_TASK_TYPE_IL).click if key == :il
    find(:xpath, ta(SELECT_TASK_TYPE_TA, SELECT_TASK_TYPE_IL)).click
  end

  def manual_task_type(key = nil)
    return find(ta(MANUAL_TASK_TYPE_EP)).click if key == :ep
    return find(:xpath, MANUAL_TASK_TYPE_IL).click if key == :il
    find(:xpath, ta(MANUAL_TASK_TYPE_TA, MANUAL_TASK_TYPE_IL)).click
  end

  def confirm_new_task(key = nil)
    return find(ta(CONFIRM_NEW_TASK_EP)).click if key == :ep
    return find(:xpath, CONFIRM_NEW_TASK_IL).click if key == :il
    find(:xpath, ta(CONFIRM_NEW_TASK_TA, CONFIRM_NEW_TASK_IL)).click
  end

  def find_pipeline_name_field(key = nil, pipename)
    return find(ta(FIND_PIPELINE_FIELD_EP)).set(pipename) if key == :ep
    return find(:xpath, FIND_PIPELINE_FIELD_IL).set(pipename) if key == :il
    find(:xpath, ta(FIND_PIPELINE_FIELD_TA, FIND_PIPELINE_FIELD_IL)).set(pipename)
  end

  def select_pipeline_from_list(key = nil)
    return find(ta(PIPELINE_LIST_ITEM_EP)).click if key == :ep
    return find(:css, PIPELINE_LIST_ITEM_IL).click if key == :il
    find(:css, ta(PIPELINE_LIST_ITEM_TA, PIPELINE_LIST_ITEM_IL)).click
  end

  def delete_pipeline(key = nil)
    return find(ta(DELETE_PIPELINE_EP)).click if key == :ep
    return find(:xpath, DELETE_PIPELINE_IL).click if key == :il
    find(:xpath, ta(DELETE_PIPELINE_TA, DELETE_PIPELINE_IL)).click
  end

  def confirm_delete_pipeline(key = nil)
    return find(ta(CONFIRM_DELETE_PIPELINE_EP)).click if key == :ep
    return find(:xpath, CONFIRM_DELETE_PIPELINE_IL).click if key == :il
    find(:xpath, ta(CONFIRM_DELETE_PIPELINE_TA, CONFIRM_DELETE_PIPELINE_IL)).click
  end

  def click_run_pipeline(key = nil)
    return find(ta(RUN_PIPELINE_BTN_EP)).click if key == :ep
    return find(:xpath, RUN_PIPELINE_BTN_IL).click if key == :il
    find(:xpath, ta(RUN_PIPELINE_BTN_TA, RUN_PIPELINE_BTN_IL)).click
  end

  def click_new_run_pipeline(key = nil)
    return find(ta(NEW_RUN_PIPELINE_BTN_EP)).click if key == :ep
    return find(:xpath, NEW_RUN_PIPELINE_BTN_IL).click if key == :il
    find(:xpath, ta(NEW_RUN_PIPELINE_BTN_TA, NEW_RUN_PIPELINE_BTN_IL)).click
  end

  def confirm_run_pipeline(key = nil)
    return find(ta(CONFIRM_RUN_PIPELINE_EP)).click if key == :ep
    return find(:xpath, CONFIRM_RUN_PIPELINE_IL).click if key == :il
    find(:xpath, ta(CONFIRM_RUN_PIPELINE_TA, CONFIRM_RUN_PIPELINE_IL)).click
  end

  def click_response_required(key = nil)
    return find(ta(RESPONSE_REQUIRED_BNT_EP)).click if key == :ep
    return find(:xpath, RESPONSE_REQUIRED_BNT_IL).click if key == :il
    find(:xpath, ta(RESPONSE_REQUIRED_BNT_TA, RESPONSE_REQUIRED_BNT_IL)).click
  end

  def click_manual_task_on_stage(key = nil)
    return find(ta(MANUAL_TASK_EP)).click if key == :ep
    return find(:xpath, MANUAL_TASK_IL).click if key == :il
    find(:xpath, ta(MANUAL_TASK_TA, MANUAL_TASK_IL)).click
  end

  def click_completed_radio_button(key = nil)
    return find(ta(COMPLETED_RADIO_BTN_EP)).click if key == :ep
    return find(:xpath, COMPLETED_RADIO_BTN_IL).click if key == :il
    find(:xpath, ta(COMPLETED_RADIO_BTN_TA, COMPLETED_RADIO_BTN_IL)).click
  end

  def confirm_completed_task(key = nil)
    return find(ta(CONFIRM_COMPLETED_TASK_EP)).click if key == :ep
    return find(:xpath, CONFIRM_COMPLETED_TASK_IL).click if key == :il
    find(:xpath, ta(CONFIRM_COMPLETED_TASK_TA, CONFIRM_COMPLETED_TASK_IL)).click
  end

  def check_no_default_project(key = nil)
    begin
      return expect(page).not_to have_selector(ta(SELECT_DEFAULT_PROJECT_EP)) if key == :ep
      return expect(page).not_to have_selector(:xpath, SELECT_DEFAULT_PROJECT_IL) if key == :il
      expect(page).not_to have_selector(:xpath, ta(SELECT_DEFAULT_PROJECT_TA, SELECT_DEFAULT_PROJECT_IL))
    rescue Selenium::WebDriver::Error::NoSuchElementError => e
      puts e.message
    end
  end

end