require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/cloud_bees'
require 'securerandom'
random_string = SecureRandom.hex

it = CloudBees.new

# This tests runs when the vpn is ON
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end
  feature 'EC Flow - creating new application commponent - GWT - fields' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('cloud_bees')['username'] do |username|
        it.fill_username_field(username)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |pass|
        it.fill_pass_field(pass)
      end

      step "User clicks on login bth" do
        it.click_sign_in_button
      end

      step "User clicks on hamburger menu" do
        it.click_hamburger_menu
      end
      step "User clicks on applications link" do
        it.click_applications
      end

      step "User clicks on pipeline to select" do
        it.select_application_from_list
      end

      step "User clicks on add new application" do
        it.click_add_new_component
      end

      step "User clicks on component button" do
        it.click_component_btn
      end

      step "User clicks on create new application component" do
        it.click_for_create_new_app_component
      end

      step "User sets new application component name" do
        it.set_new_name
      end

      step "User sets new application component description" do
        it.set_description
      end

      step "User click on ok button" do
        it.click_next_btn
      end

      step "User click on dropdown" do
        it.click_component_dropdown
      end

      step "User select artifact" do
        it.click_artifact
      end

      step "User set configuration text in input" do
        it.set_configuration
      end

      step "User set repository in input" do
        it.set_repository_key
      end

      step "User set organization in input" do
        it.set_organization_path
      end

      step "User set artifact in input" do
        it.set_artifact
      end

      step "User set version in input" do
        it.set_version
      end

      step "User set extention in inputt" do
        it.set_extention
      end

      step "User click on ok button" do
        sleep 5
        it.click_ok_in_modal_btn
      end

      step "User click on multimenu button" do
        it.click_multi_menu
      end

      step "User click on delete item for deleting" do
        it.click_delete
      end

      step "User click on ok button for accepting" do
        it.click_warning_ok_btn
      end
      Capybara.current_session.driver.quit

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('cloud_bees')['username'] do |username|
        check_element_path :xpath, CloudBees::USERNAME_FIELD_TA, CloudBees::USERNAME_FIELD_IL
        it.fill_username_field(username)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |pass|
        check_element_path :xpath, CloudBees::PASSWORD_FIELD_TA, CloudBees::PASSWORD_FIELD_IL
        it.fill_pass_field(pass)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, CloudBees::SIGN_IN_BTN_TA, CloudBees::SIGN_IN_BTN_IL
        it.click_sign_in_button
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, CloudBees::HAM_MENU_BTN_TA, CloudBees::HAM_MENU_BTN_IL
        it.click_hamburger_menu
      end

      step "User clicks on applications link" do
        check_element_path :css, CloudBees::APPLICATIONS_TA, CloudBees::APPLICATIONS_IL
        it.click_applications
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBees::APPLICATION_FROM_LIST_TA, CloudBees::APPLICATION_FROM_LIST_IL
        it.select_application_from_list
      end

      step "User clicks on add new application" do
        check_element_path :css, CloudBees::ADD_NEW_COMPONENT_TA, CloudBees::ADD_NEW_COMPONENT_IL
        it.click_add_new_component
      end

      step "User clicks on component button" do
        check_element_path :css, CloudBees::ADD_COMPONENT_BTN_TA, CloudBees::ADD_COMPONENT_BTN_IL
        it.click_component_btn
      end

      step "User clicks on create new application component" do
        check_element_path :css, CloudBees::CREATE_NEW_APP_COMPONENT_TA, CloudBees::CREATE_NEW_APP_COMPONENT_IL
        it.click_for_create_new_app_component
      end

      step "User sets new application component name" do
        check_element_path :css, CloudBees::NEW_COMPONENT_NAME_TA, CloudBees::NEW_COMPONENT_NAME_IL
        it.set_new_name
      end

      step "User sets new application component description" do
        check_element_path :css, CloudBees::COMPONENT_DESCRIPTION_TA, CloudBees::COMPONENT_DESCRIPTION_IL
        it.set_description
      end

      step "User click on ok button" do
        check_element_path :xpath, CloudBees::NEXT_BTN_TA, CloudBees::NEXT_BTN_IL
        it.click_next_btn
      end

      step "User click on dropdown" do
        check_element_path :css, CloudBees::COMPONENT_DROPDOWN_TA, CloudBees::COMPONENT_DROPDOWN_IL
        it.click_component_dropdown
      end

      step "User select artifact" do
        check_element_path :xpath, CloudBees::EC_ARTIFACTORY_TA, CloudBees::EC_ARTIFACTORY_IL
        it.click_artifact
      end

      step "User set configuration text in input" do
        check_element_path :xpath, CloudBees::CONFIGURATION_TA, CloudBees::CONFIGURATION_IL
        it.set_configuration
      end

      step "User set repository in input" do
        check_element_path :xpath, CloudBees::REPOSITORY_KEY_TA, CloudBees::REPOSITORY_KEY_IL
        it.set_repository_key
      end

      step "User set organization in input" do
        check_element_path :xpath, CloudBees::ORGANIZATION_PATH_TA, CloudBees::ORGANIZATION_PATH_IL
        it.set_organization_path
      end

      step "User set artifact in input" do
        check_element_path :xpath, CloudBees::ARTIFACT_TA, CloudBees::ARTIFACT_IL
        it.set_artifact
      end

      step "User set version in input" do
        check_element_path :xpath, CloudBees::VERSION_TA, CloudBees::VERSION_IL
        it.set_version
      end

      step "User set extention in inputt" do
        check_element_path :xpath, CloudBees::EXTENSION_TA, CloudBees::EXTENSION_IL
        it.set_extention
      end

      step "User click on ok button" do
        check_element_path :css, CloudBees::Ok_IN_MODAL_TA, CloudBees::Ok_IN_MODAL_IL
        it.click_ok_in_modal_btn
      end

      step "User click on multimenu button" do
        check_element_path :css, CloudBees::MULTI_MENU_BTN_TA, CloudBees::MULTI_MENU_BTN_IL
        it.click_multi_menu
      end

      step "User click on delete item for deleting" do
        check_element_path :css, CloudBees::DELETE_TA, CloudBees::DELETE_IL
        it.click_delete
      end

      step "User click on ok button for accepting" do
        sleep 4
        check_element_path :xpath, CloudBees::OK_WARNING_TA, CloudBees::OK_WARNING_IL
        it.click_warning_ok_btn
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('cloud_bees')['username'] do |username|
        check_element_path :xpath, CloudBees::USERNAME_FIELD_EP, CloudBees::USERNAME_FIELD_IL
        it.fill_username_field(:ep,username)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |pass|
        check_element_path :xpath, CloudBees::PASSWORD_FIELD_EP, CloudBees::PASSWORD_FIELD_IL
        it.fill_pass_field(:ep, pass)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, CloudBees::SIGN_IN_BTN_EP, CloudBees::SIGN_IN_BTN_IL
        it.click_sign_in_button :ep
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, CloudBees::HAM_MENU_BTN_EP, CloudBees::HAM_MENU_BTN_IL
        it.click_hamburger_menu :ep
      end

      step "User clicks on applications link" do
        check_element_path :xpath, CloudBees::APPLICATIONS_EP, CloudBees::APPLICATIONS_IL
        it.click_applications :ep
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBees::APPLICATION_FROM_LIST_EP, CloudBees::APPLICATION_FROM_LIST_IL
        it.select_application_from_list :ep
      end

      step "User clicks on add new application" do
        check_element_path :xpath, CloudBees::ADD_NEW_COMPONENT_EP, CloudBees::ADD_NEW_COMPONENT_IL
        it.click_add_new_component :ep
      end

      step "User clicks on component button" do
        check_element_path :xpath, CloudBees::ADD_COMPONENT_BTN_EP, CloudBees::ADD_COMPONENT_BTN_IL
        it.click_component_btn :ep
      end

      step "User clicks on create new application component" do
        check_element_path :xpath, CloudBees::CREATE_NEW_APP_COMPONENT_EP, CloudBees::CREATE_NEW_APP_COMPONENT_IL
        it.click_for_create_new_app_component :ep
      end

      step "User sets new application component name" do
        check_element_path :xpath, CloudBees::NEW_COMPONENT_NAME_EP, CloudBees::NEW_COMPONENT_NAME_IL
        it.set_new_name :ep
      end

      step "User sets new application component description" do
        check_element_path :xpath, CloudBees::COMPONENT_DESCRIPTION_EP, CloudBees::COMPONENT_DESCRIPTION_IL
        it.set_description :ep
      end

      step "User click on ok button" do
        check_element_path :xpath, CloudBees::NEXT_BTN_EP, CloudBees::NEXT_BTN_IL
        it.click_next_btn :ep
      end

      step "User click on dropdown" do
        check_element_path :xpath, CloudBees::COMPONENT_DROPDOWN_EP, CloudBees::COMPONENT_DROPDOWN_IL
        it.click_component_dropdown :ep
      end

      step "User select artifact" do
        check_element_path :xpath, CloudBees::EC_ARTIFACTORY_EP, CloudBees::EC_ARTIFACTORY_IL
        it.click_artifact :ep
      end

      step "User set configuration text in input" do
        check_element_path  :xpath, CloudBees::CONFIGURATION_EP, CloudBees::CONFIGURATION_IL
        it.set_configuration :ep
      end

      step "User set repository in input" do
        check_element_path :xpath, CloudBees::REPOSITORY_KEY_EP, CloudBees::REPOSITORY_KEY_IL
        it.set_repository_key :ep
      end

      step "User set organization in input" do
        check_element_path :xpath, CloudBees::ORGANIZATION_PATH_EP, CloudBees::ORGANIZATION_PATH_IL
        it.set_organization_path :ep
      end

      step "User set artifact in input" do
        check_element_path :xpath, CloudBees::ARTIFACT_EP, CloudBees::ARTIFACT_IL
        it.set_artifact :ep
      end

      step "User set version in input" do
        check_element_path :xpath, CloudBees::VERSION_EP, CloudBees::VERSION_IL
        it.set_version :ep
      end

      step "User set extention in inputt" do
        check_element_path :xpath, CloudBees::EXTENSION_EP, CloudBees::EXTENSION_IL
        it.set_extention :ep
      end

      step "User click on ok button" do
        check_element_path :xpath, CloudBees::Ok_IN_MODAL_EP, CloudBees::Ok_IN_MODAL_TA
        it.click_ok_in_modal_btn :ep
      end

      step "User click on multimenu button" do
        check_element_path :css, CloudBees::MULTI_MENU_BTN_EP, CloudBees::MULTI_MENU_BTN_TA
        it.click_multi_menu :ep
      end

      step "User click on delete item for deleting" do
        check_element_path :css, CloudBees::DELETE_EP, CloudBees::DELETE_IL
        it.click_delete :ep
      end

      step "User click on ok button for accepting" do
        check_element_path :xpath, CloudBees::OK_WARNING_EP, CloudBees::OK_WARNING_IL
        it.click_warning_ok_btn :ep
      end

    end
  end
end