require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
releases_calendar = CloudBeesReleasesCalendar.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'AT-87 CloudBees - Switching timezone tabs' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field  credentials['username']
        login_page.fill_pass_field  credentials['pass']
        login_page.click_sign_in_button
      end

      step "Admin clicks on release calendar button" do
        global_page.click_release_calendar_btn
      end

      step "Admin clicks on timezone dropdown" do
       releases_calendar.click_to_timezone_dropdown
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
      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field :ep, credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_TA, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field :ep, credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_TA, CloudBeesLogin::SIGN_IN_BTN_IL
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
      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "Admin clicks on release calendar page" do
        global_page.click_release_calendar_btn :il
      end

      step "Admin clicks on timezone dropdown" do
        releases_calendar.click_to_timezone_dropdown
      end
      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "Admin clicks on release calendar page" do
        global_page.click_release_calendar_btn :il
      end

      step "Admin clicks on timezone dropdown" do
        releases_calendar.click_to_timezone_dropdown
      end
      sleep 3
    end
  end
end