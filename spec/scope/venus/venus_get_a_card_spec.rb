require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/venus/*.rb"

credit_venus = CreditVenus.new
card_page = GetCardPage.new
card_sign_up_page = CardSignUpPage.new
describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Venus - Get a Venus Card' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('venus')['get_card_page'] do |url|
          page.visit url
        end

        step "User should see benefits", 'Hassle Free' do |name|
          card_page.should_see_benefits name
        end

        step "User clicks Apply button" do
          card_page.click_apply_button
        end

        step "User fills email field", settings('venus')['email'] do |value|
          card_sign_up_page.fill_email_field value
        end

        step "User fills password field", settings('venus')['pass'] do |value|
          card_sign_up_page.fill_password_field value
        end

        step "User clicks Sign in button" do
          card_sign_up_page.click_sign_in_button
        end

        step "User fills First Name Field", "Qa" do |value|
          credit_venus.fill_first_name_field value
        end

        step "User fills Last Name Field", "Qa" do |value|
          credit_venus.fill_last_name_field value
        end

        step "User fills SSN Area Field", "Qa" do |value|
          credit_venus.fill_ssn_area_field value
        end

        step "User fills SSN Group Field", "111" do |value|
          credit_venus.fill_ssn_group_field value
        end

        step "User fills SSN Serial Field", "111" do |value|
          credit_venus.fill_ssn_serial_field value
        end

        step "User fills Birth Month Field", "10" do |value|
          credit_venus.fill_birth_month_field value
        end

        step "User fills Birth Day Field", "10" do |value|
          credit_venus.fill_birth_day_field value
        end

        step "User fills Birth Year Field", "2012" do |value|
          credit_venus.fill_birth_year_field value
        end

        step "User fills Annual Income Field", "1000" do |value|
          credit_venus.fill_annual_income_field value
        end

        step "User fills Address Field", "St Johnson Avenue, 1" do |value|
          credit_venus.fill_address_field value
        end

        step "User fills City Field", "NY" do |value|
          credit_venus.fill_city_field value
        end

        step "User fills ZIP Field", "1234" do |value|
          credit_venus.fill_zip_field value
        end

        step "User clicks agreement checkbox" do
          credit_venus.click_agreement_checkbox
        end

        step "User clicks Submit button" do
          credit_venus.click_submit_button
        end

      end
    end
  end
end