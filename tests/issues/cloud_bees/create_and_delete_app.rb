require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
apps_page = CloudBeesApps.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Creating and Deleting application' do

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

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        global_page.click_applications
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

      step "Admin clicks on the Create new  Component" do
        apps_page.create_new_component
      end

      step "Admin fills the component name field", settings('cloud_bees')['component_name'] do |compname|
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

      step "Admin fills the artifact name field", settings('cloud_bees')['artifact_name'] do |artname|
        apps_page.fill_artifact_name_field artname
      end

      step "Admin click on the OK button" do
        apps_page.confirm_new_artifact
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        global_page.click_applications
      end

      step "Admin find application name", settings('cloud_bees')['app_name'] do |appname|
        apps_page.find_application_name_field appname
      end

      step "Admin clicks on new created application" do
        apps_page.choose_application
      end

      step "Admin clicks on delete button" do
        apps_page.delete_application
      end

      step "Admin clicks on the OK button" do
        apps_page.confirm_delete_application
      end

      sleep 3
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

      sleep 3
      #Next step is problematic
      step "Admin select on the drop-down Default project" do
        check_element_path :xpath, CloudBeesApps::SELECT_DEFAULT_PROJECT_TA, CloudBeesApps::SELECT_DEFAULT_PROJECT_IL
        apps_page.select_default_project
      end

      step "Admin confirm new application" do
        check_element_path :xpath, CloudBeesApps::CONFIRM_NEW_APPLICATION_TA, CloudBeesApps::CONFIRM_NEW_APPLICATION_IL
        apps_page.confirm_create_new_application
      end

      sleep 3
      #Next step is problematic
      step "Admin clicks on the Component tier" do
        check_element_path :xpath, CloudBeesApps::COMPONENT_TIER_TA, CloudBeesApps::COMPONENT_TIER_IL
        apps_page.click_component_tier
      end

      step "Admin clicks on the Create new  Component" do
        check_element_path :xpath, CloudBeesApps::CREATE_NEW_COMPONENT_TA, CloudBeesApps::CREATE_NEW_COMPONENT_IL
        apps_page.create_new_component
      end

      step "Admin fills the component name field", settings('cloud_bees')['component_name'] do |compname|
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

      step "Admin fills the artifact name field", settings('cloud_bees')['artifact_name'] do |artname|
        check_element_path :xpath, CloudBeesApps::ARTIFACT_NAME_TA, CloudBeesApps::ARTIFACT_NAME_IL
        apps_page.fill_artifact_name_field artname
      end

      step "Admin click on the OK button" do
        check_element_path :xpath, CloudBeesApps::CONFIRM_NEW_ARTIFACT_TA, CloudBeesApps::CONFIRM_NEW_ARTIFACT_IL
        apps_page.confirm_new_artifact
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
        check_element_path :xpath, CloudBeesApps::FIND_APPLICATION_FIELD_TA, CloudBeesApps::FIND_APPLICATION_FIELD_IL
        apps_page.find_application_name_field appname
      end

      step "Admin clicks on new created application" do
        check_element_path :xpath, CloudBeesApps::CHOOSE_APPLICATION_TA, CloudBeesApps::CHOOSE_APPLICATION_IL
        apps_page.choose_application
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

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu :ep
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_EP, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications :ep
      end

      step "Admin clicks on the new application button" do
        check_element_path :xpath, CloudBeesApps::NEW_APPLICATION_BTN_EP, CloudBeesApps::NEW_APPLICATION_BTN_IL
        apps_page.click_new_application :ep
      end

      step "Admin clicks on the create new application button" do
        check_element_path :xpath, CloudBeesApps::CREATE_NEW_APPLICATION_EP, CloudBeesApps::CREATE_NEW_APPLICATION_IL
        apps_page.create_new_application :ep
      end

      step "Admin fills the application name field", settings('cloud_bees')['app_name'] do |appname|
        check_element_path :xpath, CloudBeesApps::APPLICATION_NAME_EP, CloudBeesApps::APPLICATION_NAME_IL
        apps_page.fill_application_name_field :ep, appname
      end

      step "Admin clicks on the Select project drop-down" do
        check_element_path :xpath, CloudBeesApps::SELECT_PROJECT_EP, CloudBeesApps::SELECT_PROJECT_IL
        apps_page.click_on_select_project :ep
      end

      sleep 3
      #Next step is problematic
      step "Admin select on the drop-down Default project" do
        check_element_path :xpath, CloudBeesApps::SELECT_DEFAULT_PROJECT_EP, CloudBeesApps::SELECT_DEFAULT_PROJECT_IL
        apps_page.select_default_project :ep
      end

      step "Admin confirm new application" do
        check_element_path :xpath, CloudBeesApps::CONFIRM_NEW_APPLICATION_EP, CloudBeesApps::CONFIRM_NEW_APPLICATION_IL
        apps_page.confirm_create_new_application :ep
      end

      sleep 3
      #Next step is problematic
      step "Admin clicks on the Component tier" do
        check_element_path :xpath, CloudBeesApps::COMPONENT_TIER_EP, CloudBeesApps::COMPONENT_TIER_IL
        apps_page.click_component_tier :ep
      end

      step "Admin clicks on the Create new  Component" do
        check_element_path :xpath, CloudBeesApps::CREATE_NEW_COMPONENT_EP, CloudBeesApps::CREATE_NEW_COMPONENT_IL
        apps_page.create_new_component :ep
      end

      step "Admin fills the component name field", settings('cloud_bees')['component_name'] do |compname|
        check_element_path :xpath, CloudBeesApps::COMPONENT_NAME_EP, CloudBeesApps::COMPONENT_NAME_IL
        apps_page.fill_component_name_field :ep, compname
      end

      step "Admin clicks on the Next button in the modal component" do
        check_element_path :xpath, CloudBeesApps::COMPONENT_NEXT_EP, CloudBeesApps::COMPONENT_NEXT_IL
        apps_page.click_component_next :ep
      end

      step "Admin clicks on the Content location drop-down" do
        check_element_path :xpath, CloudBeesApps::CONTENT_LOCATION_EP, CloudBeesApps::CONTENT_LOCATION_IL
        apps_page.click_on_content_location :ep
      end

      step "Admin select on the drop-down EC-Artifact" do
        check_element_path :xpath, CloudBeesApps::SELECT_EC_ARTIFACT_EP, CloudBeesApps::SELECT_EC_ARTIFACT_IL
        apps_page.select_ec_artifact :ep
      end

      step "Admin fills the artifact name field", settings('cloud_bees')['artifact_name'] do |artname|
        check_element_path :xpath, CloudBeesApps::ARTIFACT_NAME_EP, CloudBeesApps::ARTIFACT_NAME_IL
        apps_page.fill_artifact_name_field :ep, artname
      end

      step "Admin click on the OK button" do
        check_element_path :xpath, CloudBeesApps::CONFIRM_NEW_ARTIFACT_EP, CloudBeesApps::CONFIRM_NEW_ARTIFACT_IL
        apps_page.confirm_new_artifact :ep
      end

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu :ep
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_EP, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications :ep
      end

      step "Admin find application name", settings('cloud_bees')['app_name'] do |appname|
        check_element_path :xpath, CloudBeesApps::FIND_APPLICATION_FIELD_EP, CloudBeesApps::FIND_APPLICATION_FIELD_IL
        apps_page.find_application_name_field :ep, appname
      end

      step "Admin clicks on new created application" do
        check_element_path :xpath, CloudBeesApps::CHOOSE_APPLICATION_EP, CloudBeesApps::CHOOSE_APPLICATION_IL
        apps_page.choose_application :ep
      end

      step "Admin clicks on delete button" do
        check_element_path :xpath, CloudBeesApps::DELETE_APPLICATION_EP, CloudBeesApps::DELETE_APPLICATION_IL
        apps_page.delete_application :ep
      end

      step "Admin clicks on the OK button" do
        check_element_path :xpath, CloudBeesApps::CONFIRM_DELETE_APPLICATION_EP, CloudBeesApps::CONFIRM_DELETE_APPLICATION_IL
        apps_page.confirm_delete_application :ep
      end

      sleep 3
    end

  end
end