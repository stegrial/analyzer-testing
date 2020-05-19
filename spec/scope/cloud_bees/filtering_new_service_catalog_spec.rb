require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

login_page = CloudBeesLogin.new
catalogs_page = CloudBeesCatalogs.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Filtering Service Catalog' do

    scenario 'Test - Recording', record: true do
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

      step "User goes to the page", settings('cloud_bees')['catalogs_page'] do |url|
        page.visit url
      end

      step "User clicks dropdown for opening catalog list" do
        check_element_path :css, CloudBeesCatalogs::CATALOGS_LIST_TA, CloudBeesCatalogs::CATALOGS_LIST_IL
        catalogs_page.click_to_open_catalog_list
      end

      step "User clicks application in list" do
        check_element_path :css, CloudBeesCatalogs::APPS_IN_CATALOG_LIST_TA, CloudBeesCatalogs::APPS_IN_CATALOG_LIST_IL
        catalogs_page.click_apps_in_catalog_list
      end

      step "User clicks dropdown for opening catalog list" do
        check_element_path :css, CloudBeesCatalogs::CATALOGS_LIST_TA, CloudBeesCatalogs::CATALOGS_LIST_IL
        catalogs_page.click_to_open_catalog_list
      end

      step "User clicks containers in list" do
        check_element_path :css, CloudBeesCatalogs::CONTAINERS_IN_CATALOG_LIST_TA, CloudBeesCatalogs::CONTAINERS_IN_CATALOG_LIST_IL
        catalogs_page.click_containers_in_catalog_list
      end

      step "User clicks dropdown for opening catalog list" do
        check_element_path :css, CloudBeesCatalogs::CATALOGS_LIST_TA, CloudBeesCatalogs::CATALOGS_LIST_IL
        catalogs_page.click_to_open_catalog_list
      end

      step "User clicks utility in list" do
        check_element_path :css, CloudBeesCatalogs::UTILITY_IN_CATALOG_LIST_TA, CloudBeesCatalogs::UTILITY_IN_CATALOG_LIST_IL
        catalogs_page.click_utility_in_catalog_list
      end

      sleep 3
    end

  end
end