require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/ta_pages/*.rb"

header_navigation = HeaderNavigation.new
login_page = LogInPage.new
sign_up_page = SignUpPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by login page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('ta')['home_page'] do |url|
          page.visit url
        end

        step "User hover product dropdown link" do
          header_navigation.click_login_btn_on_nav_panel
        end

        step "User sees login title" do
          login_page.should_see_login_title
        end

        step "User fill username input", "test@email.com" do |value|
          login_page.fill_username_input value
        end

        step "User fill username input", "1234test" do |value|
          login_page.fill_pass_input value
        end

        step "User fill username input" do
          login_page.click_login_btn
        end

        step "User sees error message" do
          login_page.should_see_error_message
        end

        step "User forgot pass" do
          login_page.click_forgot_pass
        end

        step "User fill reset email input", "test@email.com" do |value|
          login_page.fill_reset_email value
        end

        step "User sees reset button" do
          login_page.click_reset_btn
        end

        step "User sees error reset message" do
          login_page.should_see_error_reset_message
        end

        step "User click sign in button" do
          login_page.click_sign_in_btn
        end

        step "User sees login title" do
          login_page.should_see_login_title :il #step is duplicated below
        end

        step "User click sign up button" do
          login_page.click_sign_up_btn
        end

        step "User sees sign up text" do
          sign_up_page.should_see_sign_up_text
        end

        step "User fill sign up email field", "test" do |value|
          sign_up_page.fill_sign_up_email_field value
        end

        step "User fill sign up button" do
          sign_up_page.click_sign_up_btn :il #step is duplicated below
        end

        step "User sees error message" do
          sign_up_page.should_see_error_message
        end

        sleep 3
      end
    end

  end
end
