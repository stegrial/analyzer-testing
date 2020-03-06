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

  feature 'AT-86 Cloud Bees - Сhanging Run Status on Pipeline Runs page' do

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

      step "User clicks to select run status" do
        pipelines_runs.click_to_run_status
      end

      step "User clicks to select successful status" do
        pipelines_runs.click_to_select_successful_status :il
      end

      step "User clicks on apply button" do
        pipelines_runs.click_to_apply_status
      end
    end

    scenario 'Searching IL', il: true do
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
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do

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

      step "User goes to the page", settings('cloud_bees')['pipelines_run_page'] do |url|
        page.visit url
      end

      step "User clicks to select run status" do
        check_element_path :xpath, CloudBeesPipelinesRuns::RUN_STATUS_SELECT_EP, CloudBeesPipelinesRuns::RUN_STATUS_SELECT_IL
        pipelines_runs.click_to_run_status :ep
      end

      step "User clicks to select successful status" do
        check_element_path :css, CloudBeesPipelinesRuns::SUCCESSFUL_RUN_STATUS_EP, CloudBeesPipelinesRuns::SUCCESSFUL_RUN_STATUS_IL
        pipelines_runs.click_to_select_successful_status :ep
      end

      step "User clicks on apply button" do
        check_element_path :css, CloudBeesPipelinesRuns::APPLY_RUN_STATUS_EP, CloudBeesPipelinesRuns::APPLY_RUN_STATUS_IL
        pipelines_runs.click_to_apply_status :ep
      end
    end

    scenario 'Recording debug', record_debug: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il,credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "User goes to the page", settings('cloud_bees')['pipelines_run_page'] do |url|
        page.visit url
      end

      step "User clicks to select run status" do
        pipelines_runs.click_to_run_status :il
      end

      step "User clicks to select successful status" do
        pipelines_runs.click_to_select_successful_status :il
      end

      step "User clicks on apply button" do
        pipelines_runs.click_to_apply_status
      end
    end

    scenario 'Searching debug', search_debug: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il,credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "User goes to the page", settings('cloud_bees')['pipelines_run_page'] do |url|
        page.visit url
      end

      step "User clicks to select run status" do
        pipelines_runs.click_to_run_status :il
      end

      step "User clicks to select successful status" do
        pipelines_runs.click_to_select_successful_status :il
      end

      step "User clicks on apply button" do
        pipelines_runs.click_to_apply_status
      end
    end

  end
end