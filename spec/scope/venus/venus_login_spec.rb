require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/venus/*.rb"

navigation_page = VenusNavigation.new
login_page = VenusLogin.new
home_page = VenusHome.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Venus - Login' do

    $run_count.times do
      scenario 'Processing Locators', "#{$tag}": true do

          step "User goes to the page", settings('venus')['home_page'] do |url|
            page.visit url
          end

          step "User clicks on the Account button" do
            home_page.should_see_third_bunner
            navigation_page.click_account_button
          end

          step "User fills the Email field", settings('venus')['email'] do |email|
            login_page.fill_email_field email
          end

          step "User fills the Pass field", settings('venus')['pass'] do |pass|
            login_page.fill_pass_field pass
          end

          step "User clicks on the Sign In button" do
            login_page.click_sign_in_button
          end

          step "User clicks on the Account button" do
            # navigation_page.should
            navigation_page.click_account_button
          end

          step "User clicks on the Order History in the Account menu" do
            navigation_page.click_order_history_option
          end

      end
    end
  end
end