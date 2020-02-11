require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

login_page = TheTiebarLoginPage.new
header_page = TheTiebarHeader.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Creating new account' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User click the account button" do
        header_page.click_sing_in_btn
      end

      step "User fills the Username field" do
        login_page.click_create_acc_tab
      end

      step "User fills the first name field", settings('thetiebar')['first_name'] do |first_name|
        login_page.fill_first_name first_name
      end

      step "User fills the last name field", settings('thetiebar')['last_name'] do |last_name|
        login_page.fill_last_name last_name
      end

      step "User fills the email  field", settings('thetiebar')['test_email'] do |email|
        login_page.fill_email email
      end

      step "User fills the last name field", settings('thetiebar')['password'] do |pass|
        login_page.fill_password pass
      end

      step "User fills the last name field", settings('thetiebar')['password'] do |pass|
        login_page.fill_confirm_password pass
      end

      step "User clicks to uncheck checkbox" do
        login_page.click_uncheck_checkbox
      end

      step "User clicks to create acc btn" do
        login_page.click_create_acc_btn
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User click the account button" do
        check_element_path :xpath, TheTiebarHeader::SIGNIN_BTN_TA, TheTiebarHeader::SIGNIN_BTN_IL
        header_page.click_sing_in_btn
      end

      step "User fills the Username field" do
        check_element_path :xpath, TheTiebarLoginPage::CREATE_ACCOUNT_TAB_TA, TheTiebarLoginPage::CREATE_ACCOUNT_TAB_IL
        login_page.click_create_acc_tab
      end

      step "User fills the first name field", settings('thetiebar')['first_name'] do |first_name|
        check_element_path :xpath, TheTiebarLoginPage::FIRST_NAME_TA, TheTiebarLoginPage::FIRST_NAME_IL
        login_page.fill_first_name first_name
      end

      step "User fills the last name field", settings('thetiebar')['last_name'] do |last_name|
        check_element_path :xpath, TheTiebarLoginPage::LAST_NAME_TA, TheTiebarLoginPage::LAST_NAME_IL
        login_page.fill_last_name last_name
      end

      step "User fills the email  field", settings('thetiebar')['test_email'] do |email|
        check_element_path :xpath, TheTiebarLoginPage::EMAIL_TA, TheTiebarLoginPage::EMAIL_IL
        login_page.fill_email email
      end

      step "User fills the last name field", settings('thetiebar')['password'] do |pass|
        check_element_path :xpath, TheTiebarLoginPage::PASSWORD_TA, TheTiebarLoginPage::PASSWORD_IL
        login_page.fill_password pass
      end

      step "User fills the last name field", settings('thetiebar')['password'] do |pass|
        check_element_path :xpath, TheTiebarLoginPage::CONFIRM_PASSWORD_TA, TheTiebarLoginPage::CONFIRM_PASSWORD_IL
        login_page.fill_confirm_password pass
      end

      step "User clicks to uncheck checkbox" do
        check_element_path :xpath, TheTiebarLoginPage::OPTION_INPUT_TA, TheTiebarLoginPage::OPTION_INPUT_IL
        login_page.click_uncheck_checkbox
      end

      step "User clicks to create acc btn" do
        check_element_path :xpath, TheTiebarLoginPage::CREATE_ACCOUNT_BTN_TA, TheTiebarLoginPage::CREATE_ACCOUNT_BTN_IL
        login_page.click_create_acc_btn
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User click the account button" do
        check_element_path :xpath, TheTiebarHeader::SIGNIN_BTN_EP, TheTiebarHeader::SIGNIN_BTN_IL
        header_page.click_sing_in_btn :ep
      end

      step "User fills the Username field" do
        check_element_path :xpath, TheTiebarLoginPage::CREATE_ACCOUNT_TAB_EP, TheTiebarLoginPage::CREATE_ACCOUNT_TAB_IL
        login_page.click_create_acc_tab :ep
      end

      step "User fills the first name field", settings('thetiebar')['first_name'] do |first_name|
        check_element_path :xpath, TheTiebarLoginPage::FIRST_NAME_EP, TheTiebarLoginPage::FIRST_NAME_IL
        login_page.fill_first_name first_name, :ep
      end

      step "User fills the last name field", settings('thetiebar')['last_name'] do |last_name|
        check_element_path :xpath, TheTiebarLoginPage::LAST_NAME_EP, TheTiebarLoginPage::LAST_NAME_IL
        login_page.fill_last_name last_name, :ep
      end

      step "User fills the email  field", settings('thetiebar')['test_email'] do |email|
        check_element_path :xpath, TheTiebarLoginPage::EMAIL_EP, TheTiebarLoginPage::EMAIL_IL
        login_page.fill_email email, :ep
      end

      step "User fills the last name field", settings('thetiebar')['password'] do |pass|
        check_element_path :xpath, TheTiebarLoginPage::PASSWORD_EP, TheTiebarLoginPage::PASSWORD_IL
        login_page.fill_password pass, :ep
      end

      step "User fills the last name field", settings('thetiebar')['password'] do |pass|
        check_element_path :xpath, TheTiebarLoginPage::CONFIRM_PASSWORD_EP, TheTiebarLoginPage::CONFIRM_PASSWORD_IL
        login_page.fill_confirm_password pass, :ep
      end

      step "User clicks to uncheck checkbox" do
        check_element_path :xpath, TheTiebarLoginPage::OPTION_INPUT_EP, TheTiebarLoginPage::OPTION_INPUT_IL
        login_page.click_uncheck_checkbox :ep
      end

      step "User clicks to create acc btn" do
        check_element_path :xpath, TheTiebarLoginPage::CREATE_ACCOUNT_BTN_EP, TheTiebarLoginPage::CREATE_ACCOUNT_BTN_IL
        login_page.click_create_acc_btn :ep
      end
    end
  end
end