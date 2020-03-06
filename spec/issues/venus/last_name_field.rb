require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/venus_pages/*.rb"

include ElementSearchValidation

create_account_page = VenusCreateAccount.new
navigation_page = VenusNavigation.new
login_page = VenusLogin.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  feature 'TA returns the wrong element (Venus - Last Name in the Account creating form)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('venus')['create_account_page'] do |url|
        page.visit url
      end

      step "User fills the First Name field", settings('venus')['first_name'] do |email|
        create_account_page.fill_first_name_field email
      end

      step "User fills the Last Name field", settings('venus')['last_name'] do |pass|
        create_account_page.fill_last_name_field pass
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button :il
      end

      step "User clicks on the Create Account button" do
        login_page.click_create_account_btn :il
      end

      step "User fills the First Name field", settings('venus')['first_name'] do |email|
        check_element_path :id, VenusCreateAccount::FIRST_NAME_FIELD_TA, VenusCreateAccount::FIRST_NAME_FIELD_IL
        create_account_page.fill_first_name_field email
      end

      step "User fills the Last Name field", settings('venus')['last_name'] do |pass|
        check_element_path :id, VenusCreateAccount::LAST_NAME_FIELD_TA, VenusCreateAccount::LAST_NAME_FIELD_IL
        create_account_page.fill_last_name_field pass
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button :il
      end

      step "User clicks on the Create Account button" do
        login_page.click_create_account_btn :il
      end

      step "User fills the First Name field", settings('venus')['first_name'] do |email|
        check_element_path :id, VenusCreateAccount::FIRST_NAME_FIELD_EP, VenusCreateAccount::FIRST_NAME_FIELD_IL
        create_account_page.fill_first_name_field :ep, email
      end

      step "User fills the Last Name field", settings('venus')['last_name'] do |pass|
        check_element_path :id, VenusCreateAccount::LAST_NAME_FIELD_EP, VenusCreateAccount::LAST_NAME_FIELD_IL
        create_account_page.fill_last_name_field :ep, pass
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('venus')['create_account_page'] do |url|
        page.visit url
      end

      step "User fills the First Name field", settings('venus')['first_name'] do |email|
        create_account_page.fill_first_name_field :il, email
      end

      step "User fills the Last Name field", settings('venus')['last_name'] do |pass|
        create_account_page.fill_last_name_field pass
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button :il
      end

      step "User clicks on the Create Account button" do
        login_page.click_create_account_btn :il
      end

      step "User fills the First Name field", settings('venus')['first_name'] do |email|
        create_account_page.fill_first_name_field :il, email
      end

      step "User fills the Last Name field", settings('venus')['last_name'] do |pass|
        create_account_page.fill_last_name_field pass
      end

      sleep 3
    end


  end
end
