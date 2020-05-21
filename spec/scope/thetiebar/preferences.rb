require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

login_page = TheTiebarLoginPage.new
account_page = TheTiebarAccount_page.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Preferences Page' do

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

        step "User clicks subscribe email togler" do
          account_page.click_subscribe_email_togler
        end

        step "User clicks other newsletter" do
          account_page.click_other_newsletter
        end

        step "User clicks twice catalog togler" do
          account_page.click_print_catalog_togler :il # step is duplicated below
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

        sleep 3
      end
    end

  end
end
