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

  feature 'Authorization (Login)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User click the account button" do
        header_page.click_sing_in_btn
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |email|
        login_page.fill_username_field email
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        login_page.fill_login_password pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sing_in
      end

      step "User clicks on the Account button" do
        login_page.click_account_btn
      end

      step "User clicks on the Sign Out link" do
        login_page.click_sing_out_link
      end
      sleep 3
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User click the account button" do
        check_element_path :xpath, TheTiebarLoginPage::SIGNIN_BTN_TA, TheTiebarLoginPage::SIGNIN_BTN_IL
        header_page.click_sing_in_btn
      end

      step "User fills the Username field", settings('thetiebar')['username'] do |username|
        check_element_path :xpath, TheTiebarLoginPage::USERNAME_TA, TheTiebarLoginPage::USERNAME_IL
        login_page.fill_username_field username
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        check_element_path :xpath, TheTiebarLoginPage::LOGIN_PASS_TA, TheTiebarLoginPage::LOGIN_PASS_IL
        login_page.fill_login_password pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :xpath, TheTiebarLoginPage::SIGN_IN_TA, TheTiebarLoginPage::SIGN_IN_IL
        login_page.click_sing_in
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_TA, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn
      end

      step "User clicks on the Sign Out link" do
        check_element_path :xpath, TheTiebarHeader::SIGN_OUT_LINK_IL, TheTiebarHeader::SIGN_OUT_LINK_IL
        header_page.click_sing_out_link
      end
    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User click the account button" do
        check_element_path :xpath, TheTiebarLoginPage::SIGNIN_BTN_EP, TheTiebarLoginPage::SIGNIN_BTN_IL
        header_page.click_sing_in_btn :ep
      end

      step "User fills the Username field", settings('thetiebar')['username'] do |username|
        check_element_path :xpath, TheTiebarLoginPage::USERNAME_EP, TheTiebarLoginPage::USERNAME_IL
        login_page.fill_username_field username, :ep
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        check_element_path :xpath, TheTiebarLoginPage::LOGIN_PASS_EP, TheTiebarLoginPage::LOGIN_PASS_IL
        login_page.fill_login_password pass, :ep
      end

      step "User clicks on the Sign In button" do
        check_element_path :xpath, TheTiebarLoginPage::SIGN_IN_EP, TheTiebarLoginPage::SIGN_IN_IL
        login_page.click_sing_in :ep
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_EP, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn :ep
      end

      step "User clicks on the Sign Out link" do
        check_element_path :xpath, TheTiebarHeader::SIGN_OUT_LINK_EP, TheTiebarHeader::SIGN_OUT_LINK_IL
        header_page.click_sing_out_link :ep
      end
    end
  end
end