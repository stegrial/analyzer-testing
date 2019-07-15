require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/ec_flow'
require 'securerandom'
random_string = SecureRandom.hex

it = Ecflow.new

# This tests runs when the vpn is ON
describe 'Preconditions' do

  feature 'EC Flow - creating new application commponent - GWT - fields' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('ec_flow')['page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('ec_flow')['login'] do |login|
        it.set_login(login)
      end

      step "User set pass in input" , settings('ec_flow')['password'] do |password|
        it.set_password(password)
      end

      step "User clicks on login bth" do
        it.click_login_btn
      end

      step "User clicks on humburg bth" do
        it.click_humburg_btn
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
        it.set_new_name.set("appName"+ SecureRandom.hex(3))
      end

      step "User sets new application component description" do
        it.set_description.set("description"+ SecureRandom.hex(10))
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
        it.click_ok_btn
      end

      step "User click on multimenu button" do
        it.click_multi_menu
      end

      step "User click on delete item for deleting" do
        it.click_delete
      end

      step "User click on ok button for accepting" do
        it.click_ok_btn
      end
      Capybara.current_session.driver.quit

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('ec_flow')['page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('ec_flow')['login'] do |login|
        check_element_path :xpath, Ecflow::LOGIN_TA, Ecflow::LOGIN_IL
        it.set_login(login)
      end

      step "User set pass in input" , settings('ec_flow')['password'] do |password|
        check_element_path :xpath, Ecflow::PASSWORD_TA, Ecflow::PASSWORD_IL
        it.set_password(password)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, Ecflow::LOGIN_BTN_TA, Ecflow::LOGIN_BTN_IL
        it.click_login_btn
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, Ecflow::HUMBURG_BTN_TA, Ecflow::HUMBURG_BTN_IL
        it.click_humburg_btn
      end

      step "User clicks on applications link" do
        check_element_path :css, Ecflow::APPLICATIONS_TA, Ecflow::APPLICATIONS_IL
        it.click_applications
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, Ecflow::APPLICATION_FROM_LIST_TA, Ecflow::APPLICATION_FROM_LIST_IL
        it.select_application_from_list
      end

      step "User clicks on add new application" do
        check_element_path :css, Ecflow::ADD_NEW_COMPONENT_TA, Ecflow::ADD_NEW_COMPONENT_IL
        it.click_add_new_component
      end

      step "User clicks on component button" do
        check_element_path :css, Ecflow::ADD_COMPONENT_BTN_TA, Ecflow::ADD_COMPONENT_BTN_IL
        it.click_component_btn
      end

      step "User clicks on create new application component" do
        check_element_path :css, Ecflow::CREATE_NEW_APP_COMPONENT_TA, Ecflow::CREATE_NEW_APP_COMPONENT_IL
        it.click_for_create_new_app_component
      end

      step "User sets new application component name" do
        check_element_path :css, Ecflow::NEW_COMPONENT_NAME_TA, Ecflow::NEW_COMPONENT_NAME_IL
        it.set_new_name.set("appName"+ SecureRandom.hex(3))
      end

      step "User sets new application component description" do
        check_element_path :css, Ecflow::COMPONENT_DESCRIPTION_TA, Ecflow::COMPONENT_DESCRIPTION_IL
        it.set_description.set("description"+ SecureRandom.hex(10))
      end

      step "User click on ok button" do
        check_element_path :xpath, Ecflow::NEXT_BTN_TA, Ecflow::NEXT_BTN_IL
        it.click_next_btn
      end

      step "User click on dropdown" do
        check_element_path :css, Ecflow::COMPONENT_DROPDOWN_TA, Ecflow::COMPONENT_DROPDOWN_IL
        it.click_component_dropdown
      end

      step "User select artifact" do
        check_element_path :xpath, Ecflow::EC_ARTIFACTORY_TA, Ecflow::EC_ARTIFACTORY_IL
        it.click_artifact
      end

      step "User set configuration text in input" do
        check_element_path :xpath, Ecflow::CONFIGURATION_TA, Ecflow::CONFIGURATION_IL
        it.set_configuration
      end

      step "User set repository in input" do
        check_element_path :xpath, Ecflow::REPOSITORY_KEY_TA, Ecflow::REPOSITORY_KEY_IL
        it.set_repository_key
      end

      step "User set organization in input" do
        check_element_path :xpath, Ecflow::ORGANIZATION_PATH_TA, Ecflow::ORGANIZATION_PATH_IL
        it.set_organization_path
      end

      step "User set artifact in input" do
        check_element_path :xpath, Ecflow::ARTIFACT_TA, Ecflow::ARTIFACT_IL
        it.set_artifact
      end

      step "User set version in input" do
        check_element_path :xpath, Ecflow::VERSION_TA, Ecflow::VERSION_IL
        it.set_version
      end

      step "User set extention in inputt" do
        check_element_path :xpath, Ecflow::EXTENSION_TA, Ecflow::EXTENSION_IL
        it.set_extention
      end

      step "User click on ok button" do
        check_element_path :css, Ecflow::OK_BTN_TA, Ecflow::OK_BTN_TA
        it.click_ok_btn
      end

      step "User click on multimenu button" do
        check_element_path :css, Ecflow::MULTI_MENU_BTN_IL, Ecflow::MULTI_MENU_BTN_TA
        it.click_multi_menu
      end

      step "User click on delete item for deleting" do
        check_element_path :css, Ecflow::DELETE_TA, Ecflow::DELETE_IL
        it.click_delete
      end

      step "User click on ok button for accepting" do
        check_element_path :css, Ecflow::OK_BTN_TA, Ecflow::OK_BTN_TA
        it.click_ok_btn
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('ec_flow')['page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('ec_flow')['login'] do |login|
        check_element_path :xpath, Ecflow::LOGIN_EP, Ecflow::LOGIN_IL
        it.set_login(login)
      end

      step "User set pass in input" , settings('ec_flow')['password'] do |password|
        check_element_path :xpath, Ecflow::PASSWORD_EP, Ecflow::PASSWORD_IL
        it.set_password(password)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, Ecflow::LOGIN_BTN_EP, Ecflow::LOGIN_BTN_IL
        it.click_login_btn
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, Ecflow::HUMBURG_BTN_EP, Ecflow::HUMBURG_BTN_IL
        it.click_humburg_btn
      end

      step "User clicks on applications link" do
        check_element_path :xpath, Ecflow::APPLICATIONS_EP, Ecflow::APPLICATIONS_IL
        it.click_applications
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, Ecflow::APPLICATION_FROM_LIST_EP, Ecflow::APPLICATION_FROM_LIST_IL
        it.select_application_from_list
      end

      step "User clicks on add new application" do
        check_element_path :xpath, Ecflow::ADD_NEW_COMPONENT_EP, Ecflow::ADD_NEW_COMPONENT_IL
        it.click_add_new_component
      end

      step "User clicks on component button" do
        check_element_path :xpath, Ecflow::ADD_COMPONENT_BTN_EP, Ecflow::ADD_COMPONENT_BTN_IL
        it.click_component_btn
      end

      step "User clicks on create new application component" do
        check_element_path :xpath, Ecflow::CREATE_NEW_APP_COMPONENT_EP, Ecflow::CREATE_NEW_APP_COMPONENT_IL
        it.click_for_create_new_app_component
      end

      step "User sets new application component name" do
        check_element_path :xpath, Ecflow::NEW_COMPONENT_NAME_EP, Ecflow::NEW_COMPONENT_NAME_IL
        it.set_new_name.set("appName"+ SecureRandom.hex(3))
      end

      step "User sets new application component description" do
        check_element_path :xpath, Ecflow::COMPONENT_DESCRIPTION_EP, Ecflow::COMPONENT_DESCRIPTION_IL
        it.set_description.set("description"+ SecureRandom.hex(10))
      end

      step "User click on ok button" do
        check_element_path :xpath, Ecflow::NEXT_BTN_EP, Ecflow::NEXT_BTN_IL
        it.click_next_btn
      end

      step "User click on dropdown" do
        check_element_path :xpath, Ecflow::COMPONENT_DROPDOWN_EP, Ecflow::COMPONENT_DROPDOWN_IL
        it.click_component_dropdown
      end

      step "User select artifact" do
        check_element_path :xpath, Ecflow::EC_ARTIFACTORY_EP, Ecflow::EC_ARTIFACTORY_IL
        it.click_artifact
      end

      step "User set configuration text in input" do
        check_element_path :xpath, Ecflow::CONFIGURATION_EP, Ecflow::CONFIGURATION_IL
        it.set_configuration
      end

      step "User set repository in input" do
        check_element_path :xpath, Ecflow::REPOSITORY_KEY_EP, Ecflow::REPOSITORY_KEY_IL
        it.set_repository_key
      end

      step "User set organization in input" do
        check_element_path :xpath, Ecflow::ORGANIZATION_PATH_EP, Ecflow::ORGANIZATION_PATH_IL
        it.set_organization_path
      end

      step "User set artifact in input" do
        check_element_path :xpath, Ecflow::ARTIFACT_EP, Ecflow::ARTIFACT_IL
        it.set_artifact
      end

      step "User set version in input" do
        check_element_path :xpath, Ecflow::VERSION_EP, Ecflow::VERSION_IL
        it.set_version
      end

      step "User set extention in inputt" do
        check_element_path :xpath, Ecflow::EXTENSION_EP, Ecflow::EXTENSION_IL
        it.set_extention
      end

      step "User click on ok button" do
        check_element_path :xpath, Ecflow::OK_BTN_EP, Ecflow::OK_BTN_TA
        it.click_ok_btn
      end
    end
  end
end