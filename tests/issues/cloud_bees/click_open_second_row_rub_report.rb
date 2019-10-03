require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
platform_page = CloudBeesPlatformHomePage.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  feature 'AT-101, TA Analyzer returns the wrong element on the page (Cloud Bees - Second row run report element)' do

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

      step "Admin goes to the page", settings('cloud_bees')['platform_home_page'] do |url|
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

      step "Admin clicks on projects link" do
        platform_page.click_artifacts_link
      end

      step "Admin clicks on projects link" do
        platform_page.click_search_link
      end

      step "Admin clicks on projects link" do
        platform_page.click_administration_link
      end

      step "Admin clicks on second row of run reports" do
        platform_page.click_to_open_second_row_run_report
      end

      sleep 3
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

      step "Admin goes to the page", settings('cloud_bees')['platform_home_page'] do |url|
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

      step "Admin clicks on second row of run reports" do
        check_element_path :xpath, CloudBeesPlatformHomePage::JOB_RUN_REPORTS_SECOND_LINE_TA, CloudBeesPlatformHomePage::JOB_RUN_REPORTS_SECOND_LINE_IL
        platform_page.click_to_open_second_row_run_report
      end

      sleep 3
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

      step "Admin goes to the page", settings('cloud_bees')['platform_home_page'] do |url|
        page.visit url
      end

      step "Admin clicks on projects link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::PROJECTS_LINK_EP, CloudBeesPlatformHomePage::PROJECTS_LINK_IL
        platform_page.click_projects_link :ep
      end

      step "Admin clicks on jobs link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::JOBS_LINK_EP, CloudBeesPlatformHomePage::JOBS_LINK_IL
        platform_page.click_jobs_link :ep
      end

      step "Admin clicks on workflow link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::WORKFLOWS_LINK_EP, CloudBeesPlatformHomePage::WORKFLOWS_LINK_IL
        platform_page.click_workflows_link :ep
      end

      step "Admin clicks on cloud link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::CLOUD_LINK_EP, CloudBeesPlatformHomePage::CLOUD_LINK_IL
        platform_page.click_cloud_link :ep
      end

      step "Admin clicks on artifacts link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::ARTIFACTS_LINK_EP, CloudBeesPlatformHomePage::ARTIFACTS_LINK_IL
        platform_page.click_artifacts_link :ep
      end

      step "Admin clicks on search link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::SEARCH_LINK_EP, CloudBeesPlatformHomePage::SEARCH_LINK_IL
        platform_page.click_search_link :ep
      end

      step "Admin clicks on administration link" do
        check_element_path :xpath, CloudBeesPlatformHomePage::ADMINISTRATION_LINK_EP, CloudBeesPlatformHomePage::ADMINISTRATION_LINK_IL
        platform_page.click_administration_link :ep
      end

      step "Admin clicks on second row of run reports" do
        check_element_path :xpath, CloudBeesPlatformHomePage::JOB_RUN_REPORTS_SECOND_LINE_EP, CloudBeesPlatformHomePage::JOB_RUN_REPORTS_SECOND_LINE_IL
        platform_page.click_to_open_second_row_run_report :ep
      end

      sleep 3
    end

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      sleep 5

      step "Admin goes to the page", settings('cloud_bees')['platform_home_page'] do |url|
        page.visit url
      end

      step "Admin clicks on projects link" do
        platform_page.click_projects_link :il
      end

      step "Admin clicks on jobs link" do
        platform_page.click_jobs_link :il
      end

      step "Admin clicks on workflow link" do
        platform_page.click_workflows_link :il
      end

      step "Admin clicks on cloud link" do
        platform_page.click_cloud_link :il
      end

      step "Admin clicks on projects link" do
        platform_page.click_artifacts_link :il
      end

      step "Admin clicks on projects link" do
        platform_page.click_search_link :il
      end

      step "Admin clicks on projects link" do
        platform_page.click_administration_link :il
      end

      step "Admin clicks on second row of run reports" do
        platform_page.click_to_open_second_row_run_report
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      sleep 5

      step "Admin goes to the page", settings('cloud_bees')['platform_home_page'] do |url|
        page.visit url
      end

      step "Admin clicks on projects link" do
        platform_page.click_projects_link :il
      end

      step "Admin clicks on jobs link" do
        platform_page.click_jobs_link :il
      end

      step "Admin clicks on workflow link" do
        platform_page.click_workflows_link :il
      end

      step "Admin clicks on cloud link" do
        platform_page.click_cloud_link :il
      end

      step "Admin clicks on projects link" do
        platform_page.click_artifacts_link :il
      end

      step "Admin clicks on projects link" do
        platform_page.click_search_link :il
      end

      step "Admin clicks on projects link" do
        platform_page.click_administration_link :il
      end

      step "Admin clicks on second row of run reports" do
        platform_page.click_to_open_second_row_run_report
      end

      sleep 3
    end

  end
end