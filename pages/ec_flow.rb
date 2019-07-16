require 'spec_helper'

class Ecflow

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  LOGIN_IL = "//input[@id='username']"
  LOGIN_TA = "ec_flow:login"
  LOGIN_EP = "EP:ec_flow:login"

  PASSWORD_IL = "//input[@id='password']"
  PASSWORD_TA = "ec_flow:password"
  PASSWORD_EP = "EP:ec_flow:password"

  LOGIN_BTN_IL = "//button[text()='Login']"
  LOGIN_BTN_TA = "ec_flow:login_bth"
  LOGIN_BTN_EP = "EP:ec_flow:login_btn"

  HUMBURG_BTN_IL = "//div[@class='at-main-menu-btn ch-icon-container menu']"
  HUMBURG_BTN_TA = "ec_flow:humburg"
  HUMBURG_BTN_EP = "EP:ec_flow:humburg"

  PIPELINES_IL = "//a[@class='black-link nav-menu-category__item at-main-menu-pipelines']"
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

  OK_BTN_IL = "div.at-ok-btn"
  OK_BTN_TA = "ec_flow:ok_btn"
  OK_BTN_EP = "EP:ec_flow:ok_btn"

  OK_WARNING_IL = "//div[@class='ec-wizard-btn ec-ok at-ok-btn']"
  OK_WARNING_TA = "ec_flow:ok_warning_btn"
  OK_WARNING_EP = "EP:ec_flow:ok_warning_btn"

  # Ok_IN_MODAL_IL = "//div[@class='ec-react-wizard__window']//div[@class='ec-wizard-btn ec-ok at-ok-btn']"
  Ok_IN_MODAL_IL = "div.at-ok-btn"
  Ok_IN_MODAL_TA = "ec_flow:ok_in_modal_btn"
  Ok_IN_MODAL_EP = "EP:ec_flow:ok_in_modal_btn"

  NEXT_BTN_IL = "//div[text()='Next']"
  NEXT_BTN_TA = "ec_flow:ok_btn"
  NEXT_BTN_EP = "EP:ec_flow:ok_btn"

  MULTI_MENU_BTN_IL = "span.at-show-component-menu-btn-2"
  MULTI_MENU_BTN_TA = "ec_flow:multi_menu_btn"
  MULTI_MENU_BTN_EP = "EP:ec_flow:multi_menu_btn"

  DELETE_IL = "div.at-item-delete"
  DELETE_TA = "ec_flow:delete_item"
  DELETE_EP = "EP:ec_flow:delete_item"


  def set_login(key = nil,login)
    return find(ta(LOGIN_EP)).set(login) if key ==:ep
    return find(:xpath, ta(LOGIN_IL)).set(login) if key ==:il
    find(:xpath, ta(LOGIN_TA, LOGIN_IL)).set(login)
  end

  def set_password(key = nil,pass)
    return find(ta(PASSWORD_EP)).set(pass) if key ==:ep
    return find(:xpath, ta(PASSWORD_IL)).set(pass) if key ==:il
    find(:xpath, ta(PASSWORD_TA, PASSWORD_IL)).set(pass)
  end

  def click_login_btn(key = nil)
    return find(ta(LOGIN_BTN_EP)).click() if key ==:ep
    return find(:xpath, ta(LOGIN_BTN_IL)).click() if key ==:il
    find(:xpath, ta(LOGIN_BTN_TA, LOGIN_BTN_IL)).click()
  end

  def click_humburg_btn(key = nil)
    return find(ta(HUMBURG_BTN_EP)).click() if key ==:ep
    return find(:xpath, ta(HUMBURG_BTN_IL)).click() if key ==:il
    find(:xpath, ta(HUMBURG_BTN_TA, HUMBURG_BTN_IL)).click()
  end

  def click_pipelines(key = nil)
    return find(ta(PIPELINES_EP)).click() if key ==:ep
    return find(:xpath, ta(PIPELINES_IL)).click() if key ==:il
    find(:xpath, ta(PIPELINES_TA, PIPELINES_IL)).click()
  end

  def choose_pipeline_from_list(key = nil)
    return find(ta(CHOOSE_PIPELINE_EP)).click() if key ==:ep
    return find(:xpath, ta(CHOOSE_PIPELINE_IL)).click() if key ==:il
    find(:xpath, ta(CHOOSE_PIPELINE_TA, CHOOSE_PIPELINE_IL)).click()
  end

  def click_applications(key = nil)
    return find(ta(APPLICATIONS_EP)).click() if key ==:ep
    return find(:css, ta(APPLICATIONS_IL)).click() if key ==:il
    find(:css, ta(APPLICATIONS_TA, APPLICATIONS_IL)).click()
  end

  def select_application_from_list(key = nil)
    return find(ta(APPLICATION_FROM_LIST_EP)).click() if key ==:ep
    return find(:xpath, ta(APPLICATION_FROM_LIST_IL)).click() if key ==:il
    find(:xpath, ta(APPLICATION_FROM_LIST_TA, APPLICATION_FROM_LIST_IL)).click()
  end

  def click_add_new_component(key = nil)
    return find(ta(ADD_NEW_COMPONENT_EP)).click() if key ==:ep
    return find(:css, ta(ADD_NEW_COMPONENT_IL)).click() if key ==:il
    find(:css, ta(ADD_NEW_COMPONENT_TA, ADD_NEW_COMPONENT_IL)).click()
  end

  def click_component_btn(key = nil)
    return find(ta(ADD_COMPONENT_BTN_EP)).click() if key ==:ep
    return find(:css, ta(ADD_COMPONENT_BTN_IL)).click() if key ==:il
    find(:css, ta(ADD_COMPONENT_BTN_TA, ADD_COMPONENT_BTN_IL)).click()
  end

  def click_for_create_new_app_component(key = nil)
    return find(ta(CREATE_NEW_APP_COMPONENT_EP)).click() if key ==:ep
    return find(:css, ta(CREATE_NEW_APP_COMPONENT_IL)).click() if key ==:il
    find(:css, ta(CREATE_NEW_APP_COMPONENT_TA, CREATE_NEW_APP_COMPONENT_IL)).click()
  end

  def set_new_name(key = nil)
    return find(ta(NEW_COMPONENT_NAME_EP)).set("") if key ==:ep
    return find(:css, ta(NEW_COMPONENT_NAME_IL)).set("") if key ==:il
    find(:css, ta(NEW_COMPONENT_NAME_TA, NEW_COMPONENT_NAME_IL)).set("appName"+SecureRandom.hex(5))
  end

  def set_description(key = nil)
    return find(ta(COMPONENT_DESCRIPTION_EP)).click() if key ==:ep
    return find(:css, ta(COMPONENT_DESCRIPTION_IL)).click() if key ==:il
    find(:css, ta(COMPONENT_DESCRIPTION_TA, COMPONENT_DESCRIPTION_IL)).click()
  end

  def click_component_dropdown(key = nil)
    return find(ta(COMPONENT_DROPDOWN_EP)).click() if key ==:ep
    return find(:css, ta(COMPONENT_DROPDOWN_IL)).click() if key ==:il
    find(:css, ta(COMPONENT_DROPDOWN_TA, COMPONENT_DROPDOWN_IL)).click()
  end

  def click_artifact(key = nil)
    return find(ta(EC_ARTIFACTORY_EP)).click() if key ==:ep
    return find(:xpath, ta(EC_ARTIFACTORY_IL)).click() if key ==:il
    find(:xpath, ta(EC_ARTIFACTORY_TA, EC_ARTIFACTORY_IL)).click()
  end

  def set_configuration(key = nil)
    return find(ta(CONFIGURATION_EP)).set("test") if key ==:ep
    return find(:xpath, ta(CONFIGURATION_IL)).set("test") if key ==:il
    find(:xpath, ta(CONFIGURATION_TA, CONFIGURATION_IL)).set("test")
  end

  def set_repository_key(key = nil)
    return find(ta(REPOSITORY_KEY_EP)).set("test") if key ==:ep
    return find(:xpath, ta(REPOSITORY_KEY_IL)).set("test") if key ==:il
    find(:xpath, ta(REPOSITORY_KEY_TA, REPOSITORY_KEY_IL)).set("test")
  end

  def set_organization_path(key = nil)
    return find(ta(ORGANIZATION_PATH_EP)).set("test") if key ==:ep
    return find(:xpath, ta(ORGANIZATION_PATH_IL)).set("test") if key ==:il
    find(:xpath, ta(ORGANIZATION_PATH_TA, ORGANIZATION_PATH_IL)).set("test")
  end

  def set_artifact(key = nil)
    return find(ta(ARTIFACT_EP)).set("test") if key ==:ep
    return find(:xpath, ta(ARTIFACT_IL)).set("test") if key ==:il
    find(:xpath, ta(ARTIFACT_TA, ARTIFACT_IL)).set("test")
  end

  def set_version(key = nil)
    return find(ta(VERSION_EP)).set("test") if key ==:ep
    return find(:xpath, ta(VERSION_IL)).set("test") if key ==:il
    find(:xpath, ta(VERSION_TA, VERSION_IL)).set("test")
  end

  def set_extention(key = nil)
    return find(ta(EXTENSION_EP)).set("test") if key ==:ep
    return find(:xpath, ta(EXTENSION_IL)).set("test") if key ==:il
    find(:xpath, ta(EXTENSION_TA, EXTENSION_IL)).set("test")
  end

  def click_ok_btn(key = nil)
    return find(ta(OK_BTN_EP)).click() if key ==:ep
    return find(:css, ta(OK_BTN_IL)).click() if key ==:il
    find(:css, ta(OK_BTN_TA, OK_BTN_IL)).click()
  end

  def click_warning_ok_btn(key = nil)
    return find(ta(OK_WARNING_EP)).click() if key ==:ep
    return find(:xpath, ta(OK_WARNING_IL)).click() if key ==:il
    find(:xpath, ta(OK_WARNING_TA, OK_WARNING_IL)).click()
  end

  def click_ok_in_modal_btn(key = nil)
    return find(ta(Ok_IN_MODAL_EP)).click() if key ==:ep
    return find(:css, ta(Ok_IN_MODAL_IL)).click() if key ==:il
    find(:css, ta(Ok_IN_MODAL_TA, Ok_IN_MODAL_IL)).click()
  end

  def click_next_btn(key = nil)
    return find(ta(NEXT_BTN_EP)).click() if key ==:ep
    return find(:xpath, ta(NEXT_BTN_IL)).click() if key ==:il
    find(:xpath, ta(NEXT_BTN_TA, NEXT_BTN_IL)).click()
  end

  def click_multi_menu(key = nil)
    return find(ta(MULTI_MENU_BTN_EP)).click() if key ==:ep
    return find(:css, ta(MULTI_MENU_BTN_IL)).click() if key ==:il
    find(:css, ta(MULTI_MENU_BTN_TA, MULTI_MENU_BTN_IL)).click()
  end

  def click_delete(key = nil)
    return find(ta(DELETE_EP)).click() if key ==:ep
    return find(:css, ta(DELETE_IL)).click() if key ==:il
    find(:css, ta(DELETE_TA, DELETE_IL)).click()
  end
end