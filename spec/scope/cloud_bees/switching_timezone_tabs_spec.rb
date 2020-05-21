require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
releases_calendar = CloudBeesReleasesCalendar.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Switching timezone tabs' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
          page.visit url
        end

        step "Admin do login", settings('cloud_bees') do |credentials|
          login_page.fill_username_field credentials['username']
          login_page.fill_pass_field credentials['pass']
          login_page.click_sign_in_button
        end

        step "Admin clicks on release calendar page" do
          global_page.click_release_calendar_btn
        end

        step "Admin clicks on timezone dropdown" do
          releases_calendar.click_to_timezone_dropdown
        end

        step "Admin enters a value in the timezone search field", 'Kiev' do |value|
          releases_calendar.set_timezone_search_value value
        end

        step "Admin chooses timezone", 'Europe/Kiev' do |timezone|
          releases_calendar.select_timezone timezone
        end

        step "Admin clicks on the OK button" do
          releases_calendar.click_ok_button
        end

        step "Admin clicks on week tab" do
          releases_calendar.click_week_tab_button
        end

        step "Admin clicks on the day tab" do
          releases_calendar.click_day_tab_button
        end

        step "Admin clicks on the month tab" do
          releases_calendar.click_month_tab_button
        end

        sleep 3
      end
    end

  end
end
