require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/cloud_bees_pages/cloud_bees_global'
require 'securerandom'
random_string = SecureRandom.hex

it = CloudBeesGlobal.new

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
        check_element_path :xpath, CloudBeesGlobal::USERNAME_FIELD_TA, CloudBeesGlobal::USERNAME_FIELD_IL
        it.fill_username_field(username)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |pass|
        check_element_path :xpath, CloudBeesGlobal::PASSWORD_FIELD_TA, CloudBeesGlobal::PASSWORD_FIELD_IL
        it.fill_pass_field(pass)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, CloudBeesGlobal::SIGN_IN_BTN_TA, CloudBeesGlobal::SIGN_IN_BTN_IL
        it.click_sign_in_button
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        it.click_hamburger_menu
      end

      step "User clicks on applications link" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_TA, CloudBeesGlobal::APPS_SECTION_IL
        it.click_applications
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBeesGlobal::APPLICATION_FROM_LIST_TA, CloudBeesGlobal::APPLICATION_FROM_LIST_IL
        it.select_application_from_list
      end

      step "User clicks on add new application" do
        check_element_path :css, CloudBeesGlobal::ADD_NEW_COMPONENT_TA, CloudBeesGlobal::ADD_NEW_COMPONENT_IL
        it.click_add_new_component
      end

      step "User clicks on component button" do
        check_element_path :css, CloudBeesGlobal::ADD_COMPONENT_BTN_TA, CloudBeesGlobal::ADD_COMPONENT_BTN_IL
        it.click_component_btn
      end

      step "User clicks on create new application component" do
        check_element_path :css, CloudBeesGlobal::CREATE_NEW_APP_COMPONENT_TA, CloudBeesGlobal::CREATE_NEW_APP_COMPONENT_IL
        it.click_for_create_new_app_component
      end

      step "User sets new application component name" do
        check_element_path :css, CloudBeesGlobal::NEW_COMPONENT_NAME_TA, CloudBeesGlobal::NEW_COMPONENT_NAME_IL
        it.set_new_name
      end

      step "User sets new application component description" do
        check_element_path :css, CloudBeesGlobal::COMPONENT_DESCRIPTION_TA, CloudBeesGlobal::COMPONENT_DESCRIPTION_IL
        it.set_description
      end

      step "User click on ok button" do
        check_element_path :xpath, CloudBeesGlobal::NEXT_BTN_TA, CloudBeesGlobal::NEXT_BTN_IL
        it.click_next_btn
      end

      step "User click on dropdown" do
        check_element_path :css, CloudBeesGlobal::COMPONENT_DROPDOWN_TA, CloudBeesGlobal::COMPONENT_DROPDOWN_IL
        it.click_component_dropdown
      end

      step "User select artifact" do
        check_element_path :xpath, CloudBeesGlobal::EC_ARTIFACTORY_TA, CloudBeesGlobal::EC_ARTIFACTORY_IL
        it.click_artifact
      end

      step "User set configuration text in input" do
        check_element_path :xpath, CloudBeesGlobal::CONFIGURATION_TA, CloudBeesGlobal::CONFIGURATION_IL
        it.set_configuration
      end

      step "User set repository in input" do
        check_element_path :xpath, CloudBeesGlobal::REPOSITORY_KEY_TA, CloudBeesGlobal::REPOSITORY_KEY_IL
        it.set_repository_key
      end

      step "User set organization in input" do
        check_element_path :xpath, CloudBeesGlobal::ORGANIZATION_PATH_TA, CloudBeesGlobal::ORGANIZATION_PATH_IL
        it.set_organization_path
      end

      step "User set artifact in input" do
        check_element_path :xpath, CloudBeesGlobal::ARTIFACT_TA, CloudBeesGlobal::ARTIFACT_IL
        it.set_artifact
      end

      step "User set version in input" do
        check_element_path :xpath, CloudBeesGlobal::VERSION_TA, CloudBeesGlobal::VERSION_IL
        it.set_version
      end

      step "User set extention in inputt" do
        check_element_path :xpath, CloudBeesGlobal::EXTENSION_TA, CloudBeesGlobal::EXTENSION_IL
        it.set_extention
      end

      step "User click on ok button" do
        check_element_path :css, CloudBeesGlobal::Ok_IN_MODAL_TA, CloudBeesGlobal::Ok_IN_MODAL_IL
        it.click_ok_in_modal_btn
      end

      step "User click on multimenu button" do
        check_element_path :css, CloudBeesGlobal::MULTI_MENU_BTN_TA, CloudBeesGlobal::MULTI_MENU_BTN_IL
        it.click_multi_menu
      end

      step "User click on delete item for deleting" do
        check_element_path :css, CloudBeesGlobal::DELETE_TA, CloudBeesGlobal::DELETE_IL
        it.click_delete
      end

      step "User click on ok button for accepting" do
        sleep 4
        check_element_path :xpath, CloudBeesGlobal::OK_WARNING_TA, CloudBeesGlobal::OK_WARNING_IL
        it.click_warning_ok_btn
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('cloud_bees')['username'] do |username|
        check_element_path :xpath, CloudBeesGlobal::USERNAME_FIELD_EP, CloudBeesGlobal::USERNAME_FIELD_IL
        it.fill_username_field(:ep,username)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |pass|
        check_element_path :xpath, CloudBeesGlobal::PASSWORD_FIELD_EP, CloudBeesGlobal::PASSWORD_FIELD_IL
        it.fill_pass_field(:ep, pass)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, CloudBeesGlobal::SIGN_IN_BTN_EP, CloudBeesGlobal::SIGN_IN_BTN_IL
        it.click_sign_in_button :ep
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        it.click_hamburger_menu :ep
      end

      step "User clicks on applications link" do
        check_element_path :xpath, CloudBeesGlobal::APPS_SECTION_EP, CloudBeesGlobal::APPS_SECTION_IL
        it.click_applications :ep
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBeesGlobal::APPLICATION_FROM_LIST_EP, CloudBeesGlobal::APPLICATION_FROM_LIST_IL
        it.select_application_from_list :ep
      end

      step "User clicks on add new application" do
        check_element_path :xpath, CloudBeesGlobal::ADD_NEW_COMPONENT_EP, CloudBeesGlobal::ADD_NEW_COMPONENT_IL
        it.click_add_new_component :ep
      end

      step "User clicks on component button" do
        check_element_path :xpath, CloudBeesGlobal::ADD_COMPONENT_BTN_EP, CloudBeesGlobal::ADD_COMPONENT_BTN_IL
        it.click_component_btn :ep
      end

      step "User clicks on create new application component" do
        check_element_path :xpath, CloudBeesGlobal::CREATE_NEW_APP_COMPONENT_EP, CloudBeesGlobal::CREATE_NEW_APP_COMPONENT_IL
        it.click_for_create_new_app_component :ep
      end

      step "User sets new application component name" do
        check_element_path :xpath, CloudBeesGlobal::NEW_COMPONENT_NAME_EP, CloudBeesGlobal::NEW_COMPONENT_NAME_IL
        it.set_new_name :ep
      end

      step "User sets new application component description" do
        check_element_path :xpath, CloudBeesGlobal::COMPONENT_DESCRIPTION_EP, CloudBeesGlobal::COMPONENT_DESCRIPTION_IL
        it.set_description :ep
      end

      step "User click on ok button" do
        check_element_path :xpath, CloudBeesGlobal::NEXT_BTN_EP, CloudBeesGlobal::NEXT_BTN_IL
        it.click_next_btn :ep
      end

      step "User click on dropdown" do
        check_element_path :xpath, CloudBeesGlobal::COMPONENT_DROPDOWN_EP, CloudBeesGlobal::COMPONENT_DROPDOWN_IL
        it.click_component_dropdown :ep
      end

      step "User select artifact" do
        check_element_path :xpath, CloudBeesGlobal::EC_ARTIFACTORY_EP, CloudBeesGlobal::EC_ARTIFACTORY_IL
        it.click_artifact :ep
      end

      step "User set configuration text in input" do
        check_element_path :xpath, CloudBeesGlobal::CONFIGURATION_EP, CloudBeesGlobal::CONFIGURATION_IL
        it.set_configuration :ep
      end

      step "User set repository in input" do
        check_element_path :xpath, CloudBeesGlobal::REPOSITORY_KEY_EP, CloudBeesGlobal::REPOSITORY_KEY_IL
        it.set_repository_key :ep
      end

      step "User set organization in input" do
        check_element_path :xpath, CloudBeesGlobal::ORGANIZATION_PATH_EP, CloudBeesGlobal::ORGANIZATION_PATH_IL
        it.set_organization_path :ep
      end

      step "User set artifact in input" do
        check_element_path :xpath, CloudBeesGlobal::ARTIFACT_EP, CloudBeesGlobal::ARTIFACT_IL
        it.set_artifact :ep
      end

      step "User set version in input" do
        check_element_path :xpath, CloudBeesGlobal::VERSION_EP, CloudBeesGlobal::VERSION_IL
        it.set_version :ep
      end

      step "User set extention in inputt" do
        check_element_path :xpath, CloudBeesGlobal::EXTENSION_EP, CloudBeesGlobal::EXTENSION_IL
        it.set_extention :ep
      end

      step "User click on ok button" do
        check_element_path :xpath, CloudBeesGlobal::Ok_IN_MODAL_EP, CloudBeesGlobal::Ok_IN_MODAL_TA
        it.click_ok_in_modal_btn :ep
      end

      step "User click on multimenu button" do
        check_element_path :css, CloudBeesGlobal::MULTI_MENU_BTN_EP, CloudBeesGlobal::MULTI_MENU_BTN_TA
        it.click_multi_menu :ep
      end

      step "User click on delete item for deleting" do
        check_element_path :css, CloudBeesGlobal::DELETE_EP, CloudBeesGlobal::DELETE_IL
        it.click_delete :ep
      end

      step "User click on ok button for accepting" do
        check_element_path :xpath, CloudBeesGlobal::OK_WARNING_EP, CloudBeesGlobal::OK_WARNING_IL
        it.click_warning_ok_btn :ep
      end

    end
  end
end