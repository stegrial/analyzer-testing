require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/thetiebar/*.rb"

include ElementSearchValidation

login_page = TheTiebarLoginPage.new
header_page = TheTiebarHeader.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Account menu' do

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
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        header_page.click_account_btn
      end

      step "User clicks orders link  in Account menu" do
        header_page.click_orders_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        header_page.click_account_btn
      end

      step "User clicks address book link in Account menu" do
        header_page.click_address_book_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        header_page.click_account_btn
      end

      step "User clicks payment link in Account menu" do
        header_page.click_payment_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        header_page.click_account_btn
      end

      step "User clicks wish list link in Account menu" do
        header_page.click_wish_list_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        header_page.click_account_btn
      end

      step "User clicks gift cards link in Account menu" do
        header_page.click_gift_cads_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        header_page.click_account_btn
      end

      step "User clicks profile link in Account menu" do
        header_page.click_profile_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        header_page.click_account_btn
      end

      step "User clicks preference link in Account menu" do
        header_page.click_preference_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        header_page.click_account_btn
      end

      step "User clicks need help link in Account menu" do
        header_page.click_need_help_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        header_page.click_account_btn
      end

      step "User clicks on the Sign Out link" do
        header_page.click_sing_out_link
      end
      sleep 3
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User click the account button" do
        # check_element_path :xpath, TheTiebarHeader::SIGNIN_BTN_TA, TheTiebarHeader::SIGNIN_BTN_IL
        header_page.click_sing_in_btn :il
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |email|
        # check_element_path :xpath, TheTiebarLoginPage::USERNAME_TA, TheTiebarLoginPage::USERNAME_IL
        login_page.fill_username_field :il, email
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        # check_element_path :xpath, TheTiebarLoginPage::LOGIN_PASS_TA, TheTiebarLoginPage::LOGIN_PASS_IL
        login_page.fill_login_password :il, pass
      end

      step "User clicks on the Sign In button" do
        # check_element_path :xpath, TheTiebarLoginPage::SIGN_IN_TA, TheTiebarLoginPage::SIGN_IN_IL
        login_page.click_sing_in :il
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_TA, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn
      end

      step "User clicks orders link  in Account menu" do
        check_element_path :xpath, TheTiebarHeader::ORDERS_ACCOUNT_MENU_TA, TheTiebarHeader::ORDERS_ACCOUNT_MENU_IL
        header_page.click_orders_in_acc_menu
        sleep 3 # wait for finish slow page rebuild

      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_TA, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn
      end

      step "User clicks address book link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::ADDRESS_BOOK_ACCOUNT_MENU_TA, TheTiebarHeader::ADDRESS_BOOK_ACCOUNT_MENU_IL
        header_page.click_address_book_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_TA, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn
      end

      step "User clicks payment link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::PAYMENT_ACCOUNT_MENU_TA, TheTiebarHeader::PAYMENT_ACCOUNT_MENU_IL
        header_page.click_payment_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_TA, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn
      end

      step "User clicks wish list link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::WISH_LIST_ACCOUNT_MENU_TA, TheTiebarHeader::WISH_LIST_ACCOUNT_MENU_IL
        header_page.click_wish_list_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_TA, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn
      end

      step "User clicks gift cards link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::GIFT_CARDS_ACCOUNT_MENU_TA, TheTiebarHeader::GIFT_CARDS_ACCOUNT_MENU_IL
        header_page.click_gift_cads_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_TA, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn
      end

      step "User clicks profile link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::PROFILE_ACCOUNT_MENU_TA, TheTiebarHeader::PROFILE_ACCOUNT_MENU_IL
        header_page.click_profile_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_TA, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn
      end

      step "User clicks preference link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::PREFERENCE_ACCOUNT_MENU_TA, TheTiebarHeader::PREFERENCE_ACCOUNT_MENU_IL
        header_page.click_preference_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_TA, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn
      end

      step "User clicks need help link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::NEED_HELP_ACCOUNT_MENU_TA, TheTiebarHeader::NEED_HELP_ACCOUNT_MENU_IL
        header_page.click_need_help_in_acc_menu
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_TA, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn :il
      end

      step "User clicks on the Sign Out link" do
        check_element_path :xpath, TheTiebarHeader::SIGN_OUT_LINK_TA, TheTiebarHeader::SIGN_OUT_LINK_IL
        header_page.click_sing_out_link
      end
    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User click the account button" do
        check_element_path :xpath, TheTiebarHeader::SIGNIN_BTN_EP, TheTiebarHeader::SIGNIN_BTN_IL
        header_page.click_sing_in_btn  :ep
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |email|
        check_element_path :xpath, TheTiebarLoginPage::USERNAME_EP, TheTiebarLoginPage::USERNAME_IL
        login_page.fill_username_field  :ep, email
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        check_element_path :xpath, TheTiebarLoginPage::LOGIN_PASS_EP, TheTiebarLoginPage::LOGIN_PASS_IL
        login_page.fill_login_password  :ep, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :xpath, TheTiebarLoginPage::SIGN_IN_EP, TheTiebarLoginPage::SIGN_IN_IL
        login_page.click_sing_in :ep
        sleep 3
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_EP, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn :ep
      end

      step "User clicks orders link  in Account menu" do
        check_element_path :xpath, TheTiebarHeader::ORDERS_ACCOUNT_MENU_EP, TheTiebarHeader::ORDERS_ACCOUNT_MENU_IL
        header_page.click_orders_in_acc_menu :ep
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_EP, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn :ep
      end

      step "User clicks address book link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::ADDRESS_BOOK_ACCOUNT_MENU_EP, TheTiebarHeader::ADDRESS_BOOK_ACCOUNT_MENU_IL
        header_page.click_address_book_in_acc_menu :ep
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_EP, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn :ep
      end

      step "User clicks payment link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::PAYMENT_ACCOUNT_MENU_EP, TheTiebarHeader::PAYMENT_ACCOUNT_MENU_IL
        header_page.click_payment_in_acc_menu :ep
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_EP, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn :ep
      end

      step "User clicks wish list link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::WISH_LIST_ACCOUNT_MENU_EP, TheTiebarHeader::WISH_LIST_ACCOUNT_MENU_IL
        header_page.click_wish_list_in_acc_menu :ep
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_EP, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn :ep
      end

      step "User clicks gift cards link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::GIFT_CARDS_ACCOUNT_MENU_EP, TheTiebarHeader::GIFT_CARDS_ACCOUNT_MENU_IL
        header_page.click_gift_cads_in_acc_menu :ep
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_EP, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn :ep
      end

      step "User clicks profile link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::PROFILE_ACCOUNT_MENU_EP, TheTiebarHeader::PROFILE_ACCOUNT_MENU_IL
        header_page.click_profile_in_acc_menu :ep
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_EP, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn :ep
      end

      step "User clicks preference link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::PREFERENCE_ACCOUNT_MENU_EP, TheTiebarHeader::PREFERENCE_ACCOUNT_MENU_IL
        header_page.click_preference_in_acc_menu :ep
        sleep 3 # wait for finish slow page rebuild
      end

      step "User clicks on the Account button" do
        check_element_path :xpath, TheTiebarHeader::ACCOUNT_BTN_EP, TheTiebarHeader::ACCOUNT_BTN_IL
        header_page.click_account_btn :ep
      end

      step "User clicks need help link in Account menu" do
        check_element_path :xpath, TheTiebarHeader::NEED_HELP_ACCOUNT_MENU_EP, TheTiebarHeader::NEED_HELP_ACCOUNT_MENU_IL
        header_page.click_need_help_in_acc_menu  :ep
        sleep 3 # wait for finish slow page rebuild
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