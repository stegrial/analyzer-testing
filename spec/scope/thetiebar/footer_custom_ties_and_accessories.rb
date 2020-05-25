require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

custom_page = TheTiebarCusromPage.new
about_us_page = TheTiebarAboutUs.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Footer: CUSTOM TIES AND ACCESSORIES' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['custom_page'] do |url|
          page.visit url
        end

        step "User click the close cookies div" do
          about_us_page.click_close_coolies_div
        end

        step "User fill first name in field", "test_name" do |first_name|
          custom_page.fill_first_name_field first_name
        end

        step "User fill last name in field", "last_test_name" do |last_name|
          custom_page.fill_last_name_field last_name
        end

        step "User fill email  in field", "email.test@gmail.com" do |email|
          custom_page.fill_email_field email
        end

        step "User fill address  in field", "address" do |address|
          custom_page.fill_address_field address
        end

        step "User fill city in field", "test_city" do |city|
          custom_page.fill_city_field city
        end

        step "User fill state in field", "Arkansas" do |state|
          custom_page.fill_state_field state
        end

        step "User fill zip code in field", "01011" do |zipcode|
          custom_page.fill_zip_code_field zipcode
        end

        step "User fill phone number in field", "+78940503434" do |number|
          custom_page.fill_phone_number_field number
        end

        step "User select bow ties radio button" do
          custom_page.select_bow_ties_1_radiobtn
        end

        step "User select scarves radio button" do
          custom_page.select_scarves_2_radiobtn
        end

        step "User select ties radio button" do
          custom_page.select_ties_3_radiobtn
        end

        step "User click submit button" do
          #sleep 3
          custom_page.click_submit_btn
        end

        sleep 3
      end
    end

  end
end
