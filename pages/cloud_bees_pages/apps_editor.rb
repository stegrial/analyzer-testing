require 'spec_helper'
require 'securerandom'
require_relative '../page_extension'

class CloudBeesAppsEditor
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  ADD_NEW_COMPONENT_IL = "span.at-add-comp-to-tier-btn"
  ADD_NEW_COMPONENT_TA = "cloud_bees:apps_editor:add_new_component"

  ADD_COMPONENT_BTN_IL = "span.at-tier-cell-add-btn"
  ADD_COMPONENT_BTN_TA = "cloud_bees:apps_editor:add_component_btn"

  CREATE_NEW_APP_COMPONENT_IL = "div.at-component-scratch"
  CREATE_NEW_APP_COMPONENT_TA = "cloud_bees:apps_editor:create_new_app_component"

  NEW_COMPONENT_NAME_IL = "input.at-component-name-input"
  NEW_COMPONENT_NAME_TA = "cloud_bees:apps_editor:component_name"

  COMPONENT_DESCRIPTION_IL = "textarea.at-react-form-textarea"
  COMPONENT_DESCRIPTION_TA = "cloud_bees:apps_editor:component_description"

  COMPONENT_DROPDOWN_IL = ".at-select"
  COMPONENT_DROPDOWN_TA = "cloud_bees:apps_editor:component_dropdown"

  EC_ARTIFACTORY_IL = "//span[@title='EC-Artifactory']"
  EC_ARTIFACTORY_TA = "cloud_bees:apps_editor:ec_artifactory"

  CONFIGURATION_IL = "(//tr//input[@class='gwt-TextBox'])[1]"
  CONFIGURATION_TA = "cloud_bees:apps_editor:configuration"

  REPOSITORY_KEY_IL = "(//tr//input[@class='gwt-TextBox'])[2]"
  REPOSITORY_KEY_TA = "cloud_bees:apps_editor:repository_key"

  ORGANIZATION_PATH_IL = "(//tr//input[@class='gwt-TextBox'])[4]"
  ORGANIZATION_PATH_TA = "cloud_bees:apps_editor:organization_path"

  ARTIFACT_IL = "(//tr//input[@class='gwt-TextBox'])[6]"
  ARTIFACT_TA = "cloud_bees:apps_editor:artifact"

  VERSION_IL = "(//tr//input[@class='gwt-TextBox'])[7]"
  VERSION_TA = "cloud_bees:apps_editor:version"

  EXTENSION_IL = "(//tr//input[@class='gwt-TextBox'])[11]"
  EXTENSION_TA = "cloud_bees:apps_editor:extention"

  OK_WARNING_IL = "//div[@class='ec-wizard-btn ec-ok at-ok-btn']"
  OK_WARNING_TA = "cloud_bees:apps_editor:ok_warning_btn"

  OK_IN_MODAL_IL = "div.at-ok-btn"
  OK_IN_MODAL_TA = "cloud_bees:apps_editor:ok_in_modal_btn"

  NEXT_BTN_IL = "//div[text()='Next']"
  NEXT_BTN_TA = "cloud_bees:apps_editor:next_btn"

  MULTI_MENU_BTN_IL = "span.at-show-component-menu-btn-2"
  MULTI_MENU_BTN_TA = "cloud_bees:apps_editor:multi_menu_btn"

  DELETE_IL = "div.at-item-delete"
  DELETE_TA = "cloud_bees:apps_editor:delete_item"


  def click_add_new_component(key = nil)
    find_element(key, il_type: :css, tl: ADD_NEW_COMPONENT_TA, il: ADD_NEW_COMPONENT_IL).click
  end

  def click_component_btn(key = nil)
    find_element(key, il_type: :css, tl: ADD_COMPONENT_BTN_TA, il: ADD_COMPONENT_BTN_IL).click
  end

  def click_for_create_new_app_component(key = nil)
    find_element(key, il_type: :css, tl: CREATE_NEW_APP_COMPONENT_TA, il: CREATE_NEW_APP_COMPONENT_IL).click
  end

  def set_new_name(key = nil, value)
    find_element(key, il_type: :css, tl: NEW_COMPONENT_NAME_TA, il: NEW_COMPONENT_NAME_IL).set(value + SecureRandom.hex(5))
  end

  def set_description(key = nil, value)
    find_element(key, il_type: :css, tl: COMPONENT_DESCRIPTION_TA, il: COMPONENT_DESCRIPTION_IL).set(value + SecureRandom.hex(10))
  end

  def click_component_dropdown(key = nil)
    find_element(key, il_type: :css, tl: COMPONENT_DROPDOWN_TA, il: COMPONENT_DROPDOWN_IL).click
  end

  def click_artifactory(key = nil)
    find_element(key, il_type: :xpath, tl: EC_ARTIFACTORY_TA, il: EC_ARTIFACTORY_IL).click
  end

  def set_configuration(key = nil, value)
    find_element(key, il_type: :xpath, tl: CONFIGURATION_TA, il: CONFIGURATION_IL).set(value)
  end

  def set_repository_key(key = nil, value)
    find_element(key, il_type: :xpath, tl: REPOSITORY_KEY_TA, il: REPOSITORY_KEY_IL).set(value)
  end

  def set_organization_path(key = nil, value)
    find_element(key, il_type: :xpath, tl: ORGANIZATION_PATH_TA, il: ORGANIZATION_PATH_IL).set(value)
  end

  def set_artifact(key = nil, value)
    find_element(key, il_type: :xpath, tl: ARTIFACT_TA, il: ARTIFACT_IL).set(value)
  end

  def set_version(key = nil, value)
    find_element(key, il_type: :xpath, tl: VERSION_TA, il: VERSION_IL).set(value)
  end

  def set_extention(key = nil, value)
    find_element(key, il_type: :xpath, tl: EXTENSION_TA, il: EXTENSION_IL).set(value)
  end

  def click_warning_ok_btn(key = nil)
    find_element(key, il_type: :xpath, tl: OK_WARNING_TA, il: OK_WARNING_IL).click
  end

  def click_ok_in_modal_btn(key = nil)
    find_element(key, il_type: :css, tl: OK_IN_MODAL_TA, il: OK_IN_MODAL_IL).click
  end

  def click_next_btn(key = nil)
    find_element(key, il_type: :xpath, tl: NEXT_BTN_TA, il: NEXT_BTN_IL).click
  end

  def click_multi_menu(key = nil)
    find_element(key, il_type: :css, tl: MULTI_MENU_BTN_TA, il: MULTI_MENU_BTN_IL).click
  end

  def click_delete(key = nil)
    find_element(key, il_type: :css, tl: DELETE_TA, il: DELETE_IL).click
  end

end