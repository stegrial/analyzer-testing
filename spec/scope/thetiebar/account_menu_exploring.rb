require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

login_page = TheTiebarLoginPage.new
header_page = TheTiebarHeader.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Account menu' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
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
          sleep 2 # wait for page load
        end

        step "User clicks on the Account button" do
          header_page.click_account_btn :il # step is duplicated below
        end

        step "User clicks orders link  in Account menu" do
          header_page.click_orders_in_acc_menu
        end

        step "User clicks on the Account button" do
          header_page.click_account_btn :il # step is duplicated below
        end

        step "User clicks address book link in Account menu" do
          header_page.click_address_book_in_acc_menu
        end

        step "User clicks on the Account button" do
          header_page.click_account_btn :il # step is duplicated below
        end

        step "User clicks payment link in Account menu" do
          header_page.click_payment_in_acc_menu
        end

        step "User clicks on the Account button" do
          header_page.click_account_btn :il # step is duplicated below
        end

        step "User clicks wish list link in Account menu" do
          header_page.click_wish_list_in_acc_menu
        end

        step "User clicks on the Account button" do
          header_page.click_account_btn :il # step is duplicated below
        end

        step "User clicks gift cards link in Account menu" do
          header_page.click_gift_cads_in_acc_menu
        end

        step "User clicks on the Account button" do
          header_page.click_account_btn :il # step is duplicated below
        end

        step "User clicks profile link in Account menu" do
          header_page.click_profile_in_acc_menu
        end

        step "User clicks on the Account button" do
          header_page.click_account_btn :il # step is duplicated below
        end

        step "User clicks preference link in Account menu" do
          header_page.click_preference_in_acc_menu
        end

        step "User clicks on the Account button" do
          header_page.click_account_btn :il # step is duplicated below
        end

        step "User clicks need help link in Account menu" do
          header_page.click_need_help_in_acc_menu
        end

        step "User clicks on the Account button" do
          header_page.click_account_btn
        end

        step "User clicks on the Sign Out link" do
          header_page.click_sing_out_link
        end

        sleep 3
      end
    end

  end
end
