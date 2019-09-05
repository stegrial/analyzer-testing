require 'spec_helper'
require 'securerandom'
random_string = SecureRandom.hex

class CloudBeesAppsEditor
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  ADD_NEW_COMPONENT_IL = "span.at-add-comp-to-tier-btn"
  ADD_NEW_COMPONENT_TA = "cloud_bees:apps_editor:add_new_component"
  ADD_NEW_COMPONENT_EP = "EP:cloud_bees:apps_editor:add_new_component"

  ADD_COMPONENT_BTN_IL = "span.at-tier-cell-add-btn"
  ADD_COMPONENT_BTN_TA = "cloud_bees:apps_editor:add_component_btn"
  ADD_COMPONENT_BTN_EP = "EP:cloud_bees:apps_editor:add_component_btn"

  CREATE_NEW_APP_COMPONENT_IL = "div.at-component-scratch"
  CREATE_NEW_APP_COMPONENT_TA = "cloud_bees:apps_editor:create_new_app_component"
  CREATE_NEW_APP_COMPONENT_EP = "EP:cloud_bees:apps_editor:create_new_app_component"

  NEW_COMPONENT_NAME_IL = "input.at-component-name-input"
  NEW_COMPONENT_NAME_TA = "cloud_bees:apps_editor:component_name"
  NEW_COMPONENT_NAME_EP = "EP:cloud_bees:apps_editor:component_name"

  COMPONENT_DESCRIPTION_IL = "textarea.at-react-form-textarea"
  COMPONENT_DESCRIPTION_TA = "cloud_bees:apps_editor:component_description"
  COMPONENT_DESCRIPTION_EP = "EP:cloud_bees:apps_editor:component_description"

  COMPONENT_DROPDOWN_IL = ".at-select"
  COMPONENT_DROPDOWN_TA = "cloud_bees:apps_editor:component_dropdown"
  COMPONENT_DROPDOWN_EP = "EP:cloud_bees:apps_editor:component_dropdown"

  EC_ARTIFACTORY_IL = "//span[@title='EC-Artifactory']"
  EC_ARTIFACTORY_TA = "cloud_bees:apps_editor:ec_artifactory"
  EC_ARTIFACTORY_EP = "EP:cloud_bees:apps_editor:ec_artifactory"

  CONFIGURATION_IL = "(//tr//input[@class='gwt-TextBox'])[1]"
  CONFIGURATION_TA = "cloud_bees:apps_editor:configuration"
  CONFIGURATION_EP = "EP:cloud_bees:apps_editor:configuration"

  REPOSITORY_KEY_IL = "(//tr//input[@class='gwt-TextBox'])[2]"
  REPOSITORY_KEY_TA = "cloud_bees:apps_editor:repository_key"
  REPOSITORY_KEY_EP = "EP:cloud_bees:apps_editor:repository_key"

  ORGANIZATION_PATH_IL = "(//tr//input[@class='gwt-TextBox'])[4]"
  ORGANIZATION_PATH_TA = "cloud_bees:apps_editor:organization_path"
  ORGANIZATION_PATH_EP = "EP:cloud_bees:apps_editor:organization_path"

  ARTIFACT_IL = "(//tr//input[@class='gwt-TextBox'])[6]"
  ARTIFACT_TA = "cloud_bees:apps_editor:artifact"
  ARTIFACT_EP = "EP:cloud_bees:apps_editor:artifact"

  VERSION_IL = "(//tr//input[@class='gwt-TextBox'])[7]"
  VERSION_TA = "cloud_bees:apps_editor:version"
  VERSION_EP = "EP:cloud_bees:apps_editor:version"

  EXTENSION_IL = "(//tr//input[@class='gwt-TextBox'])[11]"
  EXTENSION_TA = "cloud_bees:apps_editor:extention"
  EXTENSION_EP = "EP:cloud_bees:apps_editor:extention"

  OK_WARNING_IL = "//div[@class='ec-wizard-btn ec-ok at-ok-btn']"
  OK_WARNING_TA = "cloud_bees:apps_editor:ok_warning_btn"
  OK_WARNING_EP = "EP:cloud_bees:apps_editor:ok_warning_btn"

  OK_IN_MODAL_IL = "div.at-ok-btn"
  OK_IN_MODAL_TA = "cloud_bees:apps_editor:ok_in_modal_btn"
  OK_IN_MODAL_EP = "EP:cloud_bees:apps_editor:ok_in_modal_btn"

  NEXT_BTN_IL = "//div[text()='Next']"
  NEXT_BTN_TA = "cloud_bees:apps_editor:next_btn"
  NEXT_BTN_EP = "EP:cloud_bees:apps_editor:next_btn"

  MULTI_MENU_BTN_IL = "span.at-show-component-menu-btn-2"
  MULTI_MENU_BTN_TA = "cloud_bees:apps_editor:multi_menu_btn"
  MULTI_MENU_BTN_EP = "EP:cloud_bees:apps_editor:multi_menu_btn"

  DELETE_IL = "div.at-item-delete"
  DELETE_TA = "cloud_bees:apps_editor:delete_item"
  DELETE_EP = "EP:cloud_bees:apps_editor:delete_item"


  def click_add_new_component(key = nil)
    return find(ta(ADD_NEW_COMPONENT_EP)).click if key == :ep
    return find(:css, ADD_NEW_COMPONENT_IL).click if key == :il
    find(:css, ta(ADD_NEW_COMPONENT_TA, ADD_NEW_COMPONENT_IL)).click
  end

  def click_component_btn(key = nil)
    return find(ta(ADD_COMPONENT_BTN_EP)).click if key == :ep
    return find(:css, ADD_COMPONENT_BTN_IL).click if key == :il
    find(:css, ta(ADD_COMPONENT_BTN_TA, ADD_COMPONENT_BTN_IL)).click
  end

  def click_for_create_new_app_component(key = nil)
    return find(ta(CREATE_NEW_APP_COMPONENT_EP)).click if key == :ep
    return find(:css, CREATE_NEW_APP_COMPONENT_IL).click if key == :il
    find(:css, ta(CREATE_NEW_APP_COMPONENT_TA, CREATE_NEW_APP_COMPONENT_IL)).click
  end

  def set_new_name(key = nil, value)
    return find(ta(NEW_COMPONENT_NAME_EP)).set(value + SecureRandom.hex(5)) if key == :ep
    return find(:css, NEW_COMPONENT_NAME_IL).set(value + SecureRandom.hex(5)) if key == :il
    find(:css, ta(NEW_COMPONENT_NAME_TA, NEW_COMPONENT_NAME_IL)).set(value + SecureRandom.hex(5))
  end

  def set_description(key = nil, value)
    return find(ta(COMPONENT_DESCRIPTION_EP)).set(value + SecureRandom.hex(10)) if key == :ep
    return find(:css, COMPONENT_DESCRIPTION_IL).set(value + SecureRandom.hex(10)) if key == :il
    find(:css, ta(COMPONENT_DESCRIPTION_TA, COMPONENT_DESCRIPTION_IL)).set(value + SecureRandom.hex(10))
  end

  def click_component_dropdown(key = nil)
    return find(ta(COMPONENT_DROPDOWN_EP)).click if key == :ep
    return find(:css, COMPONENT_DROPDOWN_IL).click if key == :il
    find(:css, ta(COMPONENT_DROPDOWN_TA, COMPONENT_DROPDOWN_IL)).click
  end

  def click_artifactory(key = nil)
    return find(ta(EC_ARTIFACTORY_EP)).click if key == :ep
    return find(:xpath, EC_ARTIFACTORY_IL).click if key == :il
    find(:xpath, ta(EC_ARTIFACTORY_TA, EC_ARTIFACTORY_IL)).click
  end

  def set_configuration(key = nil, value)
    return find(ta(CONFIGURATION_EP)).set(value) if key == :ep
    return find(:xpath, CONFIGURATION_IL).set(value) if key == :il
    find(:xpath, ta(CONFIGURATION_TA, CONFIGURATION_IL)).set(value)
  end

  def set_repository_key(key = nil,value)
    return find(ta(REPOSITORY_KEY_EP)).set(value) if key == :ep
    return find(:xpath, REPOSITORY_KEY_IL).set(value) if key == :il
    find(:xpath, ta(REPOSITORY_KEY_TA, REPOSITORY_KEY_IL)).set(value)
  end

  def set_organization_path(key = nil, value)
    return find(ta(ORGANIZATION_PATH_EP)).set(value) if key == :ep
    return find(:xpath, ORGANIZATION_PATH_IL).set(value) if key == :il
    find(:xpath, ta(ORGANIZATION_PATH_TA, ORGANIZATION_PATH_IL)).set(value)
  end

  def set_artifact(key = nil, value)
    return find(ta(ARTIFACT_EP)).set(value) if key == :ep
    return find(:xpath, ARTIFACT_IL).set(value) if key == :il
    find(:xpath, ta(ARTIFACT_TA, ARTIFACT_IL)).set(value)
  end

  def set_version(key = nil, value)
    return find(ta(VERSION_EP)).set(value) if key == :ep
    return find(:xpath, VERSION_IL).set(value) if key == :il
    find(:xpath, ta(VERSION_TA, VERSION_IL)).set(value)
  end

  def set_extention(key = nil, value)
    return find(ta(EXTENSION_EP)).set(value) if key == :ep
    return find(:xpath, EXTENSION_IL).set(value) if key == :il
    find(:xpath, ta(EXTENSION_TA, EXTENSION_IL)).set(value)
  end

  def click_warning_ok_btn(key = nil)
    return find(ta(OK_WARNING_EP)).click if key == :ep
    return find(:xpath, OK_WARNING_IL).click if key == :il
    find(:xpath, ta(OK_WARNING_TA, OK_WARNING_IL)).click
  end

  def click_ok_in_modal_btn(key = nil)
    return find(ta(OK_IN_MODAL_EP)).click if key == :ep
    return find(:css, OK_IN_MODAL_IL).click if key == :il
    find(:css, ta(OK_IN_MODAL_TA, OK_IN_MODAL_IL)).click
  end

  def click_next_btn(key = nil)
    return find(ta(NEXT_BTN_EP)).click if key == :ep
    return find(:xpath, NEXT_BTN_IL).click if key == :il
    find(:xpath, ta(NEXT_BTN_TA, NEXT_BTN_IL)).click
  end

  def click_multi_menu(key = nil)
    return find(ta(MULTI_MENU_BTN_EP)).click if key == :ep
    return find(:css, MULTI_MENU_BTN_IL).click if key == :il
    find(:css, ta(MULTI_MENU_BTN_TA, MULTI_MENU_BTN_IL)).click
  end

  def click_delete(key = nil)
    return find(ta(DELETE_EP)).click if key == :ep
    return find(:css, DELETE_IL).click if key == :il
    find(:css, ta(DELETE_TA, DELETE_IL)).click
  end


end