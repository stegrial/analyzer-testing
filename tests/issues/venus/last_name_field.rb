require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/venus'

it = Venus.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA returns the wrong element (Venus - Last Name in the Account creating form)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('venus')['create_account_page'] do |url|
        page.visit url
      end

      step "User fills the First Name field", settings('venus')['first_name'] do |email|
        it.fill_first_name_field email
      end

      step "User fills the Last Name field", settings('venus')['last_name'] do |pass|
        it.fill_last_name_field pass
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        it.click_account_button :il
      end

      step "User clicks on the Create Account button" do
        it.click_create_account_btn :il
      end

      step "User fills the First Name field", settings('venus')['first_name'] do |email|
        check_element_path :id, Venus::FIRST_NAME_FIELD_TA, Venus::FIRST_NAME_FIELD_IL
        it.fill_first_name_field email
      end

      step "User fills the Last Name field", settings('venus')['last_name'] do |pass|
        check_element_path :id, Venus::LAST_NAME_FIELD_TA, Venus::LAST_NAME_FIELD_IL
        it.fill_last_name_field pass
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        it.click_account_button :il
      end

      step "User clicks on the Create Account button" do
        it.click_create_account_btn :il
      end

      step "User fills the First Name field", settings('venus')['first_name'] do |email|
        check_element_path :id, Venus::FIRST_NAME_FIELD_EP, Venus::FIRST_NAME_FIELD_IL
        it.fill_first_name_field :ep, email
      end

      step "User fills the Last Name field", settings('venus')['last_name'] do |pass|
        check_element_path :id, Venus::LAST_NAME_FIELD_EP, Venus::LAST_NAME_FIELD_IL
        it.fill_last_name_field :ep, pass
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('venus')['create_account_page'] do |url|
        page.visit url
      end

      step "User fills the First Name field", settings('venus')['first_name'] do |email|
        it.fill_first_name_field :il, email
      end

      step "User fills the Last Name field", settings('venus')['last_name'] do |pass|
        it.fill_last_name_field pass
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        it.click_account_button :il
      end

      step "User clicks on the Create Account button" do
        it.click_create_account_btn :il
      end

      step "User fills the First Name field", settings('venus')['first_name'] do |email|
        it.fill_first_name_field :il, email
      end

      step "User fills the Last Name field", settings('venus')['last_name'] do |pass|
        it.fill_last_name_field pass
      end

      sleep 3
    end


  end
end
