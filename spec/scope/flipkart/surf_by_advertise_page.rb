require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/flipkart/*.rb"


advertise_page = AdvertisePageFlipkart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Advertise page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('flipkart')['advertise_page'] do |url|
          page.visit url
        end

        step "User sees Power of Commerce Audience h2" do
          advertise_page.should_see_power_of_commerce_h2
          end

        step "User sees View All button" do
          advertise_page.should_see_view_all_btn
        end

        step "User sees Contact Us H2" do
          advertise_page.should_see_contact_us_h2
        end

        step "User click to select position", "Seller" do |value|
          advertise_page.click_on_position_select value
        end

        step "User fill Name field", "Tester" do |value|
          advertise_page.fill_name_field value
        end

        step "User fill Email field", "Tester@gmail.com" do |value|
          advertise_page.fill_email_field value
        end

        step "User fill Phone number field", "123456789" do |value|
          advertise_page.fill_phone_number_field value
        end

        step "User fill COmpany field", "QA" do |value|
          advertise_page.fill_company_field value
        end

        step "User click to select Organization Size", "501- 1000" do |value|
          advertise_page.click_on_organization_size value
        end

        step "User click to select Annual Marketing Budget", "50 Lakhs - 2 Crores" do |value|
          advertise_page.click_on_marketing_budget value
        end

        step "User click Submit button" do
          advertise_page.click_on_submit_btn
        end

        sleep 3
      end
    end

  end
end
