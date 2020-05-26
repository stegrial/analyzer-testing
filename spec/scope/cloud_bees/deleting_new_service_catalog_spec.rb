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

  feature 'Deleting new Service Catalog' do

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

        step "User clicks to create new catalog" do
          catalogs_page.click_to_create_new_catalog
        end

        step "User clicks to create new button" do
          catalogs_page.click_to_create_new_btn
        end

        step "User set name new catalog", 'new_name_catalog' do |value|
          catalogs_page.set_catalog_name value
        end

        step "User clicks to open project dropdown of new catalog" do
          catalogs_page.click_to_open_proj_drpodown
        end

        step "User select default project from list" do
          catalogs_page.select_proj_from_list
        end

        step "User clicks ok button in modal" do
          catalogs_page.click_ok_in_modal_btn
        end

        step "User clicks on catalog hamburger menu button" do
          catalogs_page.click_catalog_menu
        end

        step "User clicks delete button in menu" do
          catalogs_page.click_delete_catalog
        end

        step "User clicks ok button in modal" do
          catalogs_page.click_ok_btn_for_accept_delete
        end

        sleep 3
      end
    end

  end
end
