require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/venus_pages/*.rb"

include ElementSearchValidation

navigation_page = VenusNavigation.new
login_page = VenusLogin.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  feature 'AT-13, TA returns the wrong element (Venus - Account button)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button :il
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        login_page.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        login_page.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button :il
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      2.times do
        step "User clicks on the Account button two times (for different pages)" do
          check_element_path :xpath, VenusNavigation::ACCOUNT_BUTTON_TA, VenusNavigation::ACCOUNT_BUTTON_IL
          navigation_page.click_account_button
        end
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      2.times do
        step "User clicks on the Account button two times (for different pages)" do
          check_element_path :xpath, VenusNavigation::ACCOUNT_BUTTON_EP, VenusNavigation::ACCOUNT_BUTTON_IL
          navigation_page.click_account_button :ep
        end
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button :il
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        login_page.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        login_page.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button :il
      end

      step "User clicks on the Account button" do
        sleep 3
        navigation_page.click_account_button
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      1.times do
        step "User clicks on the Account button" do
         sleep 3
          navigation_page.click_account_button
        end
      end

      sleep 3
    end


  end
end
