require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
apps_page = CloudBeesApps.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')

    step "Remove created application", settings('cloud_bees') do |data|
      page.visit data['applications_page']
      apps_page.find_application_name_field :il, data['app_name']
      apps_page.select_app_list_item :il
      apps_page.delete_application :il
      apps_page.confirm_delete_application :il
    end
  end

  feature 'Create Component Process with Step type and with further removal' do

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

        step "Admin click on the OK button" do
          apps_page.confirm_new_artifact
        end

        step "Admin click on new Component Processes" do
          apps_page.click_on_new_component_processes
        end

        step "Admin click on the button Create new" do
          apps_page.create_new_component_processes
        end

        step "Admin fills the process name field", "process_test_name" do |processname|
          apps_page.fill_process_name_field processname
        end

        step "Admin click on dropdown" do
          apps_page.click_on_dropdown_deploy_undeploy
        end

        step "Admin select on dropdown Undeploy" do
          apps_page.click_on_dropdown_undeploy
        end

        step "Admin clicks on dropdown Select Workspace" do
          apps_page.click_on_dropdown_select_workspace
        end

        step "Admin select on dropdown Default" do
          apps_page.click_default_dropdown_select_workspace
        end

        step "Admin confirm new Component Process" do
          apps_page.confirm_new_component_process
        end

        step "Admin clicks new step" do
          apps_page.click_on_new_step
        end

        step "Admin fills the step name field", "step_test_name" do |stepname|
          apps_page.fill_step_name_field stepname
        end

        step "Admin click on Next Button" do
          apps_page.click_on_next_step
        end

        step "Admin click on Command Step Type" do
          apps_page.click_on_command_step_type
        end

        step "Admin fills the command field", "ls-la" do |command|
          apps_page.fill_command_name_field command
        end

        step "Admin confirm Define Step" do
          apps_page.confirm_define_step
        end

        step "Admin clicks on humburger of Component process Step" do
          apps_page.click_on_humburger_component_step
        end

        step "Admin clicks on delete item Component Step" do
          apps_page.delete_component_step
        end

        step "Admin confirm delete Component Step" do
          apps_page.confirm_delete_component_step
        end

        sleep 3
      end
    end

  end
end
