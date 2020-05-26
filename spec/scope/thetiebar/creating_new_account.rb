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

  feature 'Creating new account' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['main_page'] do |url|
          page.visit url
        end

        step "User click the account button" do
          header_page.click_sing_in_btn
        end

        step "User fills the Username field" do
          login_page.click_create_acc_tab
        end

        step "User fills the first name field", settings('thetiebar')['first_name'] do |first_name|
          login_page.fill_first_name first_name
        end

        step "User fills the last name field", settings('thetiebar')['last_name'] do |last_name|
          login_page.fill_last_name last_name
        end

        step "User fills the email  field", settings('thetiebar')['test_email'] do |email|
          login_page.fill_email email
        end

        step "User fills the last name field", settings('thetiebar')['password'] do |pass|
          login_page.fill_password pass
        end

        step "User fills the last name field", settings('thetiebar')['password'] do |pass|
          login_page.fill_confirm_password pass
        end

        step "User clicks to uncheck checkbox" do
          login_page.click_uncheck_checkbox
        end

        step "User clicks to create acc btn" do
          login_page.click_create_acc_btn
        end

        sleep 3
      end
    end

  end
end
