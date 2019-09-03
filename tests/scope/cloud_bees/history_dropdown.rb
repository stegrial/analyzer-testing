require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
change_history_modal = CloudBeesChangeHistory.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Creating and Deleting application' do

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

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Change History section in the Hamburger menu" do
        global_page.click_change_history
      end

      step "Admin chooses the second item in table Change History" do
        change_history_modal.click_second_item_in_table
      end

      step "Admin clicks on dropdown Last Changes" do
        change_history_modal.click_dropdown_last_changes
      end

      step "Admin clicks on Past 24 hours" do
        change_history_modal.click_past_24_hours
      end

      step "Admin clicks on dropdown Past 24 hours" do
        change_history_modal.click_dropdown_past_24_hours
      end

      step "Admin clicks in dropdown Between" do
        change_history_modal.click_between_btn
      end

      step "Admin fills the hours time", '12' do |hours_time|
        change_history_modal.fill_hours_time hours_time
      end

      step "Admin fills the minutes time", '00' do |minutes_time|
        change_history_modal.fill_minutes_time minutes_time
      end

      step "Admin confirm time, click OK button" do
        change_history_modal.confirm_time
      end

      step "Admin fills the hours time", '13' do |hours_time|
        change_history_modal.fill_and_hours_time hours_time
      end

      step "Admin fills the minutes time", '00' do |minutes_time|
        change_history_modal.fill_and_minutes_time minutes_time
      end

      step "Admin confirm time, click OK button" do
        change_history_modal.and_confirm_time
      end

      step "Admin clicks search button" do
        change_history_modal.click_search_btn
      end

      step "Admin clicks on dropdown Last changes" do
        change_history_modal.click_last_changes_dropdown
      end

      step "Admin select in dropdown Past 3 days" do
        change_history_modal.click_past_3_days
      end

      step "Admin clicks on dropdown All" do
        change_history_modal.click_all_dropdown
      end

      step "Admin clicks on item All Object" do
        change_history_modal.click_all_object
      end

      step "Admin choose on item Application" do
        change_history_modal.click_application
      end

      step "Admin choose on item Component" do
        change_history_modal.click_component
      end

      step "Admin clicks on search field" do
        change_history_modal.click_on_search_field
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

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Change History section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::CHANGE_HISTORY_SECTION_TA, CloudBeesGlobal::CHANGE_HISTORY_SECTION_IL
        global_page.click_change_history
      end

      step "Admin chooses the second item in table Change History" do
        check_element_path :xpath, CloudBeesChangeHistory::SECOND_ITEM_IN_TABLE_TA, CloudBeesChangeHistory::SECOND_ITEM_IN_TABLE_IL
        change_history_modal.click_second_item_in_table
      end

      step "Admin clicks on dropdown Last Changes" do
        check_element_path :xpath, CloudBeesChangeHistory::DROPDOWN_LAST_CHANGES_TA, CloudBeesChangeHistory::DROPDOWN_LAST_CHANGES_IL
        change_history_modal.click_dropdown_last_changes
      end

      step "Admin clicks on Past 24 hours" do
        check_element_path :xpath, CloudBeesChangeHistory::PAST_24_HOURS_TA, CloudBeesChangeHistory::PAST_24_HOURS_IL
        change_history_modal.click_past_24_hours
      end

      step "Admin clicks on dropdown Past 24 hours" do
        check_element_path :xpath, CloudBeesChangeHistory::DROPDOWN_PAST_24_HOURS_TA, CloudBeesChangeHistory::DROPDOWN_PAST_24_HOURS_IL
        change_history_modal.click_dropdown_past_24_hours
      end

      step "Admin clicks in dropdown Between" do
        check_element_path :xpath, CloudBeesChangeHistory::BETWEEN_BTN_TA, CloudBeesChangeHistory::BETWEEN_BTN_IL
        change_history_modal.click_between_btn
      end

      step "Admin fills the hours time", '12' do |hours_time|
        check_element_path :xpath, CloudBeesChangeHistory::SET_HOURS_TIME_TA, CloudBeesChangeHistory::SET_HOURS_TIME_IL
        change_history_modal.fill_hours_time hours_time
      end

      step "Admin fills the minutes time", '00' do |minutes_time|
        check_element_path :xpath, CloudBeesChangeHistory::SET_MINUTES_TIME_TA, CloudBeesChangeHistory::SET_MINUTES_TIME_IL
        change_history_modal.fill_minutes_time minutes_time
      end

      step "Admin confirm time, click OK button" do
        check_element_path :xpath, CloudBeesChangeHistory::CONFIRM_TIME_TA, CloudBeesChangeHistory::CONFIRM_TIME_IL
        change_history_modal.confirm_time
      end

      step "Admin fills the hours time", '13' do |hours_time|
        check_element_path :xpath, CloudBeesChangeHistory::AND_SET_HOURS_TIME_TA, CloudBeesChangeHistory::AND_SET_HOURS_TIME_IL
        change_history_modal.fill_and_hours_time hours_time
      end

      step "Admin fills the minutes time", '00' do |minutes_time|
        check_element_path :xpath, CloudBeesChangeHistory::AND_SET_MINUTES_TIME_TA, CloudBeesChangeHistory::AND_SET_MINUTES_TIME_IL
        change_history_modal.fill_and_minutes_time minutes_time
      end

      step "Admin confirm time, click OK button" do
        check_element_path :xpath, CloudBeesChangeHistory::AND_CONFIRM_TIME_TA, CloudBeesChangeHistory::AND_CONFIRM_TIME_IL
        change_history_modal.and_confirm_time
      end

      step "Admin clicks search button" do
        check_element_path :xpath, CloudBeesChangeHistory::SEARCH_BTN_TA, CloudBeesChangeHistory::SEARCH_BTN_IL
        change_history_modal.click_search_btn
      end

      step "Admin clicks on dropdown Last changes" do
        check_element_path :xpath, CloudBeesChangeHistory::LAST_CHANGES_DROPDOWN_TA, CloudBeesChangeHistory::LAST_CHANGES_DROPDOWN_IL
        change_history_modal.click_last_changes_dropdown
      end

      step "Admin select in dropdown Past 3 days" do
        check_element_path :xpath, CloudBeesChangeHistory::PAST_3_DAYS_TA, CloudBeesChangeHistory::PAST_3_DAYS_IL
        change_history_modal.click_past_3_days
      end

      step "Admin clicks on dropdown All" do
        check_element_path :xpath, CloudBeesChangeHistory::ALL_DROPDOWN_TA, CloudBeesChangeHistory::ALL_DROPDOWN_IL
        change_history_modal.click_all_dropdown
      end

      step "Admin clicks on item All Object" do
        check_element_path :xpath, CloudBeesChangeHistory::ALL_OBJECTS_TA, CloudBeesChangeHistory::ALL_OBJECTS_IL
        change_history_modal.click_all_object
      end

      step "Admin choose on item Application" do
        check_element_path :xpath, CloudBeesChangeHistory::APPLICATION_TA, CloudBeesChangeHistory::APPLICATION_IL
        change_history_modal.click_application
      end

      step "Admin choose on item Component" do
        check_element_path :xpath, CloudBeesChangeHistory::COMPONENT_TA, CloudBeesChangeHistory::COMPONENT_IL
        change_history_modal.click_component
      end

      step "Admin clicks on search field" do
        check_element_path :xpath, CloudBeesChangeHistory::SEARCH_FIELD_TA, CloudBeesChangeHistory::SEARCH_FIELD_IL
        change_history_modal.click_on_search_field
      end

      sleep 3
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

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu :ep
      end

      step "Admin chooses the Change History section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::CHANGE_HISTORY_SECTION_EP, CloudBeesGlobal::CHANGE_HISTORY_SECTION_IL
        global_page.click_change_history :ep
      end

      step "Admin chooses the second item in table Change History" do
        check_element_path :xpath, CloudBeesChangeHistory::SECOND_ITEM_IN_TABLE_EP, CloudBeesChangeHistory::SECOND_ITEM_IN_TABLE_IL
        change_history_modal.click_second_item_in_table :ep
      end

      step "Admin clicks on dropdown Last Changes" do
        check_element_path :xpath, CloudBeesChangeHistory::DROPDOWN_LAST_CHANGES_EP, CloudBeesChangeHistory::DROPDOWN_LAST_CHANGES_IL
        change_history_modal.click_dropdown_last_changes :ep
      end

      step "Admin clicks on Past 24 hours" do
        check_element_path :xpath, CloudBeesChangeHistory::PAST_24_HOURS_EP, CloudBeesChangeHistory::PAST_24_HOURS_IL
        change_history_modal.click_past_24_hours :ep
      end

      step "Admin clicks on dropdown Past 24 hours" do
        check_element_path :xpath, CloudBeesChangeHistory::DROPDOWN_PAST_24_HOURS_EP, CloudBeesChangeHistory::DROPDOWN_PAST_24_HOURS_IL
        change_history_modal.click_dropdown_past_24_hours :ep
      end

      step "Admin clicks in dropdown Between" do
        check_element_path :xpath, CloudBeesChangeHistory::BETWEEN_BTN_EP, CloudBeesChangeHistory::BETWEEN_BTN_IL
        change_history_modal.click_between_btn :ep
      end

      step "Admin fills the hours time", '12' do |hours_time|
        check_element_path :xpath, CloudBeesChangeHistory::SET_HOURS_TIME_EP, CloudBeesChangeHistory::SET_HOURS_TIME_IL
        change_history_modal.fill_hours_time :ep, hours_time
      end

      step "Admin fills the minutes time", '00' do |minutes_time|
        check_element_path :xpath, CloudBeesChangeHistory::SET_MINUTES_TIME_EP, CloudBeesChangeHistory::SET_MINUTES_TIME_IL
        change_history_modal.fill_minutes_time :ep, minutes_time
      end

      step "Admin confirm time, click OK button" do
        check_element_path :xpath, CloudBeesChangeHistory::CONFIRM_TIME_EP, CloudBeesChangeHistory::CONFIRM_TIME_IL
        change_history_modal.confirm_time :ep
      end

      step "Admin fills the hours time", '13' do |hours_time|
        check_element_path :xpath, CloudBeesChangeHistory::AND_SET_HOURS_TIME_EP, CloudBeesChangeHistory::AND_SET_HOURS_TIME_IL
        change_history_modal.fill_and_hours_time :ep, hours_time
      end

      step "Admin fills the minutes time", '00' do |minutes_time|
        check_element_path :xpath, CloudBeesChangeHistory::AND_SET_MINUTES_TIME_EP, CloudBeesChangeHistory::AND_SET_MINUTES_TIME_IL
        change_history_modal.fill_and_minutes_time :ep, minutes_time
      end

      step "Admin confirm time, click OK button" do
        check_element_path :xpath, CloudBeesChangeHistory::AND_CONFIRM_TIME_EP, CloudBeesChangeHistory::AND_CONFIRM_TIME_IL
        change_history_modal.and_confirm_time :ep
      end

      step "Admin clicks search button" do
        check_element_path :xpath, CloudBeesChangeHistory::SEARCH_BTN_EP, CloudBeesChangeHistory::SEARCH_BTN_IL
        change_history_modal.click_search_btn :ep
      end

      step "Admin clicks on dropdown Last changes" do
        check_element_path :xpath, CloudBeesChangeHistory::LAST_CHANGES_DROPDOWN_EP, CloudBeesChangeHistory::LAST_CHANGES_DROPDOWN_IL
        change_history_modal.click_last_changes_dropdown :ep
      end

      step "Admin select in dropdown Past 3 days" do
        check_element_path :xpath, CloudBeesChangeHistory::PAST_3_DAYS_EP, CloudBeesChangeHistory::PAST_3_DAYS_IL
        change_history_modal.click_past_3_days :ep
      end

      step "Admin clicks on dropdown All" do
        check_element_path :xpath, CloudBeesChangeHistory::ALL_DROPDOWN_EP, CloudBeesChangeHistory::ALL_DROPDOWN_IL
        change_history_modal.click_all_dropdown :ep
      end

      step "Admin clicks on item All Object" do
        check_element_path :xpath, CloudBeesChangeHistory::ALL_OBJECTS_EP, CloudBeesChangeHistory::ALL_OBJECTS_IL
        change_history_modal.click_all_object :ep
      end

      step "Admin choose on item Application" do
        check_element_path :xpath, CloudBeesChangeHistory::APPLICATION_EP, CloudBeesChangeHistory::APPLICATION_IL
        change_history_modal.click_application :ep
      end

      step "Admin choose on item Component" do
        check_element_path :xpath, CloudBeesChangeHistory::COMPONENT_EP, CloudBeesChangeHistory::COMPONENT_IL
        change_history_modal.click_component :ep
      end

      step "Admin clicks on search field" do
        check_element_path :xpath, CloudBeesChangeHistory::SEARCH_FIELD_EP, CloudBeesChangeHistory::SEARCH_FIELD_IL
        change_history_modal.click_on_search_field :ep
      end

      sleep 3
    end

  end
end