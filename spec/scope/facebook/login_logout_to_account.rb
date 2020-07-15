require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

include ElementSearchValidation

header_nav = HeaderNaviPageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Login and logout into account'  do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('facebook')['main_page'] do |url|
          page.visit url
        end

        step "User set login in login field", settings('facebook')['login'] do |value|
          header_nav.set_email value
        end

        step "User set password in password field", settings('facebook')['pass'] do |value|
          header_nav.set_pass value
        end

        step "User  clicks on the login button for entering into account" do
          header_nav.click_login_btn
        end

        step "Need to press escape" do
          header_nav.escape
        end

        step "User  sees own profile name" do
          header_nav.should_see_profile_name
        end

        step "User click account setting button" do
          header_nav.click_acc_setting_btn
        end

        step "User click Logout button" do
          header_nav.click_menu_logout_btn
        end

        step "User sees Create New Account text" do
          header_nav.should_see_create_new_acc_text
        end
      end
    end
  end
end
