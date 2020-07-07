require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/walmart/*.rb"

media_page = WalmartMediaPage.new
contact_page = WalmartMediaContactPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by media contact page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('walmart')['walmartmedia_page'] do |url|
          page.visit url
        end

        step "User clicks on 'Get started' button" do
          media_page.click_on_get_started_btn
        end

        step "User fill first name field", "Tester" do |value|
          contact_page.fill_first_name value
        end

        step "User fill last name field", "Trueautomation" do |value|
          contact_page.fill_last_name value
        end

        step "User fill company name field", "TrueautomationIO" do |value|
          contact_page.fill_company_name value
        end

        step "User fill company website field", "https://www.walmartmedia.com" do |value|
          contact_page.fill_company_website value
        end

        step "User fill email field", "test@email.com" do |value|
          contact_page.fill_email_field value
        end

        step "User fill phone field", "+123456789" do |value|
          contact_page.fill_phone_field value
        end

        step "User click 'More than $25,000/month'" do
          contact_page.click_more_than_2500
        end

        step "User click 'Choose a Product'" do
          contact_page.click_choose_product
        end

        step "User click 'Advertising Strategy'" do
          contact_page.click_advertising_strategy
        end

        step "User fill Extra Text field", "test test" do |value|
          contact_page.fill_extra_text value
        end

        step "User click Human checkbox" do
          contact_page.click_human_checkbox
        end

        step "User click Accepts checkbox" do
          contact_page.click_accepts_checkbox
        end

        step "User click Continue button" do
          contact_page.click_continue_btn
        end

        sleep 3
      end
    end

  end
end
