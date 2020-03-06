require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

login_page = CloudBeesLogin.new
components_page = CloudBeesComponents.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'AT-92, TA Analyzer returns the wrong element on the page (Cloud Bees - Content location element)' do

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

      step "Admin goes to the page", settings('cloud_bees')['components_page'] do |url|
        page.visit url
      end

      step "Admin clicks on the New Component button" do
        components_page.click_new_component
      end

      step "Admin clicks on the Create New Component" do
        components_page.click_create_new_component
      end

      step "Admin fills the component name field", "component_test_name" do |component_name|
        components_page.fill_component_name_field component_name
      end

      step "Admin clicks on the Select project drop-down" do
        components_page.click_on_select_project
      end

      step "Admin select on the drop-down Default project" do
        components_page.select_default_project
      end

      step "Admin confirm new component, click Next button" do
        components_page.confirm_create_new_component
      end

      step "Admin clicks on the Content location drop-down" do
        components_page.click_on_content_location
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

      step "Admin goes to the page", settings('cloud_bees')['components_page'] do |url|
        page.visit url
      end

      step "Admin clicks on the New Component button" do
        check_element_path :xpath, CloudBeesComponents::NEW_COMPONENTS_BTN_TA, CloudBeesComponents::NEW_COMPONENTS_BTN_IL
        components_page.click_new_component
      end

      step "Admin clicks on the Create New Component" do
        check_element_path :xpath, CloudBeesComponents::CREATE_NEW_COMPONENTS_TA, CloudBeesComponents::CREATE_NEW_COMPONENTS_IL
        components_page.click_create_new_component
      end

      step "Admin fills the component name field", "component_test_name" do |component_name|
        check_element_path :xpath, CloudBeesComponents::COMPONENT_NAME_TA, CloudBeesComponents::COMPONENT_NAME_IL
        components_page.fill_component_name_field component_name
      end

      step "Admin clicks on the Select project drop-down" do
        check_element_path :xpath, CloudBeesComponents::SELECT_PROJECT_TA, CloudBeesComponents::SELECT_PROJECT_IL
        components_page.click_on_select_project
      end

      step "Admin select on the drop-down Default project" do
        check_element_path :xpath, CloudBeesComponents::SELECT_DEFAULT_PROJECT_TA, CloudBeesComponents::SELECT_DEFAULT_PROJECT_IL
        components_page.select_default_project
      end

      step "Admin confirm new component, click Next button" do
        check_element_path :xpath, CloudBeesComponents::CONFIRM_NEW_COMPONENT_TA, CloudBeesComponents::CONFIRM_NEW_COMPONENT_IL
        components_page.confirm_create_new_component
      end

      step "Admin clicks on the Content location drop-down" do
        check_element_path :xpath, CloudBeesComponents::CONTENT_LOCATION_TA, CloudBeesComponents::CONTENT_LOCATION_IL
        components_page.click_on_content_location
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

      step "Admin goes to the page", settings('cloud_bees')['components_page'] do |url|
        page.visit url
      end

      step "Admin clicks on the New Component button" do
        check_element_path :xpath, CloudBeesComponents::NEW_COMPONENTS_BTN_EP, CloudBeesComponents::NEW_COMPONENTS_BTN_IL
        components_page.click_new_component :ep
      end

      step "Admin clicks on the Create New Component" do
        check_element_path :xpath, CloudBeesComponents::CREATE_NEW_COMPONENTS_EP, CloudBeesComponents::CREATE_NEW_COMPONENTS_IL
        components_page.click_create_new_component :ep
      end

      step "Admin fills the component name field", "component_test_name" do |component_name|
        check_element_path :xpath, CloudBeesComponents::COMPONENT_NAME_EP, CloudBeesComponents::COMPONENT_NAME_IL
        components_page.fill_component_name_field :ep, component_name
      end

      step "Admin clicks on the Select project drop-down" do
        check_element_path :xpath, CloudBeesComponents::SELECT_PROJECT_EP, CloudBeesComponents::SELECT_PROJECT_IL
        components_page.click_on_select_project :ep
      end

      step "Admin select on the drop-down Default project" do
        check_element_path :xpath, CloudBeesComponents::SELECT_DEFAULT_PROJECT_EP, CloudBeesComponents::SELECT_DEFAULT_PROJECT_IL
        components_page.select_default_project :ep
      end

      step "Admin confirm new component, click Next button" do
        check_element_path :xpath, CloudBeesComponents::CONFIRM_NEW_COMPONENT_EP, CloudBeesComponents::CONFIRM_NEW_COMPONENT_IL
        components_page.confirm_create_new_component :ep
      end

      step "Admin clicks on the Content location drop-down" do
        check_element_path :xpath, CloudBeesComponents::CONTENT_LOCATION_EP, CloudBeesComponents::CONTENT_LOCATION_IL
        components_page.click_on_content_location :ep
      end

      sleep 3
    end

    scenario 'Recording debug', record_debug: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "Admin goes to the page", settings('cloud_bees')['components_page'] do |url|
        page.visit url
      end

      step "Admin clicks on the New Component button" do
        components_page.click_new_component :il
      end

      step "Admin clicks on the Create New Component" do
        components_page.click_create_new_component :il
      end

      step "Admin fills the component name field", "component_test_name" do |component_name|
        components_page.fill_component_name_field :il, component_name
      end

      step "Admin clicks on the Select project drop-down" do
        components_page.click_on_select_project :il
      end

      step "Admin select on the drop-down Default project" do
        components_page.select_default_project :il
      end

      step "Admin confirm new component, click Next button" do
        components_page.confirm_create_new_component :il
      end

      step "Admin clicks on the Content location drop-down" do
        components_page.click_on_content_location
      end

      sleep 3
    end

    scenario 'Search debug', search_debug: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "Admin goes to the page", settings('cloud_bees')['components_page'] do |url|
        page.visit url
      end

      step "Admin clicks on the New Component button" do
        components_page.click_new_component :il
      end

      step "Admin clicks on the Create New Component" do
        components_page.click_create_new_component :il
      end

      step "Admin fills the component name field", "component_test_name" do |component_name|
        components_page.fill_component_name_field :il, component_name
      end

      step "Admin clicks on the Select project drop-down" do
        components_page.click_on_select_project :il
      end

      step "Admin select on the drop-down Default project" do
        components_page.select_default_project :il
      end

      step "Admin confirm new component, click Next button" do
        components_page.confirm_create_new_component :il
      end

      step "Admin clicks on the Content location drop-down" do
        components_page.click_on_content_location
      end

      sleep 3
    end

  end
end