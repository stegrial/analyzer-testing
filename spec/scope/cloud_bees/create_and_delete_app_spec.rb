require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
apps_page = CloudBeesApps.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Creating and Deleting application' do

    scenario 'Test - Recording', record: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field credentials['username']
        login_page.fill_pass_field credentials['pass']
        login_page.click_sign_in_button
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu :il #step is duplicated below
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        global_page.click_applications :il #step is duplicated below
      end

      step "Admin clicks on the new application button" do
        apps_page.click_new_application
      end

      step "Admin clicks on the create new application button" do
        apps_page.create_new_application
      end

      step "Admin fills the application name field", settings('cloud_bees')['app_name'] do |appname|
        apps_page.fill_application_name_field appname
      end

      step "Admin clicks on the Select project drop-down" do
        apps_page.click_on_select_project
      end

      step "Admin select on the drop-down Default project" do
        apps_page.select_default_project
      end

      step "Admin confirm new application" do
        apps_page.confirm_create_new_application
      end

      step "Admin clicks on the Component tier" do
        apps_page.click_component_tier
      end

      step "Admin clicks on the Create new Component" do
        apps_page.create_new_component
      end

      step "Admin fills the component name field", "component_test_name" do |compname|
        apps_page.fill_component_name_field compname
      end

      step "Admin clicks on the Next button in the modal component" do
        apps_page.click_component_next
      end

      step "Admin clicks on the Content location drop-down" do
        apps_page.click_on_content_location
      end

      step "Admin select on the drop-down EC-Artifact" do
        apps_page.select_ec_artifact
      end

      step "Admin fills the artifact name field", "artifact_test_name" do |artname|
        apps_page.fill_artifact_name_field artname
      end

      step "Admin clicks on the OK button" do
        apps_page.confirm_new_artifact
        sleep 3 # to wait for a new artifact to be created
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        global_page.click_applications
      end

      step "Admin find application name", settings('cloud_bees')['app_name'] do |appname|
        apps_page.find_application_name_field appname
        sleep 3 # need wait for the filter will be applied
      end

      step "Admin clicks on new created application" do
        apps_page.select_app_list_item
      end

      step "Admin clicks on delete button" do
        apps_page.delete_application
      end

      step "Admin clicks on the OK button" do
        apps_page.confirm_delete_application
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

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_TA, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications
      end

      step "Admin clicks on the new application button" do
        check_element_path :xpath, CloudBeesApps::NEW_APPLICATION_BTN_TA, CloudBeesApps::NEW_APPLICATION_BTN_IL
        apps_page.click_new_application
      end

      step "Admin clicks on the create new application button" do
        check_element_path :xpath, CloudBeesApps::CREATE_NEW_APPLICATION_TA, CloudBeesApps::CREATE_NEW_APPLICATION_IL
        apps_page.create_new_application
      end

      step "Admin fills the application name field", settings('cloud_bees')['app_name'] do |appname|
        check_element_path :xpath, CloudBeesApps::APPLICATION_NAME_TA, CloudBeesApps::APPLICATION_NAME_IL
        apps_page.fill_application_name_field appname
      end

      step "Admin clicks on the Select project drop-down" do
        check_element_path :xpath, CloudBeesApps::SELECT_PROJECT_TA, CloudBeesApps::SELECT_PROJECT_IL
        apps_page.click_on_select_project
      end

      step "Admin select on the drop-down Default project" do
        check_element_path :xpath, CloudBeesApps::SELECT_DEFAULT_PROJECT_TA, CloudBeesApps::SELECT_DEFAULT_PROJECT_IL
        apps_page.select_default_project
      end

      step "Admin confirm new application" do
        check_element_path :xpath, CloudBeesApps::CONFIRM_NEW_APPLICATION_TA, CloudBeesApps::CONFIRM_NEW_APPLICATION_IL
        apps_page.confirm_create_new_application
      end

      step "Admin clicks on the Component tier" do
        check_element_path :xpath, CloudBeesApps::COMPONENT_TIER_TA, CloudBeesApps::COMPONENT_TIER_IL
        apps_page.click_component_tier
      end

      step "Admin clicks on the Create new Component" do
        check_element_path :xpath, CloudBeesApps::CREATE_NEW_COMPONENT_TA, CloudBeesApps::CREATE_NEW_COMPONENT_IL
        apps_page.create_new_component
      end

      step "Admin fills the component name field", "component_test_name" do |compname|
        check_element_path :xpath, CloudBeesApps::COMPONENT_NAME_TA, CloudBeesApps::COMPONENT_NAME_IL
        apps_page.fill_component_name_field compname
      end

      step "Admin clicks on the Next button in the modal component" do
        check_element_path :xpath, CloudBeesApps::COMPONENT_NEXT_TA, CloudBeesApps::COMPONENT_NEXT_IL
        apps_page.click_component_next
      end

      step "Admin clicks on the Content location drop-down" do
        check_element_path :xpath, CloudBeesApps::CONTENT_LOCATION_TA, CloudBeesApps::CONTENT_LOCATION_IL
        apps_page.click_on_content_location
      end

      step "Admin select on the drop-down EC-Artifact" do
        check_element_path :xpath, CloudBeesApps::SELECT_EC_ARTIFACT_TA, CloudBeesApps::SELECT_EC_ARTIFACT_IL
        apps_page.select_ec_artifact
      end

      step "Admin fills the artifact name field", "artifact_test_name" do |artname|
        check_element_path :xpath, CloudBeesApps::ARTIFACT_NAME_TA, CloudBeesApps::ARTIFACT_NAME_IL
        apps_page.fill_artifact_name_field artname
      end

      step "Admin click on the OK button" do
        check_element_path :xpath, CloudBeesApps::CONFIRM_NEW_ARTIFACT_TA, CloudBeesApps::CONFIRM_NEW_ARTIFACT_IL
        apps_page.confirm_new_artifact
        sleep 3 # to wait for a new artifact to be created
      end

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_TA, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications
      end

      step "Admin find application name", settings('cloud_bees')['app_name'] do |appname|
        check_element_path :css, CloudBeesApps::FIND_APPLICATION_FIELD_TA, CloudBeesApps::FIND_APPLICATION_FIELD_IL
        apps_page.find_application_name_field appname
        sleep 3 # need wait for the filter will be applied
      end

      step "Admin clicks on new created application" do
        check_element_path :css, CloudBeesApps::APPLICATION_LIST_ITEM_TA, CloudBeesApps::APPLICATION_LIST_ITEM_IL
        apps_page.select_app_list_item
      end

      step "Admin clicks on delete button" do
        check_element_path :xpath, CloudBeesApps::DELETE_APPLICATION_TA, CloudBeesApps::DELETE_APPLICATION_IL
        apps_page.delete_application
      end

      step "Admin clicks on the OK button" do
        check_element_path :xpath, CloudBeesApps::CONFIRM_DELETE_APPLICATION_TA, CloudBeesApps::CONFIRM_DELETE_APPLICATION_IL
        apps_page.confirm_delete_application
      end

      sleep 3
    end

  end
end