require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
releases_calendar = CloudBeesReleasesCalendar.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Switching timezone tabs' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field credentials['username']
        login_page.fill_pass_field  credentials['pass']
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

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_TA, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_TA, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "Admin clicks on release calendar page" do
        check_element_path :css, CloudBeesGlobal::RELEASE_CALENDAR_BTN_TA, CloudBeesGlobal::RELEASE_CALENDAR_BTN_IL
        global_page.click_release_calendar_btn
      end

      step "Admin clicks on timezone dropdown" do
        check_element_path :css, CloudBeesReleasesCalendar::SELECT_USER_TIMEZONE_TA, CloudBeesReleasesCalendar::SELECT_USER_TIMEZONE_IL
        releases_calendar.click_to_timezone_dropdown
      end

      step "Admin enters a value in the timezone search field", 'Kiev' do |value|
        check_element_path :xpath, CloudBeesReleasesCalendar::SEARCH_TIMEZONE_DROPDOWN_TA, CloudBeesReleasesCalendar::SEARCH_TIMEZONE_DROPDOWN_IL
        releases_calendar.set_timezone_search_value value
      end

      step "Admin chooses timezone", 'Europe/Kiev' do |timezone|
        check_element_path :xpath, releases_calendar.timezone_name(:ta, timezone), releases_calendar.timezone_name(:il, timezone)
        releases_calendar.select_timezone timezone
      end

      step "Admin clicks on the OK button" do
        check_element_path :css, CloudBeesReleasesCalendar::OK_BUTTON_MODAL_TA, CloudBeesReleasesCalendar::OK_BUTTON_MODAL_IL
        releases_calendar.click_ok_button
      end

      step "Admin clicks on the week tab" do
        check_element_path :css, CloudBeesReleasesCalendar::WEEK_TAB_TA, CloudBeesReleasesCalendar::WEEK_TAB_IL
        releases_calendar.click_week_tab_button
      end

      step "Admin clicks on the day tab" do
        check_element_path :css, CloudBeesReleasesCalendar::DAY_TAB_TA, CloudBeesReleasesCalendar::DAY_TAB_IL
        releases_calendar.click_day_tab_button
      end

      step "Admin clicks on the month tab" do
        check_element_path :css, CloudBeesReleasesCalendar::MONTH_TAB_TA, CloudBeesReleasesCalendar::MONTH_TAB_IL
        releases_calendar.click_month_tab_button
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_EP, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field :ep, credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_EP, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field :ep, credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_EP, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
      end

      step "Admin clicks on release calendar page" do
        check_element_path :css, CloudBeesGlobal::RELEASE_CALENDAR_BTN_TA, CloudBeesGlobal::RELEASE_CALENDAR_BTN_IL
        global_page.click_release_calendar_btn :ep
      end

      step "Admin clicks on timezone dropdown" do
        check_element_path :css, CloudBeesReleasesCalendar::SELECT_USER_TIMEZONE_TA, CloudBeesReleasesCalendar::SELECT_USER_TIMEZONE_IL
        releases_calendar.click_to_timezone_dropdown :ep
      end

      step "Admin enters a value in the timezone search field", 'Kiev' do |value|
        check_element_path :xpath, CloudBeesReleasesCalendar::SEARCH_TIMEZONE_DROPDOWN_TA, CloudBeesReleasesCalendar::SEARCH_TIMEZONE_DROPDOWN_IL
        releases_calendar.set_timezone_search_value :ep, value
      end

      step "Admin chooses timezone", 'Europe/Kiev' do |timezone|
        check_element_path :xpath, releases_calendar.timezone_name(:ta, timezone), releases_calendar.timezone_name(:il, timezone)
        releases_calendar.select_timezone :ep, timezone
      end

      step "Admin clicks on the OK button" do
        check_element_path :css, CloudBeesReleasesCalendar::OK_BUTTON_MODAL_TA, CloudBeesReleasesCalendar::OK_BUTTON_MODAL_IL
        releases_calendar.click_ok_button :ep
      end

      step "Admin clicks on the week tab" do
        check_element_path :css, CloudBeesReleasesCalendar::WEEK_TAB_TA, CloudBeesReleasesCalendar::WEEK_TAB_IL
        releases_calendar.click_week_tab_button :ep
      end

      step "Admin clicks on the day tab" do
        check_element_path :css, CloudBeesReleasesCalendar::DAY_TAB_TA, CloudBeesReleasesCalendar::DAY_TAB_IL
        releases_calendar.click_day_tab_button :ep
      end

      step "Admin clicks on the month tab" do
        check_element_path :css, CloudBeesReleasesCalendar::MONTH_TAB_TA, CloudBeesReleasesCalendar::MONTH_TAB_IL
        releases_calendar.click_month_tab_button :ep
      end

    end
  end
end