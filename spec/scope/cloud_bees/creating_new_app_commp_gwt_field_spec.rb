require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
apps = CloudBeesApps.new
apps_editor = CloudBeesAppsEditor.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Creating new application component - GWT - fields' do

    scenario 'Test - Recording', record: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field credentials['username']
        login_page.fill_pass_field credentials['pass']
        login_page.click_sign_in_button
      end

      step "User clicks on hamburger menu" do
        global_page.click_hamburger_menu
      end
      step "User clicks on applications link" do
        global_page.click_applications
      end

      step "User clicks on application from list" do
        apps.select_application_from_list
      end

      step "User clicks on add new component" do
        apps_editor.click_add_new_component
      end

      step "User clicks on component button" do
        apps_editor.click_component_btn
      end

      step "User clicks on create new application component" do
        apps_editor.click_for_create_new_app_component
      end

      step "User sets new application component name", 'appName' do |value|
        apps_editor.set_new_name value
      end

      step "User sets new application component description",'description' do |value|
        apps_editor.set_description value
      end

      step "User click on ok button" do
        apps_editor.click_next_btn
      end

      step "User click on dropdown" do
        sleep 3
        apps_editor.click_component_dropdown
      end

      step "User select artifact" do
        apps_editor.click_artifactory
      end

      step "User set configuration text in input", 'test' do |value|
        apps_editor.set_configuration value
      end

      step "User set repository in input",'test' do |value|
        apps_editor.set_repository_key value
      end

      step "User set organization in input",'test' do |value|
        apps_editor.set_organization_path value
      end

      step "User set artifact in input",'test' do |value|
        apps_editor.set_artifact value
      end

      step "User set version in input",'test' do |value|
        apps_editor.set_version value
      end

      step "User set extention in inputt",'test' do |value|
        apps_editor.set_extention value
      end

      step "User click on ok button" do
        sleep 5
        apps_editor.click_ok_in_modal_btn
      end

      step "User click on multimenu button" do
        apps_editor.click_multi_menu
      end

      step "User click on delete item for deleting" do
        apps_editor.click_delete
      end

      step "User click on ok button for accepting" do
        apps_editor.click_warning_ok_btn
      end

      sleep 3
    end

    scenario 'Test - Searching', search: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_TA, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_TA, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "User clicks on hamburger bth" do
        check_element_path :css  , CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu
      end

      step "User clicks on applications link" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_TA, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications
      end

      step "User clicks on application from list" do
        check_element_path :xpath, CloudBeesApps::APPLICATION_FROM_LIST_TA, CloudBeesApps::APPLICATION_FROM_LIST_IL
        apps.select_application_from_list
      end

      step "User clicks on add new component" do
        check_element_path :css, CloudBeesAppsEditor::ADD_NEW_COMPONENT_TA, CloudBeesAppsEditor::ADD_NEW_COMPONENT_IL
        apps_editor.click_add_new_component
      end

      step "User clicks on component button" do
        check_element_path :css, CloudBeesAppsEditor::ADD_COMPONENT_BTN_TA, CloudBeesAppsEditor::ADD_COMPONENT_BTN_IL
        apps_editor.click_component_btn
      end

      step "User clicks on create new application component" do
        check_element_path :css, CloudBeesAppsEditor::CREATE_NEW_APP_COMPONENT_TA, CloudBeesAppsEditor::CREATE_NEW_APP_COMPONENT_IL
        apps_editor.click_for_create_new_app_component
      end

      step "User sets new application component name", 'appName' do |value|
        check_element_path :css, CloudBeesAppsEditor::NEW_COMPONENT_NAME_TA, CloudBeesAppsEditor::NEW_COMPONENT_NAME_IL
        apps_editor.set_new_name value
      end

      step "User sets new application component description",'description' do |value|
        check_element_path :css, CloudBeesAppsEditor::COMPONENT_DESCRIPTION_TA, CloudBeesAppsEditor::COMPONENT_DESCRIPTION_IL
        apps_editor.set_description value
      end

      step "User click on ok button" do
        check_element_path :xpath, CloudBeesAppsEditor::NEXT_BTN_TA, CloudBeesAppsEditor::NEXT_BTN_IL
        apps_editor.click_next_btn
      end

      step "User click on dropdown" do
        sleep 3
        check_element_path :css, CloudBeesAppsEditor::COMPONENT_DROPDOWN_TA, CloudBeesAppsEditor::COMPONENT_DROPDOWN_IL
        apps_editor.click_component_dropdown
      end

      step "User select artifact" do
        check_element_path :xpath, CloudBeesAppsEditor::EC_ARTIFACTORY_TA, CloudBeesAppsEditor::EC_ARTIFACTORY_IL
        apps_editor.click_artifactory
      end

      step "User set configuration text in input",'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::CONFIGURATION_TA, CloudBeesAppsEditor::CONFIGURATION_IL
        apps_editor.set_configuration value
      end

      step "User set repository in input",'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::REPOSITORY_KEY_TA, CloudBeesAppsEditor::REPOSITORY_KEY_IL
        apps_editor.set_repository_key value
      end

      step "User set organization in input" ,'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::ORGANIZATION_PATH_TA, CloudBeesAppsEditor::ORGANIZATION_PATH_IL
        apps_editor.set_organization_path value
      end

      step "User set artifact in input" ,'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::ARTIFACT_TA, CloudBeesAppsEditor::ARTIFACT_IL
        apps_editor.set_artifact value
      end

      step "User set version in input",'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::VERSION_TA, CloudBeesAppsEditor::VERSION_IL
        apps_editor.set_version value
      end

      step "User set extention in inputt" ,'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::EXTENSION_TA, CloudBeesAppsEditor::EXTENSION_IL
        apps_editor.set_extention value
      end

      step "User click on ok button" do
        check_element_path :css, CloudBeesAppsEditor::OK_IN_MODAL_TA, CloudBeesAppsEditor::OK_IN_MODAL_IL
        apps_editor.click_ok_in_modal_btn
      end

      step "User click on multimenu button" do
        check_element_path :css, CloudBeesAppsEditor::MULTI_MENU_BTN_TA, CloudBeesAppsEditor::MULTI_MENU_BTN_IL
        apps_editor.click_multi_menu
      end

      step "User click on delete item for deleting" do
        check_element_path :css, CloudBeesAppsEditor::DELETE_TA, CloudBeesAppsEditor::DELETE_IL
        apps_editor.click_delete
      end

      step "User click on ok button for accepting" do
        check_element_path :xpath, CloudBeesAppsEditor::OK_WARNING_TA, CloudBeesAppsEditor::OK_WARNING_IL
        apps_editor.click_warning_ok_btn
      end

      sleep 3
    end

  end
end