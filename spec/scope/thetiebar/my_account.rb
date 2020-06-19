require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

login_page = TheTiebarLoginPage.new
account_page = TheTiebarAccount_page.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'My Account Page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
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
    end

  end
end
