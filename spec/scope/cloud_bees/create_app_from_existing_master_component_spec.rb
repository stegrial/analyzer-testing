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

  after(:each) do
    step "Remove created application", settings('cloud_bees') do |data|
      page.visit data['applications_page']
      apps_page.find_application_name_field :il, data['app_name']
      apps_page.select_app_list_item :il
      apps_page.delete_application :il
      apps_page.confirm_delete_application :il
    end
  end

  feature 'Create Application Component from Existing Master Component' do

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

      step "Admin clicks on the Create from Existing Master Component" do
        apps_page.create_existing_master_component
      end

      step "Admin choose JBossMC Component" do
        apps_page.choose_jbossmc_component
      end

      step "Admin clicks on the checkbox near JBossMC Component" do
        apps_page.click_on_checkbox_near_jbossmc
      end

      step "Admin close Attention in Component" do
        apps_page.close_attention_in_component
      end

      step "Admin clicks Next button" do
        apps_page.component_existing_master_next
      end

      step "Admin fills the component name field", "component_test_name" do |compname|
        apps_page.fill_component_name_field compname
      end

      step "Admin clicks OK button" do
        apps_page.click_component_ok
      end

      step "Admin clicks on dropdown in Tier 1" do
        apps_page.click_on_dropdown_in_tier
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

      step "Admin clicks on the Create from Existing Master Component" do
        check_element_path :xpath, CloudBeesApps::CREATE_EXISTING_MASTER_COMPONENT_TA, CloudBeesApps::CREATE_EXISTING_MASTER_COMPONENT_IL
        apps_page.create_existing_master_component
      end

      step "Admin choose JBossMC Component" do
        check_element_path :xpath, CloudBeesApps::COMPONENT_JBOSSMC_TA, CloudBeesApps::COMPONENT_JBOSSMC_IL
        apps_page.choose_jbossmc_component
      end

      step "Admin clicks on the checkbox near JBossMC Component" do
        check_element_path :xpath, CloudBeesApps::CHECKBOX_NEAR_JBOSSMC_TA, CloudBeesApps::CHECKBOX_NEAR_JBOSSMC_IL
        apps_page.click_on_checkbox_near_jbossmc
      end

      step "Admin close Attention in Component" do
        check_element_path :xpath, CloudBeesApps::CLOSE_ATTENTION_IN_COMPONENT_TA, CloudBeesApps::CLOSE_ATTENTION_IN_COMPONENT_IL
        apps_page.close_attention_in_component
      end

      step "Admin clicks Next button" do
        check_element_path :xpath, CloudBeesApps::COMPONENT_EXISTING_MASTER_NEXT_TA, CloudBeesApps::COMPONENT_EXISTING_MASTER_NEXT_IL
        apps_page.component_existing_master_next
      end

      step "Admin fills the component name field", "component_test_name" do |compname|
        check_element_path :xpath, CloudBeesApps::COMPONENT_NAME_TA, CloudBeesApps::COMPONENT_NAME_IL
        apps_page.fill_component_name_field compname
      end

      step "Admin clicks OK button" do
        check_element_path :xpath, CloudBeesApps::COMPONENT_OK_BTN_TA, CloudBeesApps::COMPONENT_OK_BTN_IL
        apps_page.click_component_ok
      end

      step "Admin clicks on dropdown in Tier 1" do
        check_element_path :xpath, CloudBeesApps::DROPDOWN_IN_TIER_TA, CloudBeesApps::DROPDOWN_IN_TIER_IL
        apps_page.click_on_dropdown_in_tier
      end

      sleep 3
    end

  end
end