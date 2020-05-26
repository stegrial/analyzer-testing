require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
apps = CloudBeesApps.new
apps_editor = CloudBeesAppsEditor.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Creating new application component - GWT - fields' do

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

        step "User clicks on hamburger menu" do
          global_page.click_hamburger_menu
        end
        step "User clicks on applications link" do
          global_page.click_applications
        end

        step "User clicks on application from list" do
          apps.select_application_from_list
        end

        step "User clicks on add new component" do
          apps_editor.click_add_new_component
        end

        step "User clicks on component button" do
          apps_editor.click_component_btn
        end

        step "User clicks on create new application component" do
          apps_editor.click_for_create_new_app_component
        end

        step "User sets new application component name", 'appName' do |value|
          apps_editor.set_new_name value
        end

        step "User sets new application component description", 'description' do |value|
          apps_editor.set_description value
        end

        step "User click on ok button" do
          apps_editor.click_next_btn
        end

        step "User click on dropdown" do
          sleep 3
          apps_editor.click_component_dropdown
        end

        step "User select artifact" do
          apps_editor.click_artifactory
        end

        step "User set configuration text in input", 'test' do |value|
          apps_editor.set_configuration value
        end

        step "User set repository in input", 'test' do |value|
          apps_editor.set_repository_key value
        end

        step "User set organization in input", 'test' do |value|
          apps_editor.set_organization_path value
        end

        step "User set artifact in input", 'test' do |value|
          apps_editor.set_artifact value
        end

        step "User set version in input", 'test' do |value|
          apps_editor.set_version value
        end

        step "User set extention in inputt", 'test' do |value|
          apps_editor.set_extention value
        end

        step "User click on ok button" do
          sleep 5
          apps_editor.click_ok_in_modal_btn
        end

        step "User click on multimenu button" do
          apps_editor.click_multi_menu
        end

        step "User click on delete item for deleting" do
          apps_editor.click_delete
        end

        step "User click on ok button for accepting" do
          apps_editor.click_warning_ok_btn
        end

        sleep 3
      end
    end

  end
end
