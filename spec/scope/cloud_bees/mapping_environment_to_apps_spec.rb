require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
apps_page = CloudBeesApps.new
env = CloudBeesEnv.new
env_editor = CloudBeesEnvEditor.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')

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

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
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

        step "Admin fills the env name field", 'envName' do |envName|
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
    end

  end
end
