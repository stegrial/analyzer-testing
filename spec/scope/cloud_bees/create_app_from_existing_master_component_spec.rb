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

  feature 'Create Application Component from Existing Master Component' do

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
    end

  end
end
