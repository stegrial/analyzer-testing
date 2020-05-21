require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
pipelines_runs = CloudBeesPipelinesRuns.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Cloud Bees - Check multi action menu on Pipeline Run page' do

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

        step "User goes to the page", settings('cloud_bees')['pipelines_run_page'] do |url|
          page.visit url
        end

        step "User clicks on multi menu" do
          pipelines_runs.click_multi_action_menu :il # step is duplication below
        end

        step "User clicks on properties in menu" do
          pipelines_runs.click_properties_multi_menu
        end

        step "User clicks on close icon" do
          pipelines_runs.click_close_modal_properties
        end

        step "User clicks on multi menu" do
          pipelines_runs.click_multi_action_menu :il # step is duplication below
        end

        step "User clicks on access control in menu" do
          pipelines_runs.click_access_control_multi_menu
        end

        step "User clicks on close icon" do
          pipelines_runs.click_close_modal_access
        end

        step "User clicks on multi menu" do
          pipelines_runs.click_multi_action_menu
        end

        step "User clicks on chacge history in menu" do
          pipelines_runs.click_change_history_multi_menu
        end

        step "User clicks on history close icon" do
          pipelines_runs.click_history_close_modal
        end

        sleep 3
      end
    end

  end
end
