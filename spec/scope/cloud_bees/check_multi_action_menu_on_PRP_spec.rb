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

  feature 'Cloud Bees - Check multi action menu on Pipeline Run page' do

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

      step "User clicks on multi menu" do
        check_element_path :xpath, CloudBeesPipelinesRuns::FIRST_MULTI_MENU_TA, CloudBeesPipelinesRuns::FIRST_MULTI_MENU_IL
        pipelines_runs.click_multi_action_menu
      end

      step "User clicks on properties menu" do
        check_element_path :xpath, CloudBeesPipelinesRuns::PROPERTIES_MULTI_MENU_TA, CloudBeesPipelinesRuns::PROPERTIES_MULTI_MENU_IL
        pipelines_runs.click_properties_multi_menu
      end

      step "User clicks on close icon" do
        check_element_path :css, CloudBeesPipelinesRuns::CLOSE_MODAL_PROPERTIES_ICON_TA, CloudBeesPipelinesRuns::CLOSE_MODAL_PROPERTIES_ICON_IL
        pipelines_runs.click_close_modal_properties
      end

      step "User clicks on multi menu" do
        check_element_path :xpath, CloudBeesPipelinesRuns::FIRST_MULTI_MENU_TA, CloudBeesPipelinesRuns::FIRST_MULTI_MENU_IL
        pipelines_runs.click_multi_action_menu
      end

      step "User clicks on access control in menu" do
        check_element_path :xpath, CloudBeesPipelinesRuns::ACCESS_CONTROL_MULTI_MENU_TA, CloudBeesPipelinesRuns::ACCESS_CONTROL_MULTI_MENU_IL
        pipelines_runs.click_access_control_multi_menu
      end

      step "User clicks on close icon" do
        check_element_path :css, CloudBeesPipelinesRuns::CLOSE_MODAL_ACCESS_ICON_TA, CloudBeesPipelinesRuns::CLOSE_MODAL_ACCESS_ICON_IL
        pipelines_runs.click_close_modal_access
      end

      step "User clicks on multi menu" do
        check_element_path :xpath, CloudBeesPipelinesRuns::FIRST_MULTI_MENU_TA, CloudBeesPipelinesRuns::FIRST_MULTI_MENU_IL
        pipelines_runs.click_multi_action_menu
      end

      step "User clicks on change history in menu" do
        check_element_path :xpath, CloudBeesPipelinesRuns::CHANGE_HISTORY_MULTI_MENU_TA, CloudBeesPipelinesRuns::CHANGE_HISTORY_MULTI_MENU_IL
        pipelines_runs.click_change_history_multi_menu
      end

      step "User clicks on history close icon" do
       check_element_path :css, CloudBeesPipelinesRuns::HISTORY_CLOSE_MODAL_ICON_TA, CloudBeesPipelinesRuns::HISTORY_CLOSE_MODAL_ICON_IL
        pipelines_runs.click_history_close_modal
      end

      sleep 3
    end

  end
end