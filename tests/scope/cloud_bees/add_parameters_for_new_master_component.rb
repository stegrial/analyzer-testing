require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
components_page = CloudBeesComponents.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Add Parameters for new Master Component' do

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

      step "Admin fills the component name field", settings('cloud_bees')['component_name'] do |component_name|
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

      step "Admin select on the drop-down EC-Artifact" do
        components_page.select_ec_artifact
      end

      step "Admin fills the artifact name field", settings('cloud_bees')['artifact_name'] do |artname|
        components_page.fill_artifact_name_field artname
      end

      step "Admin click on the OK button" do
        components_page.confirm_new_artifact
      end

      step "Admin find component name field", settings('cloud_bees')['component_name'] do |find_comp|
        components_page.find_component_name_field find_comp
      end

      step "Admin choose Component" do
        components_page.choose_component
      end

      step "Admin click context menu of component" do
        components_page.click_context_menu_of_content
      end

      step "Admin click parameters menu" do
        components_page.click_parameters_menu
      end

      step "Admin click add one parameter" do
        components_page.click_add_one_parameters
      end

      step "Admin fill parameter name field", 'test' do |param_name|
        components_page.fill_parameter_name_field param_name
      end

      step "Admin click parameter type" do
        components_page.click_parameter_type
      end

      step "Admin select checkbox type" do
        components_page.select_checkbox_type
      end

      step "Admin confirm new parameter" do
        components_page.confirm_new_parameter
      end

      step "Admin click close Parameters" do
        components_page.click_close_parameters
      end

      step "Admin click delete Component" do
        components_page.click_delete_component
      end

      step "Admin confirm delete Component" do
        components_page.confirm_delete_component
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

      step "Admin fills the component name field", settings('cloud_bees')['component_name'] do |component_name|
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

      step "Admin select on the drop-down EC-Artifact" do
        check_element_path :xpath, CloudBeesComponents::SELECT_EC_ARTIFACT_TA, CloudBeesComponents::SELECT_EC_ARTIFACT_IL
        components_page.select_ec_artifact
      end

      step "Admin fills the artifact name field", settings('cloud_bees')['artifact_name'] do |artname|
        check_element_path :xpath, CloudBeesComponents::ARTIFACT_NAME_TA, CloudBeesComponents::ARTIFACT_NAME_IL
        components_page.fill_artifact_name_field artname
      end

      step "Admin click on the OK button" do
        check_element_path :xpath, CloudBeesComponents::CONFIRM_NEW_ARTIFACT_TA, CloudBeesComponents::CONFIRM_NEW_ARTIFACT_IL
        components_page.confirm_new_artifact
      end

      step "Admin find component name field", settings('cloud_bees')['component_name'] do |find_comp|
        check_element_path :xpath, CloudBeesComponents::FIND_COMPONENT_NAME_TA, CloudBeesComponents::FIND_COMPONENT_NAME_IL
        components_page.find_component_name_field find_comp
      end

      step "Admin choose Component" do
        check_element_path :xpath, CloudBeesComponents::CHOOSE_COMPONENT_TA, CloudBeesComponents::CHOOSE_COMPONENT_IL
        components_page.choose_component
      end

      step "Admin click context menu of component" do
        check_element_path :css, CloudBeesComponents::CONTEXT_MENU_BTN_TA, CloudBeesComponents::CONTEXT_MENU_BTN_IL
        components_page.click_context_menu_of_content
      end

      step "Admin click parameters menu" do
        check_element_path :xpath, CloudBeesComponents::PARAMETERS_MENU_TA, CloudBeesComponents::PARAMETERS_MENU_IL
        components_page.click_parameters_menu
      end

      step "Admin click add one parameter" do
        check_element_path :xpath, CloudBeesComponents::ADD_ONE_PARAMETERS_TA, CloudBeesComponents::ADD_ONE_PARAMETERS_IL
        components_page.click_add_one_parameters
      end

      step "Admin fill parameter name field", 'test' do |param_name|
        check_element_path :xpath, CloudBeesComponents::PARAMETER_NAME_TA, CloudBeesComponents::PARAMETER_NAME_IL
        components_page.fill_parameter_name_field param_name
      end

      step "Admin click parameter type" do
        check_element_path :xpath, CloudBeesComponents::PARAMETER_TYPE_TA, CloudBeesComponents::PARAMETER_TYPE_IL
        components_page.click_parameter_type
      end

      step "Admin select checkbox type" do
        check_element_path :xpath, CloudBeesComponents::CHECKBOX_TYPE_TA, CloudBeesComponents::CHECKBOX_TYPE_IL
        components_page.select_checkbox_type
      end

      step "Admin confirm new parameter" do
        check_element_path :xpath, CloudBeesComponents::CONFIRM_NEW_PARAMETER_TA, CloudBeesComponents::CONFIRM_NEW_PARAMETER_IL
        components_page.confirm_new_parameter
      end

      step "Admin click close Parameters" do
        check_element_path :xpath, CloudBeesComponents::CLOSE_PARAMETERS_TA, CloudBeesComponents::CLOSE_PARAMETERS_IL
        components_page.click_close_parameters
      end

      step "Admin click delete Component" do
        check_element_path :xpath, CloudBeesComponents::DELETE_COMPONENT_TA, CloudBeesComponents::DELETE_COMPONENT_IL
        components_page.click_delete_component
      end

      step "Admin confirm delete Component" do
        check_element_path :xpath, CloudBeesComponents::CONFIRM_DELETE_COMPONENT_TA, CloudBeesComponents::CONFIRM_DELETE_COMPONENT_IL
        components_page.confirm_delete_component
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

      step "Admin fills the component name field", settings('cloud_bees')['component_name'] do |component_name|
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

      step "Admin select on the drop-down EC-Artifact" do
        check_element_path :xpath, CloudBeesComponents::SELECT_EC_ARTIFACT_EP, CloudBeesComponents::SELECT_EC_ARTIFACT_IL
        components_page.select_ec_artifact :ep
      end

      step "Admin fills the artifact name field", settings('cloud_bees')['artifact_name'] do |artname|
        check_element_path :xpath, CloudBeesComponents::ARTIFACT_NAME_EP, CloudBeesComponents::ARTIFACT_NAME_IL
        components_page.fill_artifact_name_field :ep, artname
      end

      step "Admin click on the OK button" do
        check_element_path :xpath, CloudBeesComponents::CONFIRM_NEW_ARTIFACT_EP, CloudBeesComponents::CONFIRM_NEW_ARTIFACT_IL
        components_page.confirm_new_artifact :ep
      end

      step "Admin find component name field", settings('cloud_bees')['component_name'] do |find_comp|
        check_element_path :xpath, CloudBeesComponents::FIND_COMPONENT_NAME_EP, CloudBeesComponents::FIND_COMPONENT_NAME_IL
        components_page.find_component_name_field :ep, find_comp
      end

      step "Admin choose Component" do
        check_element_path :xpath, CloudBeesComponents::CHOOSE_COMPONENT_EP, CloudBeesComponents::CHOOSE_COMPONENT_IL
        components_page.choose_component :ep
      end

      step "Admin click context menu of component" do
        check_element_path :css, CloudBeesComponents::CONTEXT_MENU_BTN_EP, CloudBeesComponents::CONTEXT_MENU_BTN_IL
        components_page.click_context_menu_of_content :ep
      end

      step "Admin click parameters menu" do
        check_element_path :xpath, CloudBeesComponents::PARAMETERS_MENU_EP, CloudBeesComponents::PARAMETERS_MENU_IL
        components_page.click_parameters_menu :ep
      end

      step "Admin click add one parameter" do
        check_element_path :xpath, CloudBeesComponents::ADD_ONE_PARAMETERS_EP, CloudBeesComponents::ADD_ONE_PARAMETERS_IL
        components_page.click_add_one_parameters :ep
      end

      step "Admin fill parameter name field", 'test' do |param_name|
        check_element_path :xpath, CloudBeesComponents::PARAMETER_NAME_EP, CloudBeesComponents::PARAMETER_NAME_IL
        components_page.fill_parameter_name_field :ep, param_name
      end

      step "Admin click parameter type" do
        check_element_path :xpath, CloudBeesComponents::PARAMETER_TYPE_EP, CloudBeesComponents::PARAMETER_TYPE_IL
        components_page.click_parameter_type :ep
      end

      step "Admin select checkbox type" do
        check_element_path :xpath, CloudBeesComponents::CHECKBOX_TYPE_EP, CloudBeesComponents::CHECKBOX_TYPE_IL
        components_page.select_checkbox_type :ep
      end

      step "Admin confirm new parameter" do
        check_element_path :xpath, CloudBeesComponents::CONFIRM_NEW_PARAMETER_EP, CloudBeesComponents::CONFIRM_NEW_PARAMETER_IL
        components_page.confirm_new_parameter :ep
      end

      step "Admin click close Parameters" do
        check_element_path :xpath, CloudBeesComponents::CLOSE_PARAMETERS_EP, CloudBeesComponents::CLOSE_PARAMETERS_IL
        components_page.click_close_parameters :ep
      end

      step "Admin click delete Component" do
        check_element_path :xpath, CloudBeesComponents::DELETE_COMPONENT_EP, CloudBeesComponents::DELETE_COMPONENT_IL
        components_page.click_delete_component :ep
      end

      step "Admin confirm delete Component" do
        check_element_path :xpath, CloudBeesComponents::CONFIRM_DELETE_COMPONENT_EP, CloudBeesComponents::CONFIRM_DELETE_COMPONENT_IL
        components_page.confirm_delete_component :ep
      end

      sleep 3
    end

  end
end