require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/thetiebar/*.rb"

include ElementSearchValidation

login_page = TheTiebarLoginPage.new
account_page = TheTiebarAccount_page.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Preferences Page' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['preference_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |email|
        login_page.fill_username_field email
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        login_page.fill_login_password pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sing_in
        sleep 3
      end

      step "User clicks subscribe email togler" do
        account_page.click_subscribe_email_togler
      end

      step "User clicks other newsletter" do
        account_page.click_other_newsletter
      end

      step "User clicks twice catalog togler" do
        account_page.click_print_catalog_togler
        account_page.click_print_catalog_togler
      end

      step "User clicks other catalog dropdown" do
        account_page.click_other_catalog
      end

      step "User clicks save changes button" do
        account_page.click_save_changes_btn
      end

      step "User clicks close changes button" do
        account_page.click_close_save_changes_modal
      end

      step "User clicks view privacy policy button" do
        account_page.click_view_privacy_policy_btn
      end

      step "User should sees privacy policy page" do
        account_page.should_see_privacy_policy_page
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['preference_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |username|
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
        sleep 3
      end

      step "User clicks subscribe email togler" do
        check_element_path :xpath, TheTiebarAccount_page::SUBSCRIBE_EMAIL_TA, TheTiebarAccount_page::SUBSCRIBE_EMAIL_IL
        account_page.click_subscribe_email_togler
      end

      step "User clicks other newsletter" do
        check_element_path :xpath, TheTiebarAccount_page::NEWSLETTER_REASON_TA, TheTiebarAccount_page::NEWSLETTER_REASON_IL
        account_page.click_other_newsletter
      end

      step "User clicks twice catalog togler" do
        check_element_path :xpath, TheTiebarAccount_page::SUBSCRIBE_PRINT_CATALOG_TA, TheTiebarAccount_page::SUBSCRIBE_PRINT_CATALOG_IL
        account_page.click_print_catalog_togler
        account_page.click_print_catalog_togler
      end

      step "User clicks other catalog dropdown" do
        check_element_path :xpath, TheTiebarAccount_page::CATALOG_REASON_TA, TheTiebarAccount_page::CATALOG_REASON_IL
        account_page.click_other_catalog
      end

      step "User clicks save changes button" do
        check_element_path :xpath, TheTiebarAccount_page::SAVE_CHANGES_BTN_TA, TheTiebarAccount_page::SAVE_CHANGES_BTN_IL
        account_page.click_save_changes_btn
      end

      step "User clicks close changes button" do
        check_element_path :xpath, TheTiebarAccount_page::CLOSE_SAVE_CHANGES_MODAL_TA, TheTiebarAccount_page::CLOSE_SAVE_CHANGES_MODAL_IL
        account_page.click_close_save_changes_modal
      end

      step "User clicks view privacy policy button" do
        check_element_path :xpath, TheTiebarAccount_page::VIEW_PRIVACY_POLICY_TA, TheTiebarAccount_page::VIEW_PRIVACY_POLICY_IL
        account_page.click_view_privacy_policy_btn
      end

      step "User should sees privacy policy page" do
        check_element_path :xpath, TheTiebarAccount_page::MAIN_TEXT_PRIVACY_POLICY_TA, TheTiebarAccount_page::MAIN_TEXT_PRIVACY_POLICY_IL
        account_page.should_see_privacy_policy_page
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

      step "User clicks subscribe email togler" do
        check_element_path :xpath, TheTiebarAccount_page::SUBSCRIBE_EMAIL_EP, TheTiebarAccount_page::SUBSCRIBE_EMAIL_IL
        account_page.click_subscribe_email_togler :ep
      end

      step "User clicks other newsletter" do
        check_element_path :xpath, TheTiebarAccount_page::NEWSLETTER_REASON_EP, TheTiebarAccount_page::NEWSLETTER_REASON_IL
        account_page.click_other_newsletter :ep
      end

      step "User clicks twice catalog togler" do
        check_element_path :xpath, TheTiebarAccount_page::SUBSCRIBE_PRINT_CATALOG_EP, TheTiebarAccount_page::SUBSCRIBE_PRINT_CATALOG_IL
        account_page.click_print_catalog_togler :ep
        account_page.click_print_catalog_togler :ep
      end

      step "User clicks other catalog dropdown" do
        check_element_path :xpath, TheTiebarAccount_page::CATALOG_REASON_EP, TheTiebarAccount_page::CATALOG_REASON_IL
        account_page.click_other_catalog :ep
      end

      step "User clicks save changes button" do
        check_element_path :xpath, TheTiebarAccount_page::SAVE_CHANGES_BTN_EP, TheTiebarAccount_page::SAVE_CHANGES_BTN_IL
        account_page.click_save_changes_btn :ep
      end

      step "User clicks close changes button" do
        check_element_path :xpath, TheTiebarAccount_page::CLOSE_SAVE_CHANGES_MODAL_EP, TheTiebarAccount_page::CLOSE_SAVE_CHANGES_MODAL_IL
        account_page.click_close_save_changes_modal :ep
      end

      step "User clicks view privacy policy button" do
        check_element_path :xpath, TheTiebarAccount_page::VIEW_PRIVACY_POLICY_EP, TheTiebarAccount_page::VIEW_PRIVACY_POLICY_IL
        account_page.click_view_privacy_policy_btn :ep
      end

      step "User should sees privacy policy page" do
        check_element_path :xpath, TheTiebarAccount_page::MAIN_TEXT_PRIVACY_POLICY_EP, TheTiebarAccount_page::MAIN_TEXT_PRIVACY_POLICY_IL
        account_page.should_see_privacy_policy_page :ep
      end
    end
  end
end