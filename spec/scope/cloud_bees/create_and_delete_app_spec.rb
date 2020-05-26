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
  end

  feature 'Creating and Deleting application' do

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
          global_page.click_applications :il #step is duplicated below
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

        step "Admin clicks on the Create new Component" do
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

        step "Admin clicks on the OK button" do
          apps_page.confirm_new_artifact
          sleep 3 # to wait for a new artifact to be created
        end

        step "Admin clicks on the Hamburger menu button" do
          global_page.click_hamburger_menu
        end

        step "Admin chooses the Applications section in the Hamburger menu" do
          global_page.click_applications
        end

        step "Admin find application name", settings('cloud_bees')['app_name'] do |appname|
          apps_page.find_application_name_field appname
          sleep 3 # need wait for the filter will be applied
        end

        step "Admin clicks on new created application" do
          apps_page.select_app_list_item
        end

        step "Admin clicks on delete button" do
          apps_page.delete_application
        end

        step "Admin clicks on the OK button" do
          apps_page.confirm_delete_application
        end

        sleep 3
      end
    end

  end
end
