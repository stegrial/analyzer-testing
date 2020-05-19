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

  feature 'Cloud Bees - Сhanging projects on Pipeline Runs page' do

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

      step "User clicks to select project" do
        pipelines_runs.click_to_select_proj :il #step is duplicated below
      end

      step "User clicks to select ec-examples project" do
        pipelines_runs.click_to_select_ec_examples_proj :il #step is duplicated below
      end

      step "User clicks on accept button" do
        pipelines_runs.click_to_accept_proj :il #step is duplicated below
      end

      step "User clicks to select project" do
        pipelines_runs.click_to_select_proj
      end

      step "User clicks to unselect ec-examples project" do
        pipelines_runs.click_to_select_ec_examples_proj
      end

      step "User clicks on accept button" do
        pipelines_runs.click_to_accept_proj
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

      step "User clicks to select project" do
        check_element_path :xpath, CloudBeesPipelinesRuns::PROJ_SELECT_TA, CloudBeesPipelinesRuns::PROJ_SELECT_IL
        pipelines_runs.click_to_select_proj
      end

      step "User clicks to select ec-examples project" do
        check_element_path :xpath, CloudBeesPipelinesRuns::EC_EXAMPLES_PROJ_TA, CloudBeesPipelinesRuns::EC_EXAMPLES_PROJ_IL
        pipelines_runs.click_to_select_ec_examples_proj
      end

      step "User clicks on accept button" do
        check_element_path :css, CloudBeesPipelinesRuns::ACCEPT_DROPDOWN_SELECTION_TA, CloudBeesPipelinesRuns::ACCEPT_DROPDOWN_SELECTION_IL
        pipelines_runs.click_to_accept_proj
      end

      step "User clicks to select project" do
        check_element_path :xpath, CloudBeesPipelinesRuns::PROJ_SELECT_TA, CloudBeesPipelinesRuns::PROJ_SELECT_IL
        pipelines_runs.click_to_select_proj
      end

      step "User clicks to unselect ec-examples project" do
        check_element_path :xpath, CloudBeesPipelinesRuns::EC_EXAMPLES_PROJ_TA, CloudBeesPipelinesRuns::EC_EXAMPLES_PROJ_IL
        pipelines_runs.click_to_select_ec_examples_proj
      end

      step "User clicks on accept button" do
        check_element_path :css, CloudBeesPipelinesRuns::ACCEPT_DROPDOWN_SELECTION_TA, CloudBeesPipelinesRuns::ACCEPT_DROPDOWN_SELECTION_IL
        pipelines_runs.click_to_accept_proj
      end

      sleep 3
    end

  end
end