require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"
require 'securerandom'
random_string = SecureRandom.hex


# global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
pipelines_runs = CloudBeesPipelinesRuns.new

# This tests runs when the vpn is ON
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end
  feature 'Cloud Bees - Check multi action menu on Pipeline Run page' do

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

      step "User goes to the page", settings('cloud_bees')['pipelines_run_page'] do |url|
        page.visit url
      end

      step "User clicks on hamburger menu" do
        pipelines_runs.click_multi_action_menu
      end

      step "User clicks on hamburger menu" do
        pipelines_runs.click_properties_multi_menu
      end

      step "User clicks on hamburger menu" do
        pipelines_runs.click_close_modal
      end

      step "User clicks on hamburger menu" do
        pipelines_runs.click_access_control_multi_menu
      end

      step "User clicks on hamburger menu" do
        pipelines_runs.click_close_modal
      end

      step "User clicks on hamburger menu" do
        pipelines_runs.click_change_history_multi_menu
      end

      step "User clicks on hamburger menu" do
        pipelines_runs.click_close_modal
      end

    end

    scenario 'Searching IL', il: true do


    end
  end
end