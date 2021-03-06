require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

login_page = TheTiebarLoginPage.new
account_page = TheTiebarAccount_page.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'AT-165 Cancel Button' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['preference_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |email|
        login_page.fill_username_field :il, email
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        login_page.fill_login_password :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sing_in :il
        sleep 3
      end

      step "User clicks delete account button" do
        account_page.click_delete_account_btn :il
      end

      step "User clicks cancel delete button" do
        account_page.click_cancel_delete_btn
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['preference_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |username|
        check_element_path :xpath, TheTiebarLoginPage::USERNAME_TA, TheTiebarLoginPage::USERNAME_IL
        login_page.fill_username_field :il, username
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        check_element_path :xpath, TheTiebarLoginPage::LOGIN_PASS_TA, TheTiebarLoginPage::LOGIN_PASS_IL
        login_page.fill_login_password :il, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :xpath, TheTiebarLoginPage::SIGN_IN_TA, TheTiebarLoginPage::SIGN_IN_IL
        login_page.click_sing_in :il
        sleep 3
      end

      step "User clicks delete account button" do
        check_element_path :xpath, TheTiebarAccount_page::DELETE_ACCOUNT_BTN_TA, TheTiebarAccount_page::DELETE_ACCOUNT_BTN_IL
        account_page.click_delete_account_btn :il
      end

      step "User clicks cancel delete button" do
        sleep 3
        check_element_path :xpath, TheTiebarAccount_page::CANCEL_DELETE_BTN_TA, TheTiebarAccount_page::CANCEL_DELETE_BTN_IL
        account_page.click_cancel_delete_btn
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['preference_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |username|
        check_element_path :xpath, TheTiebarLoginPage::USERNAME_EP, TheTiebarLoginPage::USERNAME_IL
        login_page.fill_username_field :ep, username
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        check_element_path :xpath, TheTiebarLoginPage::LOGIN_PASS_EP, TheTiebarLoginPage::LOGIN_PASS_IL
        login_page.fill_login_password :ep, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :xpath, TheTiebarLoginPage::SIGN_IN_EP, TheTiebarLoginPage::SIGN_IN_IL
        login_page.click_sing_in :ep
        sleep 3
      end

      step "User clicks delete account button" do
        check_element_path :xpath, TheTiebarAccount_page::DELETE_ACCOUNT_BTN_EP, TheTiebarAccount_page::DELETE_ACCOUNT_BTN_IL
        account_page.click_delete_account_btn :ep
      end

      step "User clicks other newsletter" do
        check_element_path :xpath, TheTiebarAccount_page::CANCEL_DELETE_BTN_EP, TheTiebarAccount_page::CANCEL_DELETE_BTN_IL
        account_page.click_cancel_delete_btn :ep
      end

    end

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('thetiebar')['preference_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |username|
        login_page.fill_username_field :il, username
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        login_page.fill_login_password :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sing_in :il
        sleep 3
      end

      step "User clicks delete account button" do
        account_page.click_delete_account_btn :il
      end

      step "User clicks cancel delete button" do
        sleep 3
        account_page.click_cancel_delete_btn
      end
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('thetiebar')['preference_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |username|
        login_page.fill_username_field :il, username
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        login_page.fill_login_password :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sing_in :il
        sleep 3
      end

      step "User clicks delete account button" do
        account_page.click_delete_account_btn :il
      end

      step "User clicks cancel delete button" do
        sleep 3
        account_page.click_cancel_delete_btn
      end
    end
  end
end