require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/venus_pages/*.rb"

navigation_page = VenusNavigation.new
login_page = VenusLogin.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  feature 'AT-23, TA returns the wrong element (Venus - Clicking on the Account menu items)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        login_page.fill_email_field email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        login_page.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button
        sleep 3 # to wait for the page is loaded, account menu can not be opened if the page is not loaded
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button
      end

      step "User clicks on the Mail Options in the Account menu" do
        navigation_page.click_mail_options
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, VenusNavigation::ACCOUNT_BUTTON_TA, VenusNavigation::ACCOUNT_BUTTON_IL
        navigation_page.click_account_button
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        check_element_path :id, VenusLogin::EMAIL_FIELD_TA, VenusLogin::EMAIL_FIELD_IL
        login_page.fill_email_field email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        check_element_path :id, VenusLogin::PASS_FIELD_TA, VenusLogin::PASS_FIELD_IL
        login_page.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :id, VenusLogin::SIGN_IN_BTN_TA, VenusLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
        sleep 3 # to wait for the page is loaded, account menu can not be opened if the page is not loaded
      end

      3.times do
        step "User clicks on the Account button" do
          check_element_path :xpath, VenusNavigation::ACCOUNT_BUTTON_TA, VenusNavigation::ACCOUNT_BUTTON_IL
          navigation_page.click_account_button
        end

        step "User clicks on the Mail Options in the Account menu" do
          check_element_path :xpath, VenusNavigation::MAIL_OPTIONS_TA, VenusNavigation::MAIL_OPTIONS_IL
          navigation_page.click_mail_options
          sleep 3 # to wait for the page is loaded, account menu can not be opened if the page is not loaded
        end
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, VenusNavigation::ACCOUNT_BUTTON_EP, VenusNavigation::ACCOUNT_BUTTON_IL
        navigation_page.click_account_button :ep
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        check_element_path :id, VenusLogin::EMAIL_FIELD_EP, VenusLogin::EMAIL_FIELD_IL
        login_page.fill_email_field :ep, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        check_element_path :id, VenusLogin::PASS_FIELD_EP, VenusLogin::PASS_FIELD_IL
        login_page.fill_pass_field :ep, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :id, VenusLogin::SIGN_IN_BTN_EP, VenusLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
        sleep 3 # to wait for the page is loaded, account menu can not be opened if the page is not loaded
      end

      3.times do
        step "User clicks on the Account button" do
          check_element_path :xpath, VenusNavigation::ACCOUNT_BUTTON_EP, VenusNavigation::ACCOUNT_BUTTON_IL
          navigation_page.click_account_button :ep
        end

        step "User clicks on the Mail Options in the Account menu" do
          check_element_path :xpath, VenusNavigation::MAIL_OPTIONS_TA, VenusNavigation::MAIL_OPTIONS_IL
          navigation_page.click_mail_options :ep
          sleep 3 # to wait for the page is loaded, account menu can not be opened if the page is not loaded
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
        sleep 3 # to wait for the page is loaded, account menu can not be opened if the page is not loaded
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button :il
      end

      step "User clicks on the Mail Options in the Account menu" do
        navigation_page.click_mail_options
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

      step "User fills the Email field", settings('venus')['email'] do |email|
        login_page.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        login_page.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button :il
        sleep 3 # to wait for the page is loaded, account menu can not be opened if the page is not loaded
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button :il
      end

      step "User clicks on the Mail Options in the Account menu" do
        navigation_page.click_mail_options :il
        sleep 3 # to wait for the page is loaded, account menu can not be opened if the page is not loaded
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button :il
      end

      step "User clicks on the Mail Options in the Account menu" do
        navigation_page.click_mail_options
      end


      sleep 3
    end


  end
end
