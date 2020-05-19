require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

login_page = CloudBeesLogin.new
pipelines_runs = CloudBeesPipelinesRuns.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Cloud Bees - Сhanging Run Status on Pipeline Runs page' do

    scenario 'Test - Recording', record: true do

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

      step "User clicks to select run status" do
        pipelines_runs.click_to_run_status :il #step is duplicated below
      end

      step "User clicks to select successful status" do
        pipelines_runs.click_to_select_successful_status
      end

      step "User clicks on apply button" do
        pipelines_runs.click_to_apply_status :il #step is duplicated below
      end

      step "User clicks to select run status" do
        pipelines_runs.click_to_run_status
      end

      step "User clicks to select error status" do
        pipelines_runs.click_to_select_error_status
      end

      step "User clicks on apply button" do
        pipelines_runs.click_to_apply_status
      end

      sleep 3
    end

    scenario 'Test - Searching', search: true do
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

      step "User goes to the page", settings('cloud_bees')['pipelines_run_page'] do |url|
        page.visit url
      end

      step "User clicks to select run status" do
        check_element_path :xpath, CloudBeesPipelinesRuns::RUN_STATUS_SELECT_TA, CloudBeesPipelinesRuns::RUN_STATUS_SELECT_IL
        pipelines_runs.click_to_run_status
      end

      step "User clicks to select successful status" do
        check_element_path :css, CloudBeesPipelinesRuns::SUCCESSFUL_RUN_STATUS_TA, CloudBeesPipelinesRuns::SUCCESSFUL_RUN_STATUS_IL
        pipelines_runs.click_to_select_successful_status
      end

      step "User clicks on apply button" do
        check_element_path :css, CloudBeesPipelinesRuns::APPLY_RUN_STATUS_TA, CloudBeesPipelinesRuns::APPLY_RUN_STATUS_IL
        pipelines_runs.click_to_apply_status
      end

      step "User clicks to select run status" do
        check_element_path :xpath, CloudBeesPipelinesRuns::RUN_STATUS_SELECT_TA, CloudBeesPipelinesRuns::RUN_STATUS_SELECT_IL
        pipelines_runs.click_to_run_status
      end

      step "User clicks to unselect  error status" do
        check_element_path :css, CloudBeesPipelinesRuns::ERROR_RUN_STATUS_TA, CloudBeesPipelinesRuns::ERROR_RUN_STATUS_IL
        pipelines_runs.click_to_select_error_status
      end

      step "User clicks on apply button" do
        check_element_path :css, CloudBeesPipelinesRuns::APPLY_RUN_STATUS_TA, CloudBeesPipelinesRuns::APPLY_RUN_STATUS_IL
        pipelines_runs.click_to_apply_status
      end

      sleep 3
    end

  end
end