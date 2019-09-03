require 'spec_helper'

class CloudBeesComponents
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  NEW_COMPONENTS_BTN_IL = "//div[text()='New']"
  NEW_COMPONENTS_BTN_TA = 'cloud_bees:components:new_component'
  NEW_COMPONENTS_BTN_EP = 'EP:cloud_bees:components:new_component'

  CREATE_NEW_COMPONENTS_IL = "//div[@class='object-create__type' and text()='Create New...']"
  CREATE_NEW_COMPONENTS_TA = 'cloud_bees:components:create_new_component'
  CREATE_NEW_COMPONENTS_EP = 'EP:cloud_bees:components:create_new_component'

  COMPONENT_NAME_IL = "//input[@class='Form__input at-component-name-input']"
  COMPONENT_NAME_TA = 'cloud_bees:components:component_name'
  COMPONENT_NAME_EP = 'EP:cloud_bees:components:component_name'

  SELECT_PROJECT_IL = "//div[text()='Select Project']"
  SELECT_PROJECT_TA = 'cloud_bees:components:select_project'
  SELECT_PROJECT_EP = 'EP:cloud_bees:components:select_project'

  SELECT_DEFAULT_PROJECT_IL = "//div[text()='1']//following-sibling::div[@title='Default']"
  SELECT_DEFAULT_PROJECT_TA = 'cloud_bees:components:select_default_project'
  SELECT_DEFAULT_PROJECT_EP = 'EP:cloud_bees:components:select_default_project'

  CONFIRM_NEW_COMPONENT_IL = "//div[text()='Next']"
  CONFIRM_NEW_COMPONENT_TA = 'cloud_bees:components:confirm_new_component'
  CONFIRM_NEW_COMPONENT_EP = 'EP:cloud_bees:components:confirm_new_component'

  CONTENT_LOCATION_IL = "//div[text()='Content location']"
  CONTENT_LOCATION_TA = 'cloud_bees:components:content_location'
  CONTENT_LOCATION_EP = 'EP:cloud_bees:components:content_location'

  SELECT_EC_ARTIFACT_IL = "//span[text()='EC-Artifact']"
  SELECT_EC_ARTIFACT_TA = 'cloud_bees:components:select_ec_artifact'
  SELECT_EC_ARTIFACT_EP = 'EP:cloud_bees:components:select_ec_artifact'

  ARTIFACT_NAME_IL = "//input[@class='gwt-SuggestBox GAMBAOGN-']"
  ARTIFACT_NAME_TA = 'cloud_bees:components:artifact_name'
  ARTIFACT_NAME_EP = 'EP:cloud_bees:components:artifact_name'

  CONFIRM_NEW_ARTIFACT_IL = "//div[text()='OK']"
  CONFIRM_NEW_ARTIFACT_TA = 'cloud_bees:components:confirm_new_artifact'
  CONFIRM_NEW_ARTIFACT_EP = 'EP:cloud_bees:components:confirm_new_artifact'

  FIND_COMPONENT_NAME_IL = "//input[@placeholder='Find...']"
  FIND_COMPONENT_NAME_TA = 'cloud_bees:components:find_component_name'
  FIND_COMPONENT_NAME_EP = 'EP:cloud_bees:components:find_component_name'

  CONTEXT_MENU_BTN_IL = '.at-context-menu-btn-1'
  CONTEXT_MENU_BTN_TA = 'cloud_bees:components:context_menu_of_component'
  CONTEXT_MENU_BTN_EP = 'EP:cloud_bees:components:context_menu_of_component'

  PARAMETERS_MENU_IL = "//div[text()='Parameters']"
  PARAMETERS_MENU_TA = 'cloud_bees:components:parameters_menu'
  PARAMETERS_MENU_EP = 'EP:cloud_bees:components:parameters_menu'

  ADD_ONE_PARAMETERS_IL = "//div[text()='There are no Parameters. Add one']"
  ADD_ONE_PARAMETERS_TA = "cloud_bees:components:add_one_parameters"
  ADD_ONE_PARAMETERS_EP = "EP:cloud_bees:components:add_one_parameters"

  PARAMETER_NAME_IL = "//input[@class='Form__input at-form-txt-name-input']"
  PARAMETER_NAME_TA = 'cloud_bees:components:parameter_name'
  PARAMETER_NAME_EP = 'EP:cloud_bees:components:parameter_name'

  PARAMETER_TYPE_IL = "//div[text()='Text Entry']"
  PARAMETER_TYPE_TA = 'cloud_bees:components:parameter_type'
  PARAMETER_TYPE_EP = 'EP:cloud_bees:components:parameter_type'

  CHECKBOX_TYPE_IL = "//span[text()='Checkbox']"
  CHECKBOX_TYPE_TA = 'cloud_bees:components:checkbox_type'
  CHECKBOX_TYPE_EP = 'EP:cloud_bees:components:checkbox_type'

  CONFIRM_NEW_PARAMETER_IL = "//div[text()='OK']"
  CONFIRM_NEW_PARAMETER_TA = 'cloud_bees:components:confirm_new_parameter'
  CONFIRM_NEW_PARAMETER_EP = 'EP:cloud_bees:components:confirm_new_parameter'

  CLOSE_PARAMETERS_IL = "//span[@class='sds-svg-icon__wrapper']"
  CLOSE_PARAMETERS_TA = 'cloud_bees:components:close_parameters'
  CLOSE_PARAMETERS_EP = 'EP:cloud_bees:components:close_parameters'

  CHOOSE_COMPONENT_IL = "//div[contains(@class, 'at-master-component-list-item-name') and .//div[@title='compTest']]"
  CHOOSE_COMPONENT_TA = 'cloud_bees:components:choose_component'
  CHOOSE_COMPONENT_EP = 'EP:cloud_bees:components:choose_component'

  DELETE_COMPONENT_IL = "//span[text()='Delete']"
  DELETE_COMPONENT_TA = 'cloud_bees:components:delete_component'
  DELETE_COMPONENT_EP = 'EP:cloud_bees:components:delete_component'

  CONFIRM_DELETE_COMPONENT_IL = "//div[text()='OK']"
  CONFIRM_DELETE_COMPONENT_TA = 'cloud_bees:components:confirm_delete_component'
  CONFIRM_DELETE_COMPONENT_EP = 'EP:cloud_bees:components:confirm_delete_component'

  def click_new_component(key = nil)
    return find(ta(NEW_COMPONENTS_BTN_EP)).click if key == :ep
    return find(:xpath, NEW_COMPONENTS_BTN_IL).click if key == :il
    find(:xpath, ta(NEW_COMPONENTS_BTN_TA, NEW_COMPONENTS_BTN_IL)).click
  end

  def click_create_new_component(key = nil)
    return find(ta(CREATE_NEW_COMPONENTS_EP)).click if key == :ep
    return find(:xpath, CREATE_NEW_COMPONENTS_IL).click if key == :il
    find(:xpath, ta(CREATE_NEW_COMPONENTS_TA, CREATE_NEW_COMPONENTS_IL)).click
  end

  def fill_component_name_field(key = nil, component_name)
    return find(ta(COMPONENT_NAME_EP)).set(component_name) if key == :ep
    return find(:xpath, COMPONENT_NAME_IL).set(component_name) if key == :il
    find(:xpath, ta(COMPONENT_NAME_TA, COMPONENT_NAME_IL)).set(component_name)
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

  def confirm_create_new_component(key = nil)
    return find(ta(CONFIRM_NEW_COMPONENT_EP)).click if key == :ep
    return find(:xpath, CONFIRM_NEW_COMPONENT_IL).click if key == :il
    find(:xpath, ta(CONFIRM_NEW_COMPONENT_TA, CONFIRM_NEW_COMPONENT_IL)).click
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

  def find_component_name_field(key = nil, find_comp)
    return find(ta(FIND_COMPONENT_NAME_EP)).set(find_comp) if key == :ep
    return find(:xpath, FIND_COMPONENT_NAME_IL).set(find_comp) if key == :il
    find(:xpath, ta(FIND_COMPONENT_NAME_TA, FIND_COMPONENT_NAME_IL)).set(find_comp)
  end

  def click_context_menu_of_content(key = nil)
    return find(ta(CONTEXT_MENU_BTN_EP)).click if key == :ep
    return find(:css, CONTEXT_MENU_BTN_IL).click if key == :il
    find(:css, ta(CONTEXT_MENU_BTN_TA, CONTEXT_MENU_BTN_IL)).click
  end

  def click_parameters_menu(key = nil)
    return find(ta(PARAMETERS_MENU_EP)).click if key == :ep
    return find(:xpath, PARAMETERS_MENU_IL).click if key == :il
    find(:xpath, ta(PARAMETERS_MENU_TA, PARAMETERS_MENU_IL)).click
  end

  def click_add_one_parameters(key = nil)
    return find(ta(ADD_ONE_PARAMETERS_EP)).click if key == :ep
    return find(:xpath, ADD_ONE_PARAMETERS_IL).click if key == :il
    find(:xpath, ta(ADD_ONE_PARAMETERS_TA, ADD_ONE_PARAMETERS_IL)).click
  end

  def fill_parameter_name_field(key = nil, param_name)
    return find(ta(PARAMETER_NAME_EP)).set(param_name) if key == :ep
    return find(:xpath, PARAMETER_NAME_IL).set(param_name) if key == :il
    find(:xpath, ta(PARAMETER_NAME_TA, PARAMETER_NAME_IL)).set(param_name)
  end

  def click_parameter_type(key = nil)
    return find(ta(PARAMETER_TYPE_EP)).click if key == :ep
    return find(:xpath, PARAMETER_TYPE_IL).click if key == :il
    find(:xpath, ta(PARAMETER_TYPE_TA, PARAMETER_TYPE_IL)).click
  end

  def select_checkbox_type(key = nil)
    return find(ta(CHECKBOX_TYPE_EP)).click if key == :ep
    return find(:xpath, CHECKBOX_TYPE_IL).click if key == :il
    find(:xpath, ta(CHECKBOX_TYPE_TA, CHECKBOX_TYPE_IL)).click
  end

  def confirm_new_parameter(key = nil)
    return find(ta(CONFIRM_NEW_PARAMETER_EP)).click if key == :ep
    return find(:xpath, CONFIRM_NEW_PARAMETER_IL).click if key == :il
    find(:xpath, ta(CONFIRM_NEW_PARAMETER_TA, CONFIRM_NEW_PARAMETER_IL)).click
  end

  def click_close_parameters(key = nil)
    return find(ta(CLOSE_PARAMETERS_EP)).click if key == :ep
    return find(:xpath, CLOSE_PARAMETERS_IL).click if key == :il
    find(:xpath, ta(CLOSE_PARAMETERS_TA, CLOSE_PARAMETERS_IL)).click
  end

  def choose_component(key = nil)
    return find(ta(CHOOSE_COMPONENT_EP)).click if key == :ep
    return find(:xpath, CHOOSE_COMPONENT_IL).click if key == :il
    find(:xpath, ta(CHOOSE_COMPONENT_TA, CHOOSE_COMPONENT_IL)).click
  end

  def click_delete_component(key = nil)
    return find(ta(DELETE_COMPONENT_EP)).click if key == :ep
    return find(:xpath, DELETE_COMPONENT_IL).click if key == :il
    find(:xpath, ta(DELETE_COMPONENT_TA, DELETE_COMPONENT_IL)).click
  end

  def confirm_delete_component(key = nil)
    return find(ta(CONFIRM_DELETE_COMPONENT_EP)).click if key == :ep
    return find(:xpath, CONFIRM_DELETE_COMPONENT_IL).click if key == :il
    find(:xpath, ta(CONFIRM_DELETE_COMPONENT_TA, CONFIRM_DELETE_COMPONENT_IL)).click
  end

end