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
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'My Account Page' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['my_account_page'] do |url|
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
        sleep 2 # wait for page load
      end

      step "User clicks edit profile button" do
        account_page.click_edit_profile_btn
      end

      step "User clicks close edit button" do
        account_page.click_close_edit_btn
      end

      step "User clicks preferences button" do
        account_page.click_preferences_btn
      end

      step "User clicks my account button breadcrumb" do
        account_page.click_my_acc_breadcrumb :il # step is duplicated below
      end

      step "User clicks orders button" do
        account_page.click_orders_btn
      end

      step "User clicks my account button breadcrumb" do
        account_page.click_my_acc_breadcrumb :il # step is duplicated below
      end

      step "User clicks address book button" do
        account_page.click_address_book_btn
      end

      step "User clicks my account button breadcrumb" do
        account_page.click_my_acc_breadcrumb :il # step is duplicated below
      end

      step "User clicks payment button" do
        account_page.click_payment_btn
      end

      step "User clicks my account button breadcrumb" do
        account_page.click_my_acc_breadcrumb :il # step is duplicated below
      end

      step "User clicks wishlist button" do
        account_page.click_wishlist_btn
      end

      step "User clicks my account button breadcrumb" do
        account_page.click_my_acc_breadcrumb :il # step is duplicated below
      end

      step "User clicks gift cards button" do
        account_page.click_gift_cards_btn
      end

      step "User clicks my account button breadcrumb" do
        account_page.click_my_acc_breadcrumb
      end

      step "User clicks sing out link" do
        account_page.click_sing_out_link
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['my_account_page'] do |url|
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
        sleep 2 # wait for page load
      end

      step "User clicks edit profile button" do
        check_element_path :xpath, TheTiebarAccount_page::EDIT_PROFILE_TA, TheTiebarAccount_page::EDIT_PROFILE_IL
        account_page.click_edit_profile_btn
      end

      step "User clicks close edit button" do
        check_element_path :xpath, TheTiebarAccount_page::CLOSE_EDIT_BTN_TA, TheTiebarAccount_page::CLOSE_EDIT_BTN_IL
        account_page.click_close_edit_btn
      end

      step "User clicks preferences button" do
        check_element_path :xpath, TheTiebarAccount_page::PREFERENCES_TA, TheTiebarAccount_page::PREFERENCES_IL
        account_page.click_preferences_btn
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_TA, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb
      end

      step "User clicks orders button" do
        check_element_path :xpath, TheTiebarAccount_page::ORDERS_TA, TheTiebarAccount_page::ORDERS_IL
        account_page.click_orders_btn
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_TA, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb
      end

      step "User clicks address book button" do
        check_element_path :xpath, TheTiebarAccount_page::ADDRESS_BOOK_TA, TheTiebarAccount_page::ADDRESS_BOOK_IL
        account_page.click_address_book_btn
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_TA, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb
      end

      step "User clicks payment button" do
        check_element_path :xpath, TheTiebarAccount_page::PAYMENT_TA, TheTiebarAccount_page::PAYMENT_IL
        account_page.click_payment_btn
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_TA, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb
      end

      step "User clicks wishlist button" do
        check_element_path :xpath, TheTiebarAccount_page::WISHLIST_TA, TheTiebarAccount_page::WISHLIST_IL
        account_page.click_wishlist_btn
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_TA, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb
      end

      step "User clicks gift cards button" do
        check_element_path :xpath, TheTiebarAccount_page::GIFTCARDS_CREDIT_TA, TheTiebarAccount_page::GIFTCARDS_CREDIT_IL
        account_page.click_gift_cards_btn
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_TA, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb
      end

      step "User clicks on the Sign Out link" do
        check_element_path :xpath, TheTiebarAccount_page::SIGN_OUT_LINK_TA, TheTiebarAccount_page::SIGN_OUT_LINK_IL
        account_page.click_sing_out_link
      end

      sleep 3
    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['my_account_page'] do |url|
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

      step "User clicks edit profile button" do
        check_element_path :xpath, TheTiebarAccount_page::EDIT_PROFILE_EP, TheTiebarAccount_page::EDIT_PROFILE_IL
        account_page.click_edit_profile_btn :ep
      end

      step "User clicks close edit button" do
        check_element_path :xpath, TheTiebarAccount_page::CLOSE_EDIT_BTN_EP, TheTiebarAccount_page::CLOSE_EDIT_BTN_IL
        account_page.click_close_edit_btn :ep
      end

      step "User clicks preferences button" do
        check_element_path :xpath, TheTiebarAccount_page::PREFERENCES_EP, TheTiebarAccount_page::PREFERENCES_IL
        account_page.click_preferences_btn :ep
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_EP, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb :ep
      end

      step "User clicks orders button" do
        check_element_path :xpath, TheTiebarAccount_page::ORDERS_EP, TheTiebarAccount_page::ORDERS_IL
        account_page.click_orders_btn :ep
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_EP, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb :ep
      end

      step "User clicks address book button" do
        check_element_path :xpath, TheTiebarAccount_page::ADDRESS_BOOK_EP, TheTiebarAccount_page::ADDRESS_BOOK_IL
        account_page.click_address_book_btn :ep
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_EP, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb :ep
      end

      step "User clicks payment button" do
        check_element_path :xpath, TheTiebarAccount_page::PAYMENT_EP, TheTiebarAccount_page::PAYMENT_IL
        account_page.click_payment_btn :ep
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_EP, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb :ep
      end

      step "User clicks wishlist button" do
        check_element_path :xpath, TheTiebarAccount_page::WISHLIST_EP, TheTiebarAccount_page::WISHLIST_IL
        account_page.click_wishlist_btn :ep
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_EP, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb :ep
      end

      step "User clicks gift cards button" do
        check_element_path :xpath, TheTiebarAccount_page::GIFTCARDS_CREDIT_EP, TheTiebarAccount_page::GIFTCARDS_CREDIT_IL
        account_page.click_gift_cards_btn :ep
      end

      step "User clicks my account button breadcrumb" do
        check_element_path :xpath, TheTiebarAccount_page::MY_ACC_BREADCRUMB_EP, TheTiebarAccount_page::MY_ACC_BREADCRUMB_IL
        account_page.click_my_acc_breadcrumb :ep
      end

      step "User clicks on the Sign Out link" do
        check_element_path :xpath, TheTiebarAccount_page::SIGN_OUT_LINK_EP, TheTiebarAccount_page::SIGN_OUT_LINK_IL
        account_page.click_sing_out_link :ep
      end
    end
  end
end