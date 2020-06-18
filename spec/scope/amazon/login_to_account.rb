require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"

sign_in_page = SignInPage.new
header_navigation = HeaderNavigation.new


describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Login to user account' do
    # Amazon can't be logged into the user account page due to spam bots.

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('amazon')['page'] do |url|
          page.visit url
        end

        step "User clicks on account list button" do
          header_navigation.click_account_list_btn
        end

        step "User sees email text" do
          sign_in_page.should_see_email_text
        end

        step "User sees need help link" do
          sign_in_page.should_see_need_help_link
        end

        step "User fills email field ", settings('amazon')['email'] do |value|
          sign_in_page.fill_email_field value
        end

        step "User clicks on continue button" do
          sign_in_page.click_continue_btn
        end

        step "User sees change login link" do
          sign_in_page.should_see_change_login_link
        end

        step "User sees forgot password link" do
          sign_in_page.should_see_forgot_pass_link
        end

        step "User fills password field", settings('amazon')['password'] do |value|
          sign_in_page.fill_password_field value
        end

        step "User clicks sign in button" do
          sign_in_page.click_sign_in_btn
        end

        sleep 3
      end
    end

  end
end
