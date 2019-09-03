require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
releases_calandar = CloudBeesReleasesCalandar.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'CloudBees - Switching timezone tabs' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
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
       releases_calandar.click_to_timezone_dropdown
      end

      step "Admin set kiev in search timezone dropdown " do
        releases_calandar.set_into_search_timezone_dropdown
      end

      step "Admin clicks for select timezone" do
        releases_calandar.click_to_select_timezone
      end

      step "Admin clicks ok button" do
        releases_calandar.click_ok_button
      end

      step "Admin clicks on week tab" do
        releases_calandar.click_week_tab_button
      end

      step "Admin clicks on day tabk" do
        releases_calandar.click_day_tab_button
      end

      step "Admin clicks on month tab" do
        releases_calandar.click_month_tab_button
      end


    end

    scenario 'Searching IL', il2: true do
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
        check_element_path :css, CloudBeesReleasesCalandar::SELECT_USER_TIMEZONE_TA, CloudBeesReleasesCalandar::SELECT_USER_TIMEZONE_IL
        releases_calandar.click_to_timezone_dropdown
      end

      step "Admin set kiev in search timezone dropdown " do
        check_element_path :xpath, CloudBeesReleasesCalandar::SEARCH_TIMEZONE_DROPDOWN_TA, CloudBeesReleasesCalandar::SEARCH_TIMEZONE_DROPDOWN_IL
        releases_calandar.set_into_search_timezone_dropdown
      end

      step "Admin clicks for select timezone" do
        check_element_path :xpath, CloudBeesReleasesCalandar::SELECT_KIEV_TIMEZONE_TA, CloudBeesReleasesCalandar::SELECT_KIEV_TIMEZONE_IL
        releases_calandar.click_to_select_timezone
      end

      step "Admin clicks ok button" do
        check_element_path :css, CloudBeesReleasesCalandar::OK_BUTTON_MODAL_TA, CloudBeesReleasesCalandar::OK_BUTTON_MODAL_IL
        releases_calandar.click_ok_button
      end

      step "Admin clicks on week tab" do
        check_element_path :css, CloudBeesReleasesCalandar::WEEK_TAB_TA, CloudBeesReleasesCalandar::WEEK_TAB_IL
        releases_calandar.click_week_tab_button
      end

      step "Admin clicks on day tabk" do
        check_element_path :css, CloudBeesReleasesCalandar::DAY_TAB_TA, CloudBeesReleasesCalandar::DAY_TAB_IL
        releases_calandar.click_day_tab_button
      end

      step "Admin clicks on month tab" do
        check_element_path :css, CloudBeesReleasesCalandar::MONTH_TAB_TA, CloudBeesReleasesCalandar::MONTH_TAB_IL
        releases_calandar.click_month_tab_button
      end
    end

    # Element Picker from Repository

    # scenario 'Searching EP', ep: true do
    #   step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
    #     page.visit url
    #   end
    #
    #   step "Admin do login", settings('cloud_bees') do |credentials|
    #     check_element_path :css, CloudBeesLogin::USERNAME_FIELD_EP, CloudBeesLogin::USERNAME_FIELD_IL
    #     login_page.fill_username_field :ep, credentials['username']
    #
    #     check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_EP, CloudBeesLogin::PASSWORD_FIELD_IL
    #     login_page.fill_pass_field :ep, credentials['pass']
    #
    #     check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_EP, CloudBeesLogin::SIGN_IN_BTN_IL
    #     login_page.click_sign_in_button :ep
    #   end
    #
    # end
  end
end