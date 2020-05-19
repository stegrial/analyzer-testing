require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

login_page = CloudBeesLogin.new
platform_page = CloudBeesPlatformHomePage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Surfing on Platform home page' do

    scenario 'Test - Recording' do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field credentials['username']
        login_page.fill_pass_field credentials['pass']
        login_page.click_sign_in_button
      end

      step "Admin goes to the page", settings('cloud_bees')['platform_home_page'] do |url|
        sleep 3 # to wait for authorization
        page.visit url
      end

      step "Admin clicks on projects link" do
       platform_page.click_projects_link
      end

      step "Admin clicks on jobs link" do
        platform_page.click_jobs_link
      end

      step "Admin clicks on workflow link" do
        platform_page.click_workflows_link
      end

      step "Admin clicks on cloud link" do
        platform_page.click_cloud_link
      end

      step "Admin clicks on artifacts link" do
        platform_page.click_artifacts_link
      end

      step "Admin clicks on search link" do
        platform_page.click_search_link
      end

      step "Admin clicks on administration link" do
        platform_page.click_administration_link :il # step is duplicated below
        sleep 2 # for wait fully load page
      end

      # step "Admin sorts the Event Log" do
      #   sleep 30
      #   platform_page.click_sort_link :il # step is duplicated below
      # end

      step "Admin clicks on second row of run reports" do
        platform_page.click_to_open_second_row_run_report
      end

      step "Admin clicks on parameters  tabs" do
        platform_page.click_to_switch_parameters_in_table
      end

      step "Admin clicks on diagnostics tabs" do
        platform_page.click_to_switch_diagnostics_in_table
      end

      step "Admin clicks on administration link" do
        platform_page.click_administration_link
      end

      step "Admin sorts the Event Log" do
        platform_page.click_sort_link
      end

      step "Admin clicks on second subject row" do
        platform_page.click_to_open_second_subject_row
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

      step "Admin goes to the page", settings('cloud_bees')['platform_home_page'] do |url|
        sleep 3 # to wait for authorization
        page.visit url
      end

      step "Admin clicks on projects link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::PROJECTS_LINK_TA, CloudBeesPlatformHomePage::PROJECTS_LINK_IL
        platform_page.click_projects_link
      end

      step "Admin clicks on jobs link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::JOBS_LINK_TA, CloudBeesPlatformHomePage::JOBS_LINK_IL
        platform_page.click_jobs_link
      end

      step "Admin clicks on workflow link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::WORKFLOWS_LINK_TA, CloudBeesPlatformHomePage::WORKFLOWS_LINK_IL
        platform_page.click_workflows_link
      end

      step "Admin clicks on cloud link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::CLOUD_LINK_TA, CloudBeesPlatformHomePage::CLOUD_LINK_IL
        platform_page.click_cloud_link
      end

      step "Admin clicks on artifacts link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::ARTIFACTS_LINK_TA, CloudBeesPlatformHomePage::ARTIFACTS_LINK_IL
        platform_page.click_artifacts_link
      end

      step "Admin clicks on search link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::SEARCH_LINK_TA, CloudBeesPlatformHomePage::SEARCH_LINK_IL
        platform_page.click_search_link
      end

      step "Admin clicks on administration link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::ADMINISTRATION_LINK_TA, CloudBeesPlatformHomePage::ADMINISTRATION_LINK_IL
        platform_page.click_administration_link
      end

      step "Admin sorts the Event Log" do
        check_element_path :xpath, CloudBeesPlatformHomePage::SORT_LINK_TA, CloudBeesPlatformHomePage::SORT_LINK_IL
        platform_page.click_sort_link
      end

      step "Admin clicks on second row of run reports" do
        check_element_path :xpath, CloudBeesPlatformHomePage::JOB_RUN_REPORTS_SECOND_LINE_TA, CloudBeesPlatformHomePage::JOB_RUN_REPORTS_SECOND_LINE_IL
        platform_page.click_to_open_second_row_run_report
      end

      step "Admin clicks on parameters  tabs" do
        check_element_path :xpath, CloudBeesPlatformHomePage::PARAMETERS_TA, CloudBeesPlatformHomePage::PARAMETERS_IL
        platform_page.click_to_switch_parameters_in_table
      end

      step "Admin clicks on diagnostics tabs" do
        check_element_path :xpath, CloudBeesPlatformHomePage::DIAGNOSTICS_TA, CloudBeesPlatformHomePage::DIAGNOSTICS_IL
        platform_page.click_to_switch_diagnostics_in_table
      end

      step "Admin clicks on administration link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::ADMINISTRATION_LINK_TA, CloudBeesPlatformHomePage::ADMINISTRATION_LINK_IL
        platform_page.click_administration_link
      end

      step "Admin sorts the Event Log" do
        check_element_path :xpath, CloudBeesPlatformHomePage::SORT_LINK_TA, CloudBeesPlatformHomePage::SORT_LINK_IL
        platform_page.click_sort_link
      end

      step "Admin clicks on second subject row" do
        check_element_path :css, CloudBeesPlatformHomePage::SUBJECT_SECOND_ROW_TA, CloudBeesPlatformHomePage::SUBJECT_SECOND_ROW_IL
        platform_page.click_to_open_second_subject_row
      end

      sleep 3
    end

  end
end