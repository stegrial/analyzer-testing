require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

header_nav = HeaderNaviPageFacebook.new
setting_page = SettingsPageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Edit setting info'  do

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

        step "User click account setting button" do
          header_nav.click_acc_setting_btn
        end

        step "User click Setting button" do
          header_nav.click_menu_setting_btn
        end

        step "User click Edit button for name editing" do
          setting_page.click_edit_name_button
        end

        step "User sees Name field" do
          setting_page.should_see_name_field
        end

        step "User click cancel name edit button" do
          setting_page.click_cancel_name_edit_btn
        end

        step "User click Edit Contact button" do
          setting_page.click_edit_contact_btn
        end

        step "User click close btn" do
          setting_page.click_close_btn
        end

        step "User click memorialization settings btn" do
          setting_page.click_memorialization_settings
        end

        step "User sees your legacy contact" do
          setting_page.should_see_your_legacy_contact
        end

        step "User click close memorialization settings btn" do
          setting_page.click_close_memorialization_settings
        end

        sleep 3
      end
    end

  end
end
