require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
catalogs_page = CloudBeesCatalogs.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Filtering Service Catalog' do

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

        step "User goes to the page", settings('cloud_bees')['catalogs_page'] do |url|
          page.visit url
        end

        step "User clicks dropdown for opening catalog list" do
          catalogs_page.click_to_open_catalog_list :il # step is duplication below
        end

        step "User clicks application in list" do
          catalogs_page.click_apps_in_catalog_list
        end

        step "User clicks dropdown for opening catalog list" do
          catalogs_page.click_to_open_catalog_list :il # step is duplication below
        end

        step "User clicks containers in list" do
          catalogs_page.click_containers_in_catalog_list
        end

        step "User clicks dropdown for opening catalog list" do
          catalogs_page.click_to_open_catalog_list
        end

        step "User clicks utility in list" do
          catalogs_page.click_utility_in_catalog_list
        end

        sleep 3
      end
    end

  end
end
