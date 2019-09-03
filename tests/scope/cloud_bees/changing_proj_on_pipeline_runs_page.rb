require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
pipelines_runs = CloudBeesPipelinesRuns.new

# This tests runs when the vpn is ON
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)

  end

  after(:all) do
    Capybara.current_session.driver.quit
  end
  feature 'Cloud Bees - Сhanging projects on Pipeline Runs page' do

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

      step "User clicks to select project" do
        pipelines_runs.click_to_select_proj
      end

      step "User clicks to select ec-examples project" do
        pipelines_runs.click_to_select_ec_examples_proj
      end

      step "User clicks on accept button" do
        pipelines_runs.click_to_accept_proj
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


      step "User clicks to select project" do
        check_element_path :xpath, CloudBeesPipelinesRuns::PROJ_SELECT_EP, CloudBeesPipelinesRuns::PROJ_SELECT_IL
        pipelines_runs.click_to_select_proj :ep
      end

      step "User clicks to select ec-examples project" do
        check_element_path :xpath, CloudBeesPipelinesRuns::EC_EXAMPLES_PROJ_EP, CloudBeesPipelinesRuns::EC_EXAMPLES_PROJ_IL
        pipelines_runs.click_to_select_ec_examples_proj :ep
      end

      step "User clicks on accept button" do
        check_element_path :css, CloudBeesPipelinesRuns::ACCEPT_DROPDOWN_SELECTION_EP, CloudBeesPipelinesRuns::ACCEPT_DROPDOWN_SELECTION_IL
        pipelines_runs.click_to_accept_proj :ep
      end

      step "User clicks to select project" do
        check_element_path :xpath, CloudBeesPipelinesRuns::PROJ_SELECT_EP, CloudBeesPipelinesRuns::PROJ_SELECT_IL
        pipelines_runs.click_to_select_proj :ep
      end

      step "User clicks to unselect ec-examples project" do
        check_element_path :xpath, CloudBeesPipelinesRuns::EC_EXAMPLES_PROJ_EP, CloudBeesPipelinesRuns::EC_EXAMPLES_PROJ_IL
        pipelines_runs.click_to_select_ec_examples_proj :ep
      end

      step "User clicks on accept button" do
        check_element_path :css, CloudBeesPipelinesRuns::ACCEPT_DROPDOWN_SELECTION_EP, CloudBeesPipelinesRuns::ACCEPT_DROPDOWN_SELECTION_IL
        pipelines_runs.click_to_accept_proj :ep
      end
    end

  end
end