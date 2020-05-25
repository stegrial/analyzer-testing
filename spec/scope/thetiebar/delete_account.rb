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

  feature 'Delete account' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
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
          sleep 2 # wait for page load
        end

        step "User clicks delete account button" do
          account_page.click_delete_account_btn :il # step is duplicated below
        end

        step "User clicks cancel delete button" do
          account_page.click_cancel_delete_btn
        end

        step "User clicks delete acc button" do
          account_page.click_delete_account_btn
        end

        step "User clicks other catalog dropdown" do
          account_page.click_close_delete_modal_icon
        end

        sleep 3
      end
    end

  end
end
