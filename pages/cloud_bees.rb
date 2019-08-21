require 'spec_helper'

class CloudBees
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  USERNAME_FIELD_IL = '.at-login-username'
  USERNAME_FIELD_TA = 'cloud_bees:login_page:username'
  USERNAME_FIELD_EP = 'EP:cloud_bees:login_page:username'

  PASSWORD_FIELD_IL = '.at-login-password'
  PASSWORD_FIELD_TA = 'cloud_bees:login_page:password'
  PASSWORD_FIELD_EP = 'EP:cloud_bees:login_page:password'

  SIGN_IN_BTN_IL = '.at-login-button'
  SIGN_IN_BTN_TA = 'cloud_bees:login_page:sign_in_btn'
  SIGN_IN_BTN_EP = 'EP:cloud_bees:login_page:sign_in_btn'

  HAM_MENU_BTN_IL = '.at-main-menu-btn'
  HAM_MENU_BTN_TA = 'cloud_bees:ham_menu'
  HAM_MENU_BTN_EP = 'EP:cloud_bees:ham_menu'

  USERS_SECTION_IL = "//a[./span[text()='Users']]"
  USERS_SECTION_TA = 'cloud_bees:ham_menu:users'
  USERS_SECTION_EP = 'EP:cloud_bees:ham_menu:users'

  CREATE_USER_BTN_IL = "//td[@id='pageHeader_actionList_actionList0']/a"
  CREATE_USER_BTN_TA = 'cloud_bees:users_page:create_user_btn'
  CREATE_USER_BTN_EP = 'EP:cloud_bees:users_page:create_user_btn'

  USER_NAME_FIELD_IL = '[id=userName]'
  USER_NAME_FIELD_TA = 'cloud_bees:new_user:user_name_fld'
  USER_NAME_FIELD_EP = 'EP:cloud_bees:new_user:user_name_fld'

  REAL_NAME_FIELD_IL = '[id=fullUserName]'
  REAL_NAME_FIELD_TA = 'cloud_bees:new_user:real_name_fld'
  REAL_NAME_FIELD_EP = 'EP:cloud_bees:new_user:real_name_fld'

  PIPELINES_IL = '.at-main-menu-pipelines'
  PIPELINES_TA = "ec_flow:pipelines"
  PIPELINES_EP = "EP:ec_flow:pipelines"

  CHOOSE_PIPELINE_IL = "//div/a[@title='pipJul_NOT_DELETE']"
  CHOOSE_PIPELINE_TA = "ec_flow:choose_pipeline"
  CHOOSE_PIPELINE_EP = "EP:ec_flow:choose_pipeline"

  APPLICATIONS_IL = "a.at-main-menu-applications"
  APPLICATIONS_TA = "ec_flow:applications"
  APPLICATIONS_EP = "EP:ec_flow:applications"

  APPLICATION_FROM_LIST_IL = "//a[@title='AppJul_NOT_DELETE']"
  APPLICATION_FROM_LIST_TA = "ec_flow:application_from_list"
  APPLICATION_FROM_LIST_EP = "EP:ec_flow:application_from_list"

  ADD_NEW_COMPONENT_IL = "span.at-add-comp-to-tier-btn"
  ADD_NEW_COMPONENT_TA = "ec_flow:add_new_component"
  ADD_NEW_COMPONENT_EP = "EP:ec_flow:add_new_component"

  ADD_COMPONENT_BTN_IL = "span.at-tier-cell-add-btn"
  ADD_COMPONENT_BTN_TA = "ec_flow:add_component_btn"
  ADD_COMPONENT_BTN_EP = "EP:ec_flow:add_component_btn"

  CREATE_NEW_APP_COMPONENT_IL = "div.at-component-scratch"
  CREATE_NEW_APP_COMPONENT_TA = "ec_flow:create_new_app_component"
  CREATE_NEW_APP_COMPONENT_EP = "EP:ec_flow:create_new_app_component"

  NEW_COMPONENT_NAME_IL = "input.at-component-name-input"
  NEW_COMPONENT_NAME_TA = "ec_flow:component_name"
  NEW_COMPONENT_NAME_EP = "EP:ec_flow:component_name"

  COMPONENT_DESCRIPTION_IL = "textarea.at-react-form-textarea"
  COMPONENT_DESCRIPTION_TA = "ec_flow:component_description"
  COMPONENT_DESCRIPTION_EP = "EP:ec_flow:component_description"

  COMPONENT_DROPDOWN_IL = "div.at-select-header-title"
  COMPONENT_DROPDOWN_TA = "ec_flow:component_dropdown"
  COMPONENT_DROPDOWN_EP = "EP:ec_flow:component_dropdown"

  EC_ARTIFACTORY_IL = "//span[@title='EC-Artifactory']"
  EC_ARTIFACTORY_TA = "ec_flow:ec_artifactory"
  EC_ARTIFACTORY_EP = "EP:ec_flow:ec_artifactory"

  CONFIGURATION_IL = "(//tr//input[@class='gwt-TextBox'])[1]"
  CONFIGURATION_TA = "ec_flow:configuration"
  CONFIGURATION_EP = "EP:ec_flow:configuration"

  REPOSITORY_KEY_IL = "(//tr//input[@class='gwt-TextBox'])[2]"
  REPOSITORY_KEY_TA = "ec_flow:repository_key"
  REPOSITORY_KEY_EP = "EP:ec_flow:repository_key"

  ORGANIZATION_PATH_IL = "(//tr//input[@class='gwt-TextBox'])[4]"
  ORGANIZATION_PATH_TA = "ec_flow:organization_path"
  ORGANIZATION_PATH_EP = "EP:ec_flow:organization_path"

  ARTIFACT_IL = "(//tr//input[@class='gwt-TextBox'])[6]"
  ARTIFACT_TA = "ec_flow:artifact"
  ARTIFACT_EP = "EP:ec_flow:artifact"

  VERSION_IL = "(//tr//input[@class='gwt-TextBox'])[7]"
  VERSION_TA = "ec_flow:version"
  VERSION_EP = "EP:ec_flow:version"

  EXTENSION_IL = "(//tr//input[@class='gwt-TextBox'])[11]"
  EXTENSION_TA = "ec_flow:extention"
  EXTENSION_EP = "EP:ec_flow:extention"

  OK_WARNING_IL = "//div[@class='ec-wizard-btn ec-ok at-ok-btn']"
  OK_WARNING_TA = "ec_flow:ok_warning_btn"
  OK_WARNING_EP = "EP:ec_flow:ok_warning_btn"

  OK_IN_MODAL_IL = "div.at-ok-btn"
  OK_IN_MODAL_TA = "ec_flow:ok_in_modal_btn"
  OK_IN_MODAL_EP = "EP:ec_flow:ok_in_modal_btn"

  NEXT_BTN_IL = "//div[text()='Next']"
  NEXT_BTN_TA = "ec_flow:ok_btn"
  NEXT_BTN_EP = "EP:ec_flow:ok_btn"

  MULTI_MENU_BTN_IL = "span.at-show-component-menu-btn-2"
  MULTI_MENU_BTN_TA = "ec_flow:multi_menu_btn"
  MULTI_MENU_BTN_EP = "EP:ec_flow:multi_menu_btn"

  DELETE_IL = "div.at-item-delete"
  DELETE_TA = "ec_flow:delete_item"
  DELETE_EP = "EP:ec_flow:delete_item"


  def fill_username_field(key = nil, username)
    return find(ta(USERNAME_FIELD_EP)).set(username) if key == :ep
    return find(:css, USERNAME_FIELD_IL).set(username) if key == :il
    find(:css, ta(USERNAME_FIELD_TA, USERNAME_FIELD_IL)).set(username)
  end

  def fill_pass_field(key = nil, pass)
    return find(ta(PASSWORD_FIELD_EP)).set(pass) if key == :ep
    return find(:css, PASSWORD_FIELD_IL).set(pass) if key == :il
    find(:css, ta(PASSWORD_FIELD_TA, PASSWORD_FIELD_IL)).set(pass)
  end

  def click_sign_in_button(key = nil)
    return find(ta(SIGN_IN_BTN_EP)).click if key == :ep
    return find(:css, SIGN_IN_BTN_IL).click if key == :il
    find(:css, ta(SIGN_IN_BTN_TA, SIGN_IN_BTN_IL)).click
  end

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

  def press_create_user_btn(key = nil)
    within_frame(0) do
      return find(ta(CREATE_USER_BTN_EP)).click if key == :ep
      return find(:xpath, CREATE_USER_BTN_IL).click if key == :il
      find(:xpath, ta(CREATE_USER_BTN_TA, CREATE_USER_BTN_IL)).click
    end
  end

  def fill_user_name_field(key = nil, name)
    within_frame(0) do
      return find(ta(USER_NAME_FIELD_EP)).set(name) if key == :ep
      return find(:css, USER_NAME_FIELD_IL).set(name) if key == :il
      find(:css, ta(USER_NAME_FIELD_TA, USER_NAME_FIELD_IL)).set(name)
    end
  end

  def fill_real_name_field(key = nil, name)
    within_frame(0) do
      return find(ta(REAL_NAME_FIELD_EP)).set(name) if key == :ep
      return find(:css, REAL_NAME_FIELD_IL).set(name) if key == :il
      find(:css, ta(REAL_NAME_FIELD_TA, REAL_NAME_FIELD_IL)).set(name)
    end
  end

  def click_pipelines(key = nil)
    return find(ta(PIPELINES_EP)).click if key ==:ep
    return find(:xpath, PIPELINES_IL).click if key ==:il
    find(:xpath, ta(PIPELINES_TA, PIPELINES_IL)).click
  end

  def choose_pipeline_from_list(key = nil)
    return find(ta(CHOOSE_PIPELINE_EP)).click if key ==:ep
    return find(:xpath, CHOOSE_PIPELINE_IL).click if key ==:il
    find(:xpath, ta(CHOOSE_PIPELINE_TA, CHOOSE_PIPELINE_IL)).click
  end

  def click_applications(key = nil)
    return find(ta(APPLICATIONS_EP)).click if key ==:ep
    return find(:css, APPLICATIONS_IL).click if key ==:il
    find(:css, ta(APPLICATIONS_TA, APPLICATIONS_IL)).click
  end

  def select_application_from_list(key = nil)
    return find(ta(APPLICATION_FROM_LIST_EP)).click if key ==:ep
    return find(:xpath, APPLICATION_FROM_LIST_IL).click if key ==:il
    find(:xpath, ta(APPLICATION_FROM_LIST_TA, APPLICATION_FROM_LIST_IL)).click
  end

  def click_add_new_component(key = nil)
    return find(ta(ADD_NEW_COMPONENT_EP)).click if key ==:ep
    return find(:css, ADD_NEW_COMPONENT_IL).click if key ==:il
    find(:css, ta(ADD_NEW_COMPONENT_TA, ADD_NEW_COMPONENT_IL)).click
  end

  def click_component_btn(key = nil)
    return find(ta(ADD_COMPONENT_BTN_EP)).click if key ==:ep
    return find(:css, ADD_COMPONENT_BTN_IL).click if key ==:il
    find(:css, ta(ADD_COMPONENT_BTN_TA, ADD_COMPONENT_BTN_IL)).click
  end

  def click_for_create_new_app_component(key = nil)
    return find(ta(CREATE_NEW_APP_COMPONENT_EP)).set("appName"+ SecureRandom.hex(3)) if key ==:ep
    return find(:css, CREATE_NEW_APP_COMPONENT_IL).set("appName"+ SecureRandom.hex(3)) if key ==:il
    find(:css, ta(CREATE_NEW_APP_COMPONENT_TA, CREATE_NEW_APP_COMPONENT_IL)).set("appName"+ SecureRandom.hex(3))
  end

  def set_new_name(key = nil)
    return find(ta(NEW_COMPONENT_NAME_EP)).set("") if key ==:ep
    return find(:css, NEW_COMPONENT_NAME_IL).set("") if key ==:il
    find(:css, ta(NEW_COMPONENT_NAME_TA, NEW_COMPONENT_NAME_IL)).set("appName"+SecureRandom.hex(5))
  end

  def set_description(key = nil)
    return find(ta(COMPONENT_DESCRIPTION_EP)).set("description"+ SecureRandom.hex(10))  if key ==:ep
    return find(:css, COMPONENT_DESCRIPTION_IL).set("description"+ SecureRandom.hex(10))  if key ==:il
    find(:css, ta(COMPONENT_DESCRIPTION_TA, COMPONENT_DESCRIPTION_IL)).set("description"+ SecureRandom.hex(10))
  end

  def click_component_dropdown(key = nil)
    return find(ta(COMPONENT_DROPDOWN_EP)).click if key ==:ep
    return find(:css, COMPONENT_DROPDOWN_IL).click if key ==:il
    find(:css, ta(COMPONENT_DROPDOWN_TA, COMPONENT_DROPDOWN_IL)).click
  end

  def click_artifact(key = nil)
    return find(ta(EC_ARTIFACTORY_EP)).click if key ==:ep
    return find(:xpath, EC_ARTIFACTORY_IL).click if key ==:il
    find(:xpath, ta(EC_ARTIFACTORY_TA, EC_ARTIFACTORY_IL)).click
  end

  def set_configuration(key = nil)
    return find(ta(CONFIGURATION_EP)).set("test") if key ==:ep
    return find(:xpath, CONFIGURATION_IL).set("test") if key ==:il
    find(:xpath, ta(CONFIGURATION_TA, CONFIGURATION_IL)).set("test")
  end

  def set_repository_key(key = nil)
    return find(ta(REPOSITORY_KEY_EP)).set("test") if key ==:ep
    return find(:xpath, REPOSITORY_KEY_IL).set("test") if key ==:il
    find(:xpath, ta(REPOSITORY_KEY_TA, REPOSITORY_KEY_IL)).set("test")
  end

  def set_organization_path(key = nil)
    return find(ta(ORGANIZATION_PATH_EP)).set("test") if key ==:ep
    return find(:xpath, ORGANIZATION_PATH_IL).set("test") if key ==:il
    find(:xpath, ta(ORGANIZATION_PATH_TA, ORGANIZATION_PATH_IL)).set("test")
  end

  def set_artifact(key = nil)
    return find(ta(ARTIFACT_EP)).set("test") if key ==:ep
    return find(:xpath, ARTIFACT_IL).set("test") if key ==:il
    find(:xpath, ta(ARTIFACT_TA, ARTIFACT_IL)).set("test")
  end

  def set_version(key = nil)
    return find(ta(VERSION_EP)).set("test") if key ==:ep
    return find(:xpath, VERSION_IL).set("test") if key ==:il
    find(:xpath, ta(VERSION_TA, VERSION_IL)).set("test")
  end

  def set_extention(key = nil)
    return find(ta(EXTENSION_EP)).set("test") if key ==:ep
    return find(:xpath, EXTENSION_IL).set("test") if key ==:il
    find(:xpath, ta(EXTENSION_TA, EXTENSION_IL)).set("test")
  end

  def click_warning_ok_btn(key = nil)
    return find(ta(OK_WARNING_EP)).click if key ==:ep
    return find(:xpath, OK_WARNING_IL).click if key ==:il
    find(:xpath, ta(OK_WARNING_TA, OK_WARNING_IL)).click
  end

  def click_ok_in_modal_btn(key = nil)
    return find(ta(OK_IN_MODAL_EP)).click if key ==:ep
    return find(:css, OK_IN_MODAL_IL).click if key ==:il
    find(:css, ta(OK_IN_MODAL_TA, OK_IN_MODAL_IL)).click
  end

  def click_next_btn(key = nil)
    return find(ta(NEXT_BTN_EP)).click if key ==:ep
    return find(:xpath, NEXT_BTN_IL).click if key ==:il
    find(:xpath, ta(NEXT_BTN_TA, NEXT_BTN_IL)).click
  end

  def click_multi_menu(key = nil)
    return find(ta(MULTI_MENU_BTN_EP)).click if key ==:ep
    return find(:css, MULTI_MENU_BTN_IL).click if key ==:il
    find(:css, ta(MULTI_MENU_BTN_TA, MULTI_MENU_BTN_IL)).click
  end

  def click_delete(key = nil)
    return find(ta(DELETE_EP)).click if key ==:ep
    return find(:css, DELETE_IL).click if key ==:il
    find(:css, ta(DELETE_TA, DELETE_IL)).click
  end

end