require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
components_page = CloudBeesComponents.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Add Parameters for new Master Component' do

  $run_count.times do
    scenario 'Test - Recording', "#{$tag}": true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin logs in", settings('cloud_bees') do |credentials|
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
if false
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

      step "Admin select on the drop-down EC-Artifact" do
        components_page.select_ec_artifact
      end

      step "Admin fills the artifact name field", "artifact_test_name" do |artname|
        components_page.fill_artifact_name_field artname
      end

      step "Admin click on the OK button" do
        components_page.confirm_new_artifact
        sleep 3 # need to wait for the component with artifact to be created
      end

      step "Admin find component name field", "component_test_name" do |find_comp|
        components_page.find_component_name_field find_comp
        sleep 3 # need wait for the filter will be applied
      end

      step "Admin choose Component" do
        components_page.select_master_component_from_list
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

      step "Admin fill parameter name field", 'test_parameter' do |param_name|
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
        sleep 3 # need wait for the end of the previous step
        components_page.click_close_parameters
      end

      step "Admin click delete Component" do
        components_page.click_delete_component
      end

      step "Admin confirm delete Component" do
        components_page.confirm_delete_component
      end
end
      sleep 3
    end
  end

  end
end