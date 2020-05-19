require_relative '../page_extension'

class CloudBeesComponents < PageExtension

  NEW_COMPONENTS_BTN_IL = "//div[text()='New']"
  NEW_COMPONENTS_BTN_TA = 'cloud_bees:components:new_component'

  CREATE_NEW_COMPONENTS_IL = "//div[@class='object-create__type' and text()='Create New...']"
  CREATE_NEW_COMPONENTS_TA = 'cloud_bees:components:create_new_component'

  COMPONENT_NAME_IL = "//input[@class='Form__input at-component-name-input']"
  COMPONENT_NAME_TA = 'cloud_bees:components:component_name'

  SELECT_PROJECT_IL = "//div[text()='Select Project']"
  SELECT_PROJECT_TA = 'cloud_bees:components:select_project'

  SELECT_DEFAULT_PROJECT_IL = "//div[@title='Default' and contains(@class, 'ec-project-select-picker__option')]"
  SELECT_DEFAULT_PROJECT_TA = 'cloud_bees:components:select_default_project'

  CONFIRM_NEW_COMPONENT_IL = "//div[text()='Next']"
  CONFIRM_NEW_COMPONENT_TA = 'cloud_bees:components:confirm_new_component'

  CONTENT_LOCATION_IL = "//div[text()='Content location']"
  CONTENT_LOCATION_TA = 'cloud_bees:components:content_location'

  SELECT_EC_ARTIFACT_IL = "//span[text()='EC-Artifact']"
  SELECT_EC_ARTIFACT_TA = 'cloud_bees:components:select_ec_artifact'

  ARTIFACT_NAME_IL = "//input[@class='gwt-SuggestBox GAMBAOGN-']"
  ARTIFACT_NAME_TA = 'cloud_bees:components:artifact_name'

  CONFIRM_NEW_ARTIFACT_IL = "//div[text()='OK']"
  CONFIRM_NEW_ARTIFACT_TA = 'cloud_bees:components:confirm_new_artifact'

  FIND_COMPONENT_NAME_IL = "//input[@placeholder='Find...']"
  FIND_COMPONENT_NAME_TA = 'cloud_bees:components:find_component_name'

  CONTEXT_MENU_BTN_IL = '.at-context-menu-btn-1'
  CONTEXT_MENU_BTN_TA = 'cloud_bees:components:context_menu_of_component'

  PARAMETERS_MENU_IL = "//div[text()='Parameters']"
  PARAMETERS_MENU_TA = 'cloud_bees:components:parameters_menu'

  ADD_ONE_PARAMETERS_IL = "//div[text()='There are no Parameters. Add one']"
  ADD_ONE_PARAMETERS_TA = "cloud_bees:components:add_one_parameters"

  PARAMETER_NAME_IL = "//input[@class='Form__input at-form-txt-name-input']"
  PARAMETER_NAME_TA = 'cloud_bees:components:parameter_name'

  PARAMETER_TYPE_IL = "//div[text()='Text Entry']"
  PARAMETER_TYPE_TA = 'cloud_bees:components:parameter_type'

  CHECKBOX_TYPE_IL = "//span[text()='Checkbox']"
  CHECKBOX_TYPE_TA = 'cloud_bees:components:checkbox_type'

  CONFIRM_NEW_PARAMETER_IL = "//div[text()='OK']"
  CONFIRM_NEW_PARAMETER_TA = 'cloud_bees:components:confirm_new_parameter'

  CLOSE_PARAMETERS_IL = "//span[@class='sds-svg-icon__wrapper']"
  CLOSE_PARAMETERS_TA = 'cloud_bees:components:close_parameters'

  MASTER_COMPONENT_LIST_IL = ".at-master-component-list-item"
  MASTER_COMPONENT_LIST_TA = 'cloud_bees:components:master_component_list'

  DELETE_COMPONENT_IL = "//span[text()='Delete']"
  DELETE_COMPONENT_TA = 'cloud_bees:components:delete_component'

  CONFIRM_DELETE_COMPONENT_IL = "//div[text()='OK']"
  CONFIRM_DELETE_COMPONENT_TA = 'cloud_bees:components:confirm_delete_component'

  def click_new_component(key = nil)
    find_element(key, il_type: :xpath, tl: NEW_COMPONENTS_BTN_TA, il: NEW_COMPONENTS_BTN_IL, check_path: $check_path).click
  end

  def click_create_new_component(key = nil)
    find_element(key, il_type: :xpath, tl: CREATE_NEW_COMPONENTS_TA, il: CREATE_NEW_COMPONENTS_IL, check_path: $check_path).click
  end

  def fill_component_name_field(key = nil, component_name)
    find_element(key, il_type: :xpath, tl: COMPONENT_NAME_TA, il: COMPONENT_NAME_IL, check_path: $check_path).set(component_name)
  end

  def click_on_select_project(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_PROJECT_TA, il: SELECT_PROJECT_IL, check_path: $check_path).click
  end

  def select_default_project(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_DEFAULT_PROJECT_TA, il: SELECT_DEFAULT_PROJECT_IL, check_path: $check_path).click
  end

  def confirm_create_new_component(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_NEW_COMPONENT_TA, il: CONFIRM_NEW_COMPONENT_IL, check_path: $check_path).click
  end

  def click_on_content_location(key = nil)
    find_element(key, il_type: :xpath, tl: CONTENT_LOCATION_TA, il: CONTENT_LOCATION_IL, check_path: $check_path).click
  end

  def select_ec_artifact(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_EC_ARTIFACT_TA, il: SELECT_EC_ARTIFACT_IL, check_path: $check_path).click
  end

  def fill_artifact_name_field(key = nil, artname)
    find_element(key, il_type: :xpath, tl: ARTIFACT_NAME_TA, il: ARTIFACT_NAME_IL, check_path: $check_path).set(artname)
  end

  def confirm_new_artifact(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_NEW_ARTIFACT_TA, il: CONFIRM_NEW_ARTIFACT_IL, check_path: $check_path).click
  end

  def find_component_name_field(key = nil, find_comp)
    find_element(key, il_type: :xpath, tl: FIND_COMPONENT_NAME_TA, il: FIND_COMPONENT_NAME_IL, check_path: $check_path).set(find_comp)
  end

  def click_context_menu_of_content(key = nil)
    find_element(key, il_type: :css, tl: CONTEXT_MENU_BTN_TA, il: CONTEXT_MENU_BTN_IL, check_path: $check_path).click
  end

  def click_parameters_menu(key = nil)
    find_element(key, il_type: :xpath, tl: PARAMETERS_MENU_TA, il: PARAMETERS_MENU_IL, check_path: $check_path).click
  end

  def click_add_one_parameters(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_ONE_PARAMETERS_TA, il: ADD_ONE_PARAMETERS_IL, check_path: $check_path).click
  end

  def fill_parameter_name_field(key = nil, param_name)
    find_element(key, il_type: :xpath, tl: PARAMETER_NAME_TA, il: PARAMETER_NAME_IL, check_path: $check_path).set(param_name)
  end

  def click_parameter_type(key = nil)
    find_element(key, il_type: :xpath, tl: PARAMETER_TYPE_TA, il: PARAMETER_TYPE_IL, check_path: $check_path).click
  end

  def select_checkbox_type(key = nil)
    find_element(key, il_type: :xpath, tl: CHECKBOX_TYPE_TA, il: CHECKBOX_TYPE_IL, check_path: $check_path).click
  end

  def confirm_new_parameter(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_NEW_PARAMETER_TA, il: CONFIRM_NEW_PARAMETER_IL, check_path: $check_path).click
  end

  def click_close_parameters(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_PARAMETERS_TA, il: CLOSE_PARAMETERS_IL, check_path: $check_path).click
  end

  def select_master_component_from_list(key = nil)
    find_element(key, il_type: :css, tl: MASTER_COMPONENT_LIST_TA, il: MASTER_COMPONENT_LIST_IL, check_path: $check_path).click
  end

  def click_delete_component(key = nil)
    find_element(key, il_type: :xpath, tl: DELETE_COMPONENT_TA, il: DELETE_COMPONENT_IL, check_path: $check_path).click
  end

  def confirm_delete_component(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_DELETE_COMPONENT_TA, il: CONFIRM_DELETE_COMPONENT_IL, check_path: $check_path).click
  end

end
