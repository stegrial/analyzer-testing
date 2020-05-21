require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
platform_page = CloudBeesPlatformHomePage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surfing on Platform home page' do

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
    end

  end
end
