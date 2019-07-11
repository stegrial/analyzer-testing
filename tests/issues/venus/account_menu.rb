require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/venus'

it = Venus.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-734 TA returns the wrong element (Venus - Clicking on the Account menu items)' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        it.click_account_button
      end

      step "User fills the Email field", settings('venus')['email_field'] do |email|
        it.fill_email_field email
      end

      step "User fills the Pass field", settings('venus')['pass_field'] do |pass|
        it.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button
      end

      step "User clicks on the Account button" do
        it.click_account_button
      end

      step "User clicks on the Mail Options in the Account menu" do
        it.click_mail_options
      end

      sleep 3
    end

    scenario 'Searching IL', il_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, Venus::ACCOUNT_BUTTON_TA, Venus::ACCOUNT_BUTTON_IL
        it.click_account_button
      end

      step "User fills the Email field", settings('venus')['email_field'] do |email|
        check_element_path :id, Venus::EMAIL_FIELD_TA, Venus::EMAIL_FIELD_IL
        it.fill_email_field email
      end

      step "User fills the Pass field", settings('venus')['pass_field'] do |pass|
        check_element_path :id, Venus::PASS_FIELD_TA, Venus::PASS_FIELD_IL
        it.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :id, Venus::SIGN_IN_BTN_TA, Venus::SIGN_IN_BTN_IL
        it.click_sign_in_button
      end

      3.times do
        step "User clicks on the Account button" do
          check_element_path :xpath, Venus::ACCOUNT_BUTTON_TA, Venus::ACCOUNT_BUTTON_IL
          it.click_account_button
        end

        step "User clicks on the Mail Options in the Account menu" do
          check_element_path :xpath, Venus::MAIL_OPTIONS_TA, Venus::MAIL_OPTIONS_IL
          it.click_mail_options
        end
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, Venus::ACCOUNT_BUTTON_EP, Venus::ACCOUNT_BUTTON_IL
        it.click_account_button :ep
      end

      step "User fills the Email field", settings('venus')['email_field'] do |email|
        check_element_path :id, Venus::EMAIL_FIELD_EP, Venus::EMAIL_FIELD_IL
        it.fill_email_field :ep, email
      end

      step "User fills the Pass field", settings('venus')['pass_field'] do |pass|
        check_element_path :id, Venus::PASS_FIELD_EP, Venus::PASS_FIELD_IL
        it.fill_pass_field :ep, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :id, Venus::SIGN_IN_BTN_EP, Venus::SIGN_IN_BTN_IL
        it.click_sign_in_button :ep
      end

      3.times do
        step "User clicks on the Account button" do
          check_element_path :xpath, Venus::ACCOUNT_BUTTON_EP, Venus::ACCOUNT_BUTTON_IL
          it.click_account_button :ep
        end

        step "User clicks on the Mail Options in the Account menu" do
          check_element_path :xpath, Venus::MAIL_OPTIONS_TA, Venus::MAIL_OPTIONS_IL
          it.click_mail_options :ep
        end
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', rec_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        it.click_account_button :il
      end

      step "User fills the Email field", settings('venus')['email_field'] do |email|
        it.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass_field'] do |pass|
        it.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button :il
      end

      step "User clicks on the Account button" do
        sleep 2
        it.click_account_button :il
      end

      step "User clicks on the Mail Options in the Account menu" do
        it.click_mail_options
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

      step "User fills the Email field", settings('venus')['email_field'] do |email|
        it.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass_field'] do |pass|
        it.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button :il
      end

      step "User clicks on the Account button" do
        sleep 2
        it.click_account_button :il
      end

      step "User clicks on the Mail Options in the Account menu" do
        it.click_mail_options :il
      end

      step "User clicks on the Account button" do
        sleep 2
        it.click_account_button :il
      end

      step "User clicks on the Mail Options in the Account menu" do
        it.click_mail_options
      end


      sleep 3
    end


  end
end
