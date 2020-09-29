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

  feature 'Сhanging projects on Pipeline Runs page' do

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

        sleep 3
      end
    end

  end
end
