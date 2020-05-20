require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Authorization (Login and Logout)' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
          page.visit url
        end

        step "User fills the Username field", settings('cloud_bees')['username'] do |username|
          login_page.fill_username_field username
        end

        step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
          login_page.fill_pass_field pass
        end

        step "User clicks on the Sign In button" do
          login_page.click_sign_in_button
        end

        step "User clicks on the Administrator menu button" do
          global_page.click_admin_menu
        end

        step "User clicks on the Logout button" do
          global_page.click_logout_button
        end

        sleep 3
      end
    end

  end
end
