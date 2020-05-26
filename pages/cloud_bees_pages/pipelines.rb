require_relative '../page_extension'

class CloudBeesPipelines < PageExtension

  CHOOSE_PIPELINE_TA866_IL = "//div/a[@title='pipelineTA-866']"
  CHOOSE_PIPELINE_TA866_TA = "cloud_bees:pipeline:choose_pipeline_ta866"

  NEW_PIPELINE_BTN_IL = "//div[text()='New']"
  NEW_PIPELINE_BTN_TA = 'cloud_bees:pipeline:new_pipeline'

  CREATE_NEW_PIPELINE_IL = "//div[@class='object-create__type' and text()='Create New...']"
  CREATE_NEW_PIPELINE_TA = 'cloud_bees:pipeline:create_new_pipeline'

  PIPELINE_NAME_IL = "//input[@class='Form__input at-pipeline-name-input']"
  PIPELINE_NAME_TA = 'cloud_bees:pipeline:pipeline_name'

  SELECT_PROJECT_IL = "//div[text()='Select Project']"
  SELECT_PROJECT_TA = 'cloud_bees:pipeline:select_project'

  SELECT_DEFAULT_PROJECT_IL = "//div[@title='Default' and contains(@class, 'ec-project-select-picker__option')]"
  SELECT_DEFAULT_PROJECT_TA = 'cloud_bees:pipeline:select_default_project'

  CONFIRM_NEW_PIPELINE_IL = "//div[text()='OK']"
  CONFIRM_NEW_PIPELINE_TA = 'cloud_bees:pipeline:confirm_new_pipeline'

  NEW_TASK_BTN_IL = "//button[text()='Add']"
  NEW_TASK_BTN_TA = 'cloud_bees:pipeline:new_task'

  TASK_NAME_IL = "//input[@class='pipeline-kanban__input at-pipeline-kanban-form-input at-pipeline-kanban-form-input-0']"
  TASK_NAME_TA = 'cloud_bees:pipeline:task_name'

  SELECT_TASK_TYPE_IL = "//button[text()='Select Task Type']"
  SELECT_TASK_TYPE_TA = 'cloud_bees:pipeline:select_task_type'

  MANUAL_TASK_TYPE_IL = "//span[text()='Manual']"
  MANUAL_TASK_TYPE_TA = 'cloud_bees:pipeline:manual_task_type'

  CONFIRM_NEW_TASK_IL = "//button[text()='Done']"
  CONFIRM_NEW_TASK_TA = 'cloud_bees:pipeline:confirm_new_task'

  FIND_PIPELINE_FIELD_IL = "//input[@class='sds-input search-collapsable__search-input at-search-collapsable-input']"
  FIND_PIPELINE_FIELD_TA = 'cloud_bees:pipeline:find_pipeline_field'

  PIPELINE_LIST_ITEM_IL = ".at-object-list-row"
  PIPELINE_LIST_ITEM_TA = 'cloud_bees:pipeline:pipeline_list_item'

  DELETE_PIPELINE_IL = "//span[text()='Delete']"
  DELETE_PIPELINE_TA = 'cloud_bees:pipeline:delete_pipeline'

  CONFIRM_DELETE_PIPELINE_IL = "//div[text()='OK']"
  CONFIRM_DELETE_PIPELINE_TA = 'cloud_bees:pipeline:confirm_delete_pipeline'

  RUN_PIPELINE_BTN_IL = "//div[@class='object__action object__button object__button--run']"
  RUN_PIPELINE_BTN_TA = 'cloud_bees:pipeline:run_pipeline_btn'

  NEW_RUN_PIPELINE_BTN_IL = "//div[text()='New Run']"
  NEW_RUN_PIPELINE_BTN_TA = 'cloud_bees:pipeline:new_run_pipeline_btn'

  CONFIRM_RUN_PIPELINE_IL = "//div[text()='Run' and @class='at-pipeline-release-run-btn ec-wizard-btn ec-ok at-ok-btn']"
  CONFIRM_RUN_PIPELINE_TA = 'cloud_bees:pipeline:confirm_run_pipeline'

  RESPONSE_REQUIRED_BNT_IL = "//div[text()='Response required']"
  RESPONSE_REQUIRED_BNT_TA = 'cloud_bees:pipeline:response_required_btn'

  MANUAL_TASK_IL = "//div[@class='run-app-manual-approvals__item-name']"
  MANUAL_TASK_TA = 'cloud_bees:pipeline:manual_task'

  COMPLETED_RADIO_BTN_IL = "//div[text()='Completed']"
  COMPLETED_RADIO_BTN_TA = 'cloud_bees:pipeline:completed_radio_btn'

  CONFIRM_COMPLETED_TASK_IL = "//div[text()='OK']"
  CONFIRM_COMPLETED_TASK_TA = 'cloud_bees:pipeline:confirm_completed_task'

  def choose_pipeline_ta866_from_list(key = nil)
    find_element(key, il_type: :xpath, tl: CHOOSE_PIPELINE_TA866_TA, il: CHOOSE_PIPELINE_TA866_IL, check_path: $check_path).click
  end

  def click_new_pipeline(key = nil)
    find_element(key, il_type: :xpath, tl: NEW_PIPELINE_BTN_TA, il: NEW_PIPELINE_BTN_IL, check_path: $check_path).click
  end

  def create_new_pipeline(key = nil)
    find_element(key, il_type: :xpath, tl: CREATE_NEW_PIPELINE_TA, il: CREATE_NEW_PIPELINE_IL, check_path: $check_path).click
  end

  def fill_pipeline_name_field(key = nil, pipename)
    find_element(key, il_type: :xpath, tl: PIPELINE_NAME_TA, il: PIPELINE_NAME_IL, check_path: $check_path).set(pipename)
  end

  def click_on_select_project(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_PROJECT_TA, il: SELECT_PROJECT_IL, check_path: $check_path).click
  end

  def select_default_project(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_DEFAULT_PROJECT_TA, il: SELECT_DEFAULT_PROJECT_IL, check_path: $check_path).click
  end

  def confirm_create_new_pipeline(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_NEW_PIPELINE_TA, il: CONFIRM_NEW_PIPELINE_IL, check_path: $check_path).click
  end

  def click_new_task(key = nil)
    find_element(key, il_type: :xpath, tl: NEW_TASK_BTN_TA, il: NEW_TASK_BTN_IL, check_path: $check_path).click
  end

  def fill_task_name_field(key = nil, taskname)
    find_element(key, il_type: :xpath, tl: TASK_NAME_TA, il: TASK_NAME_IL, check_path: $check_path).set(taskname)
  end

  def select_task_type(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_TASK_TYPE_TA, il: SELECT_TASK_TYPE_IL, check_path: $check_path).click
  end

  def manual_task_type(key = nil)
    find_element(key, il_type: :xpath, tl: MANUAL_TASK_TYPE_TA, il: MANUAL_TASK_TYPE_IL, check_path: $check_path).click
  end

  def confirm_new_task(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_NEW_TASK_TA, il: CONFIRM_NEW_TASK_IL, check_path: $check_path).click
  end

  def find_pipeline_name_field(key = nil, pipename)
    find_element(key, il_type: :xpath, tl: FIND_PIPELINE_FIELD_TA, il: FIND_PIPELINE_FIELD_IL, check_path: $check_path).set(pipename)
  end

  def select_pipeline_from_list(key = nil)
    find_element(key, il_type: :css, tl: PIPELINE_LIST_ITEM_TA, il: PIPELINE_LIST_ITEM_IL, check_path: $check_path).click
  end

  def delete_pipeline(key = nil)
    find_element(key, il_type: :xpath, tl: DELETE_PIPELINE_TA, il: DELETE_PIPELINE_IL, check_path: $check_path).click
  end

  def confirm_delete_pipeline(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_DELETE_PIPELINE_TA, il: CONFIRM_DELETE_PIPELINE_IL, check_path: $check_path).click
  end

  def click_run_pipeline(key = nil)
    find_element(key, il_type: :xpath, tl: RUN_PIPELINE_BTN_TA, il: RUN_PIPELINE_BTN_IL, check_path: $check_path).click
  end

  def click_new_run_pipeline(key = nil)
    find_element(key, il_type: :xpath, tl: NEW_RUN_PIPELINE_BTN_TA, il: NEW_RUN_PIPELINE_BTN_IL, check_path: $check_path).click
  end

  def confirm_run_pipeline(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_RUN_PIPELINE_TA, il: CONFIRM_RUN_PIPELINE_IL, check_path: $check_path).click
  end

  def click_response_required(key = nil)
    find_element(key, il_type: :xpath, tl: RESPONSE_REQUIRED_BNT_TA, il: RESPONSE_REQUIRED_BNT_IL, check_path: $check_path).click
  end

  def click_manual_task_on_stage(key = nil)
    find_element(key, il_type: :xpath, tl: MANUAL_TASK_TA, il: MANUAL_TASK_IL, check_path: $check_path).click
  end

  def click_completed_radio_button(key = nil)
    find_element(key, il_type: :xpath, tl: COMPLETED_RADIO_BTN_TA, il: COMPLETED_RADIO_BTN_IL, check_path: $check_path).click
  end

  def confirm_completed_task(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_COMPLETED_TASK_TA, il: CONFIRM_COMPLETED_TASK_IL, check_path: $check_path).click
  end

  def check_no_default_project(key = nil)
    begin
      # find_element(key, il_type: :xpath, tl: RUN_STATUS_SELECT_TA, il: RUN_STATUS_SELECT_IL).click

      return expect(page).not_to have_selector(ta(SELECT_DEFAULT_PROJECT_EP)) if key == :ta
      return expect(page).not_to have_selector(:xpath, SELECT_DEFAULT_PROJECT_IL) if key == :il
      expect(page).not_to have_selector(:xpath, ta(SELECT_DEFAULT_PROJECT_TA, SELECT_DEFAULT_PROJECT_IL))
    rescue Selenium::WebDriver::Error::NoSuchElementError => e
      puts e.message
    end
  end

end
