require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"
require 'securerandom'
random_string = SecureRandom.hex

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
apps = CloudBeesApps.new
apps_editor = CloudBeesAppsEditor.new

# This tests runs when the vpn is ON
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end
  feature 'CloudBees - creating new application component - GWT - fields' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

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

      step "User clicks on pipeline to select" do
        apps.select_application_from_list
      end

      step "User clicks on add new application" do
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

    end

    scenario 'Searching IL', il: true do

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

      step "User clicks on humburg bth" do
        check_element_path :css  , CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu
      end

      step "User clicks on applications link" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_TA, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBeesApps::APPLICATION_FROM_LIST_TA, CloudBeesApps::APPLICATION_FROM_LIST_IL
        apps.select_application_from_list
      end

      step "User clicks on add new application" do
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
        # sleep 4
        check_element_path :xpath, CloudBeesAppsEditor::OK_WARNING_TA, CloudBeesAppsEditor::OK_WARNING_IL
        apps_editor.click_warning_ok_btn
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do


      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_EP, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field :ep, credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_EP, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field :ep, credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_EP, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
      end


      step "User clicks on humburg bth" do
        check_element_path :xpath, CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu :ep
      end

      step "User clicks on applications link" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_EP, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications :ep
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBeesApps::APPLICATION_FROM_LIST_EP, CloudBeesApps::APPLICATION_FROM_LIST_IL
        apps.select_application_from_list :ep
      end

      step "User clicks on add new application" do
        check_element_path :css, CloudBeesAppsEditor::ADD_NEW_COMPONENT_EP, CloudBeesAppsEditor::ADD_NEW_COMPONENT_IL
        apps_editor.click_add_new_component :ep
      end

      step "User clicks on component button" do
        check_element_path :css, CloudBeesAppsEditor::ADD_COMPONENT_BTN_EP, CloudBeesAppsEditor::ADD_COMPONENT_BTN_IL
        apps_editor.click_component_btn :ep
      end

      step "User clicks on create new application component" do
        check_element_path :css, CloudBeesAppsEditor::CREATE_NEW_APP_COMPONENT_EP, CloudBeesAppsEditor::CREATE_NEW_APP_COMPONENT_IL
        apps_editor.click_for_create_new_app_component :ep
      end

      step "User sets new application component name", 'appName' do |value|
        check_element_path :css, CloudBeesAppsEditor::NEW_COMPONENT_NAME_EP, CloudBeesAppsEditor::NEW_COMPONENT_NAME_IL
        apps_editor.set_new_name :ep, value
      end

      step "User sets new application component description" ,'description' do |value|
        check_element_path :css, CloudBeesAppsEditor::COMPONENT_DESCRIPTION_EP, CloudBeesAppsEditor::COMPONENT_DESCRIPTION_IL
        apps_editor.set_description :ep, value
      end

      step "User click on ok button" do
        check_element_path :xpath, CloudBeesAppsEditor::NEXT_BTN_EP, CloudBeesAppsEditor::NEXT_BTN_IL
        apps_editor.click_next_btn :ep
      end

      step "User click on dropdown" do
        check_element_path :css, CloudBeesAppsEditor::COMPONENT_DROPDOWN_EP, CloudBeesAppsEditor::COMPONENT_DROPDOWN_IL
        apps_editor.click_component_dropdown :ep
      end

      step "User select artifact" do
        check_element_path :xpath, CloudBeesAppsEditor::EC_ARTIFACTORY_EP, CloudBeesAppsEditor::EC_ARTIFACTORY_IL
        apps_editor.click_artifactory :ep
      end

      step "User set configuration text in input",'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::CONFIGURATION_EP, CloudBeesAppsEditor::CONFIGURATION_IL
        apps_editor.set_configuration :ep, value
      end

      step "User set repository in input",'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::REPOSITORY_KEY_EP, CloudBeesAppsEditor::REPOSITORY_KEY_IL
        apps_editor.set_repository_key :ep, value
      end

      step "User set organization in input" ,'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::ORGANIZATION_PATH_EP, CloudBeesAppsEditor::ORGANIZATION_PATH_IL
        apps_editor.set_organization_path :ep, value
      end

      step "User set artifact in input" ,'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::ARTIFACT_EP, CloudBeesAppsEditor::ARTIFACT_IL
        apps_editor.set_artifact :ep, value
      end

      step "User set version in input" ,'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::VERSION_EP, CloudBeesAppsEditor::VERSION_IL
        apps_editor.set_version :ep, value
      end

      step "User set extention in inputt" ,'test' do |value|
        check_element_path :xpath, CloudBeesAppsEditor::EXTENSION_EP, CloudBeesAppsEditor::EXTENSION_IL
        apps_editor.set_extention :ep, value
      end

      step "User click on ok button" do
        check_element_path :css, CloudBeesAppsEditor::OK_IN_MODAL_EP, CloudBeesAppsEditor::OK_IN_MODAL_IL
        apps_editor.click_ok_in_modal_btn :ep
      end

      step "User click on multimenu button" do
        check_element_path :css, CloudBeesAppsEditor::MULTI_MENU_BTN_EP, CloudBeesAppsEditor::MULTI_MENU_BTN_IL
        apps_editor.click_multi_menu :ep
      end

      step "User click on delete item for deleting" do
        check_element_path :css, CloudBeesAppsEditor::DELETE_EP, CloudBeesAppsEditor::DELETE_IL
        apps_editor.click_delete :ep
      end

      step "User click on ok button for accepting" do
        check_element_path :xpath, CloudBeesAppsEditor::OK_WARNING_EP, CloudBeesAppsEditor::OK_WARNING_IL
        apps_editor.click_warning_ok_btn :ep
      end
    end
  end
end