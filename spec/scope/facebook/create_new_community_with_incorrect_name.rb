require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

header_nav = HeaderNaviPageFacebook.new
business_page = BusinessPageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Creating a new community page'  do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('facebook')['main_page'] do |url|
          page.visit url
        end
        step "User set login in login field", settings('facebook')['login'] do |value|
          header_nav.set_email value
        end

        step "User set password in password field", settings('facebook')['pass'] do |value|
          header_nav.set_pass value
        end

        step "User  clicks on the login button for entering into account" do
          header_nav.click_login_btn
        end

        step "Need to press escape" do
          header_nav.escape
        end

        step "User click Create button" do
          header_nav.click_create_btn
        end

        step "User click Page link" do
          header_nav.click_menu_page_btn
        end

        step "User click Get Started Business button" do
          business_page.click_get_started_business_btn
        end

        step "User click Get  Business or Brand Text" do
          business_page.should_see_business_or_brand_text
        end

        step "User fill Page name field", "2-33e23$$%" do |value|
          business_page.fill_page_name value
        end

        step "User fill Add a category field", "Test Preparation Center" do |value|
          business_page.fill_add_a_category value
        end

        step "User click Test Preparation Center from list" do
          business_page.click_test_preparation_center
        end

        step "User fill Page address a category field", "Test address" do |value|
          business_page.fill_page_address value
        end

        step "User fill City address a category field", "Odessa, Ukraine" do |value|
          business_page.fill_city_address value
        end

        step "User fill phone number a category field", "+380972345678" do |value|
          business_page.fill_phone_number value
        end

        step "User fill zip code field", "06501" do |value|
          business_page.fill_zip_code value
        end

        step "User click checkbox 'Dont show my address'" do
          business_page.click_dont_show_address
        end

        step "User click Continue button" do
          business_page.click_continue_btn
        end

        step "User sees error message" do
          business_page.should_see_error_text
        end

        sleep 3
      end
    end

  end
end
