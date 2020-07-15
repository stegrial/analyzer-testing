require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

include ElementSearchValidation

header_nav = HeaderNaviPageFacebook.new
notification_page = NotificationsPageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by messenger'  do

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

        step "User click  to notifications button" do
          header_nav.click_notifications_btn
        end

        step "User sees Notifications text" do
          header_nav.should_see_notifications_text
        end

        step "User click See All button" do
          header_nav.click_see_all_btn
        end

        step "User sees Notifications h2 text" do
          notification_page.should_see_your_notifications_h2
        end

        step "User sees Notifications settings link" do
          notification_page.click_notifications_settings
        end

        step "User sees What Notifications You Receive text" do
          notification_page.should_see_what_notifications_receive
        end

        step "User click Reminders link" do
          notification_page.click_reminders_link
        end

        step "User sees 'These are notifications to remind you of updates you may have missed.' text" do
          notification_page.should_see_notifications_remind_updates
        end

        step "User click SMS switch toggle" do
          notification_page.click_sms_switch_toggle
        end
      end
    end
  end
end
