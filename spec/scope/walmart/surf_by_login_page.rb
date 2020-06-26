require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/walmart/*.rb"

include ElementSearchValidation

header_nav = HeaderNavigationPageWalmart.new
login_page = LoginPageWalmart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Login page'  do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('walmart')['main_page'] do |url|
          page.visit url
        end

        step "User clicks Account button" do
          header_nav.click_account_btn
        end

        step "User clicks Sign In link" do
          header_nav.click_sign_in_link
        end

        step "User sees Sign In text" do
          login_page.should_see_signin_text
        end

        step "User sees Forgot Password link" do
          login_page.should_see_forgot_password
        end

        step "User sees Keep Me sign in" do
          login_page.should_see_keep_me_signin
        end

        step "User sees Have An Account" do
          login_page.should_see_have_an_account
        end

        step "User sees Create Account" do
          login_page.should_see_create_account
        end

        step "User fill email field ", settings('walmart')['login'] do |value|
          login_page.fill_email_input value
        end

        step "User fill password field", settings('walmart')['password'] do |value|
          login_page.fill_password_input value
        end

        step "User clicks Sign In button" do
          login_page.click_signin_btn
        end
      end
    end
  end
end