require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
apps_page = CloudBeesApps.new
env = CloudBeesEnv.new
env_editor = CloudBeesEnvEditor.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    step "Remove created user", settings('cloud_bees') do |data|
      page.visit data['login_page']

      global_page.click_hamburger_menu :il
      global_page.click_applications :il
      apps_page.find_application_name_field :il, 'appName'
      sleep 3 # need to wait for the filter to be applied
      apps_page.select_app_list_item :il
      apps_page.delete_application :il
      apps_page.confirm_delete_application :il

      global_page.click_hamburger_menu :il
      global_page.click_environments :il
      env.find_env_name_field :il, 'envName'
      sleep 3 # need to wait for the filter to be applied
      env.choose_env :il
      env.delete_env :il
      env.confirm_delete_env :il
    end
  end

  feature 'Mapping Environment to Application' do

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
        global_page.click_hamburger_menu :il #step is duplicated below
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

      step "Admin fills the application name field", 'appName' do |appname|
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

      step "Admin fills the component name field", 'compName' do |compname|
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

      step "Admin fills the artifact name field", 'artName' do |artname|
        apps_page.fill_artifact_name_field artname
      end

      step "Admin click on the OK button" do
        apps_page.confirm_new_artifact
        sleep 3 # need to wait for the artifact to be created before the next redirect step
      end

      step "Admin goes to the page", settings('cloud_bees')['environments_page'] do |url|
        page.visit url
      end

      step "Admin clicks create plus icon for new env " do
        env.create_new_env
      end

      step "Admin clicks create new env button" do
        env.click_new_env_btn
      end

      step "Admin fills the env name field",'envName' do |envName|
        env.fill_env_name_field envName
      end

      step "Admin click on Select Project dropdown" do
        env.click_on_select_project
      end

      step "Admin select project from dropdown" do
        env.click_to_select_default_project
      end

      step "Admin click confirm button" do
        env.click_to_confirm_create_new_env
      end

      step "Admin clicks to create resource tier" do
        env_editor.click_resource_tier
      end

      step "Admin clicks to add resource" do
       env_editor.click_to_add_resource
      end

      step "Admin select resource from list" do
        env_editor.select_resource_from_list
      end

      step "Admin clicks close button" do
        env_editor.click_to_close_to_close_modal :il #step is duplicated below
      end

      step "Admin clicks map to application link in hierarchy menu" do
        env_editor.click_map_to_app_hierarchy_menu
      end

      step "Admin set application in search field", 'appName' do |appName|
        env_editor.set_app_in_search appName
      end

      step "Admin select application from map list " do
        env_editor.select_app_from_maplist
      end

      step "Admin clicks hamburger menu button to mapping" do
        env_editor.click_mapping_select_btn
      end

      step "Admin select tier map from popover" do
        env_editor.click_to_select_tier_for_map
      end

      step "Admin clicks close button" do
        env_editor.click_to_close_to_close_modal
      end

      sleep 3
    end


    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

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

      step "Admin chooses the Applications section in the Hamburger menu" do
        check_element_path :css  , CloudBeesGlobal::APPS_SECTION_TA, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications
      end

      step "Admin clicks on the new application button" do
        check_element_path :xpath  , CloudBeesApps::NEW_APPLICATION_BTN_TA, CloudBeesApps::NEW_APPLICATION_BTN_IL
        apps_page.click_new_application
      end

      step "Admin clicks on the create new application button" do
        check_element_path :xpath  , CloudBeesApps::CREATE_NEW_APPLICATION_TA, CloudBeesApps::CREATE_NEW_APPLICATION_IL
        apps_page.create_new_application
      end

      step "Admin fills the application name field",'appName' do |appname|
        check_element_path :xpath  , CloudBeesApps::APPLICATION_NAME_TA, CloudBeesApps::APPLICATION_NAME_IL
        apps_page.fill_application_name_field appname
      end

      step "Admin clicks on the Select project drop-down" do
        check_element_path :xpath  , CloudBeesApps::SELECT_PROJECT_TA, CloudBeesApps::SELECT_PROJECT_IL
        apps_page.click_on_select_project
      end

      step "Admin select on the drop-down Default project" do
        check_element_path :xpath  , CloudBeesApps::SELECT_DEFAULT_PROJECT_TA, CloudBeesApps::SELECT_DEFAULT_PROJECT_IL
        apps_page.select_default_project
      end

      step "Admin confirm new application" do
        check_element_path :xpath  , CloudBeesApps::CONFIRM_NEW_APPLICATION_TA, CloudBeesApps::CONFIRM_NEW_APPLICATION_IL
        apps_page.confirm_create_new_application
      end

      step "Admin clicks on the Component tier" do
        check_element_path :xpath  , CloudBeesApps::COMPONENT_TIER_TA, CloudBeesApps::COMPONENT_TIER_IL
        apps_page.click_component_tier
      end

      step "Admin clicks on the Create new  Component" do
        check_element_path :xpath  , CloudBeesApps::CREATE_NEW_COMPONENT_TA, CloudBeesApps::CREATE_NEW_COMPONENT_IL
        apps_page.create_new_component
      end

      step "Admin fills the component name field",'compName' do |compname|
        check_element_path :xpath  , CloudBeesApps::COMPONENT_NAME_TA, CloudBeesApps::COMPONENT_NAME_IL
        apps_page.fill_component_name_field compname
      end

      step "Admin clicks on the Next button in the modal component" do
        check_element_path :xpath  , CloudBeesApps::COMPONENT_NEXT_TA, CloudBeesApps::COMPONENT_NEXT_IL
        apps_page.click_component_next
      end

      step "Admin clicks on the Content location drop-down" do
        check_element_path :xpath  , CloudBeesApps::CONTENT_LOCATION_TA, CloudBeesApps::CONTENT_LOCATION_IL
        apps_page.click_on_content_location
      end

      step "Admin select on the drop-down EC-Artifact" do
        check_element_path :xpath  , CloudBeesApps::SELECT_EC_ARTIFACT_TA, CloudBeesApps::SELECT_EC_ARTIFACT_IL
        apps_page.select_ec_artifact
      end

      step "Admin fills the artifact name field", 'artName' do |artname|
        check_element_path :xpath  , CloudBeesApps::ARTIFACT_NAME_TA, CloudBeesApps::ARTIFACT_NAME_IL
        apps_page.fill_artifact_name_field artname
      end

      step "Admin click on the OK button" do
        check_element_path :xpath  , CloudBeesApps::CONFIRM_NEW_ARTIFACT_TA, CloudBeesApps::CONFIRM_NEW_ARTIFACT_IL
        apps_page.confirm_new_artifact
      end


      step "Admin goes to the page", settings('cloud_bees')['environments_page'] do |url|
        page.visit url
      end

      step "Admin clicks create plus icon for new env" do
        check_element_path :css  , CloudBeesEnv::CREATE_ENV_PLUS_BTN_TA, CloudBeesEnv::CREATE_ENV_PLUS_BTN_IL
        env.create_new_env
      end

      step "Admin clicks create new env button" do
        check_element_path :xpath  , CloudBeesEnv::CREATE_NEW_ENV_MODAL_BTN_TA, CloudBeesEnv::CREATE_NEW_ENV_MODAL_BTN_IL
        env.click_new_env_btn
      end

      step "Admin fills the env name field",'envName' do |envName|
        check_element_path :xpath  , CloudBeesEnv::ENV_NAME_TA, CloudBeesEnv::ENV_NAME_IL
        env.fill_env_name_field envName
      end

      step "Admin click on Select Project dropdown" do
        check_element_path :xpath  , CloudBeesEnv::SELECT_PROJECT_TA, CloudBeesEnv::SELECT_PROJECT_IL
        env.click_on_select_project
      end

      step "Admin select project from dropdown" do
        check_element_path :xpath  , CloudBeesEnv::SELECT_DEFAULT_PROJECT_TA, CloudBeesEnv::SELECT_DEFAULT_PROJECT_IL
        env.click_to_select_default_project
      end

      step "Admin click confirm button" do
        check_element_path :xpath  , CloudBeesEnv::CONFIRM_NEW_ENV_TA, CloudBeesEnv::CONFIRM_NEW_ENV_IL
        env.click_to_confirm_create_new_env
      end

      step "Admin clicks to create resource tier" do
        check_element_path :xpath  , CloudBeesEnvEditor::RESOURCE_TIER_TA, CloudBeesEnvEditor::RESOURCE_TIER_IL
        env_editor.click_resource_tier
      end

      step "Admin clicks to add resource" do
        check_element_path :css  , CloudBeesEnvEditor::ADD_RESOURCE_BTN_TA, CloudBeesEnvEditor::ADD_RESOURCE_BTN_IL
        env_editor.click_to_add_resource
      end

      step "Admin select resource from list" do
        check_element_path :xpath  , CloudBeesEnvEditor::SELECT_RESOURCE_FROM_LIST_TA, CloudBeesEnvEditor::SELECT_RESOURCE_FROM_LIST_IL
        env_editor.select_resource_from_list
      end

      step "Admin clicks close button" do
        check_element_path :css  , CloudBeesEnvEditor::CLOSE_BTN_TA, CloudBeesEnvEditor::CLOSE_BTN_IL
        env_editor.click_to_close_to_close_modal
      end

      step "Admin clicks map to application link in hierarchy menu" do
        check_element_path :css  , CloudBeesEnvEditor::MAP_TO_APP_BTN_TA, CloudBeesEnvEditor::MAP_TO_APP_BTN_IL
        env_editor.click_map_to_app_hierarchy_menu
      end

      step "Admin set application in search field", 'appName' do |appName|
        check_element_path :css  , CloudBeesEnvEditor::APPNAME_IN_SEARCH_FIELD_TA, CloudBeesEnvEditor::APPNAME_IN_SEARCH_FIELD_IL
        env_editor.set_app_in_search appName
      end

      step "Admin select application from map list " do
        check_element_path :css  , CloudBeesEnvEditor::APPS_NAME_IN_MAPPING_MODAL_TA, CloudBeesEnvEditor::APPS_NAME_IN_MAPPING_MODAL_IL
        env_editor.select_app_from_maplist
      end

      step "Admin clicks hamburger menu button to mapping" do
        check_element_path :css  , CloudBeesEnvEditor::MAPPING_SELECT_BTN_TA, CloudBeesEnvEditor::MAPPING_SELECT_BTN_IL
        env_editor.click_mapping_select_btn
      end

      step "Admin select tier map from popover" do
        check_element_path :css  , CloudBeesEnvEditor::TIER_MAPPING_POPOVER_TA, CloudBeesEnvEditor::TIER_MAPPING_POPOVER_IL
        env_editor.click_to_select_tier_for_map
      end

      step "Admin clicks close button" do
        check_element_path :css  , CloudBeesEnvEditor::CLOSE_BTN_TA, CloudBeesEnvEditor::CLOSE_BTN_IL
        env_editor.click_to_close_to_close_modal
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

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
        check_element_path :css  , CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu :ep
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        check_element_path :css  , CloudBeesGlobal::APPS_SECTION_EP, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications :ep
      end

      step "Admin clicks on the new application button" do
        check_element_path :xpath  , CloudBeesApps::NEW_APPLICATION_BTN_EP, CloudBeesApps::NEW_APPLICATION_BTN_IL
        apps_page.click_new_application :ep
      end

      step "Admin clicks on the create new application button" do
        check_element_path :xpath  , CloudBeesApps::CREATE_NEW_APPLICATION_EP, CloudBeesApps::CREATE_NEW_APPLICATION_IL
        apps_page.create_new_application :ep
      end

      step "Admin fills the application name field", 'appName' do |appname|
        check_element_path :xpath  , CloudBeesApps::APPLICATION_NAME_EP, CloudBeesApps::APPLICATION_NAME_IL
        apps_page.fill_application_name_field  :ep, appname
      end

      step "Admin clicks on the Select project drop-down" do
        check_element_path :xpath  , CloudBeesApps::SELECT_PROJECT_EP, CloudBeesApps::SELECT_PROJECT_IL
        apps_page.click_on_select_project :ep
      end

      step "Admin select on the drop-down Default project" do
        sleep 3
        check_element_path :xpath  , CloudBeesApps::SELECT_DEFAULT_PROJECT_EP, CloudBeesApps::SELECT_DEFAULT_PROJECT_IL
        apps_page.select_default_project :ep
      end

      step "Admin confirm new application" do
        check_element_path :xpath  , CloudBeesApps::CONFIRM_NEW_APPLICATION_EP, CloudBeesApps::CONFIRM_NEW_APPLICATION_IL
        apps_page.confirm_create_new_application :ep
      end

      step "Admin clicks on the Component tier" do
        sleep 3
        check_element_path :xpath  , CloudBeesApps::COMPONENT_TIER_EP, CloudBeesApps::COMPONENT_TIER_IL
        apps_page.click_component_tier :ep
      end

      step "Admin clicks on the Create new  Component" do
        check_element_path :xpath  , CloudBeesApps::CREATE_NEW_COMPONENT_EP, CloudBeesApps::CREATE_NEW_COMPONENT_IL
        apps_page.create_new_component :ep
      end

      step "Admin fills the component name field", 'compName' do |compname|
        check_element_path :xpath  , CloudBeesApps::COMPONENT_NAME_EP, CloudBeesApps::COMPONENT_NAME_IL
        apps_page.fill_component_name_field :ep, compname
      end

      step "Admin clicks on the Next button in the modal component" do
        check_element_path :xpath  , CloudBeesApps::COMPONENT_NEXT_EP, CloudBeesApps::COMPONENT_NEXT_IL
        apps_page.click_component_next :ep
      end

      step "Admin clicks on the Content location drop-down" do
        sleep 3
        check_element_path :xpath  , CloudBeesApps::CONTENT_LOCATION_EP, CloudBeesApps::CONTENT_LOCATION_IL
        apps_page.click_on_content_location :ep
      end

      step "Admin select on the drop-down EC-Artifact" do
        check_element_path :xpath  , CloudBeesApps::SELECT_EC_ARTIFACT_EP, CloudBeesApps::SELECT_EC_ARTIFACT_IL
        apps_page.select_ec_artifact :ep
      end

      step "Admin fills the artifact name field", 'artName' do |artname|
        check_element_path :xpath  , CloudBeesApps::ARTIFACT_NAME_EP, CloudBeesApps::ARTIFACT_NAME_IL
        apps_page.fill_artifact_name_field :ep, artname
      end

      step "Admin click on the OK button" do
        check_element_path :xpath  , CloudBeesApps::CONFIRM_NEW_ARTIFACT_EP, CloudBeesApps::CONFIRM_NEW_ARTIFACT_IL
        apps_page.confirm_new_artifact :ep
      end

      sleep 5

      step "Admin goes to the page", settings('cloud_bees')['environments_page'] do |url|
        page.visit url
      end

      step "Admin clicks create plus icon for new env " do
        check_element_path :css  , CloudBeesEnv::CREATE_ENV_PLUS_BTN_EP, CloudBeesEnv::CREATE_ENV_PLUS_BTN_IL
        env.create_new_env :ep
      end

      step "Admin clicks create new env button" do
        check_element_path :xpath  , CloudBeesEnv::CREATE_NEW_ENV_MODAL_BTN_EP, CloudBeesEnv::CREATE_NEW_ENV_MODAL_BTN_IL
        env.click_new_env_btn :ep
      end

      step "Admin fills the env name field",'envName' do |envName|
        check_element_path :xpath  , CloudBeesEnv::ENV_NAME_EP, CloudBeesEnv::ENV_NAME_IL
        env.fill_env_name_field :ep, envName
      end

      step "Admin click on Select Project dropdown" do
        check_element_path :xpath  , CloudBeesEnv::SELECT_PROJECT_EP, CloudBeesEnv::SELECT_PROJECT_IL
        env.click_on_select_project :ep
      end

      step "Admin select project from dropdown" do
        sleep 3
        check_element_path :xpath  , CloudBeesEnv::SELECT_DEFAULT_PROJECT_EP, CloudBeesEnv::SELECT_DEFAULT_PROJECT_IL
        env.click_to_select_default_project :ep
      end

      step "Admin click confirm button" do
        check_element_path :xpath  , CloudBeesEnv::CONFIRM_NEW_ENV_EP, CloudBeesEnv::CONFIRM_NEW_ENV_IL
        env.click_to_confirm_create_new_env :ep
      end

      step "Admin clicks to create resource tier" do
        sleep 4
        check_element_path :xpath  , CloudBeesEnvEditor::RESOURCE_TIER_EP, CloudBeesEnvEditor::RESOURCE_TIER_IL
        env_editor.click_resource_tier :ep
      end

      step "Admin clicks to add resource" do
        sleep 2
        check_element_path :css  , CloudBeesEnvEditor::ADD_RESOURCE_BTN_EP, CloudBeesEnvEditor::ADD_RESOURCE_BTN_IL
        env_editor.click_to_add_resource :ep
      end

      step "Admin select resource from list" do
        check_element_path :xpath  , CloudBeesEnvEditor::SELECT_RESOURCE_FROM_LIST_EP, CloudBeesEnvEditor::SELECT_RESOURCE_FROM_LIST_IL
        env_editor.select_resource_from_list :ep
      end

      step "Admin clicks close button" do
        check_element_path :css  , CloudBeesEnvEditor::CLOSE_BTN_EP, CloudBeesEnvEditor::CLOSE_BTN_IL
        env_editor.click_to_close_to_close_modal :ep
      end

      step "Admin clicks map to application link in hierarchy menu" do
        check_element_path :css  , CloudBeesEnvEditor::MAP_TO_APP_BTN_EP, CloudBeesEnvEditor::MAP_TO_APP_BTN_IL
        env_editor.click_map_to_app_hierarchy_menu :ep
      end

      step "Admin set application in search field", 'appName' do |appName|
        sleep 3
        check_element_path :css  , CloudBeesEnvEditor::APPNAME_IN_SEARCH_FIELD_EP, CloudBeesEnvEditor::APPNAME_IN_SEARCH_FIELD_IL
        env_editor.set_app_in_search :ep, appName
      end

      step "Admin select application from map list " do
        check_element_path :css  , CloudBeesEnvEditor::APPS_NAME_IN_MAPPING_MODAL_EP, CloudBeesEnvEditor::APPS_NAME_IN_MAPPING_MODAL_IL
        env_editor.select_app_from_maplist :ep
      end

      step "Admin clicks hamburger menu button to mapping" do
        check_element_path :css  , CloudBeesEnvEditor::MAPPING_SELECT_BTN_EP, CloudBeesEnvEditor::MAPPING_SELECT_BTN_IL
        env_editor.click_mapping_select_btn :ep
      end

      step "Admin select tier map from popover" do
        check_element_path :css  , CloudBeesEnvEditor::TIER_MAPPING_POPOVER_EP, CloudBeesEnvEditor::TIER_MAPPING_POPOVER_IL
        sleep 3
        env_editor.click_to_select_tier_for_map :ep
      end

      step "Admin clicks close button" do
        check_element_path :css  , CloudBeesEnvEditor::CLOSE_BTN_EP, CloudBeesEnvEditor::CLOSE_BTN_IL
        env_editor.click_to_close_to_close_modal :ep
      end

      sleep 3
    end


  end
end