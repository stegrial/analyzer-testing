require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
users_page = CloudBeesUsers.new
new_user_page = CloudBeesNewUser.new


describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-1002, TA Analyzer returns the wrong element when the right element is not present on the page (Cloud Bees - Users Filter)' do

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

      step "Admin chooses the Users section in the Hamburger menu" do
        global_page.choose_users_section
      end

      step "Admin filters the user", settings('cloud_bees') do |user_data|
        users_page.fill_user_filter_field user_data['user_username']
        users_page.apply_user_filter
      end

      step "Admin presses the Create Local User button" do
        users_page.press_create_user_btn
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

      step "Admin chooses the Users section in the Hamburger menu" do
        check_element_path :xpath, CloudBeesGlobal::USERS_SECTION_TA, CloudBeesGlobal::USERS_SECTION_IL
        global_page.choose_users_section
      end

      step "Admin filters the user", settings('cloud_bees') do |user_data|
        within_frame(0) { check_element_path :css, CloudBeesUsers::USER_FILTER_FIELD_TA, CloudBeesUsers::USER_FILTER_FIELD_IL }
        users_page.fill_user_filter_field user_data['user_username']

        within_frame(0) { check_element_path :css, CloudBeesUsers::APPLY_USER_FILTER_TA, CloudBeesUsers::APPLY_USER_FILTER_IL }
        users_page.apply_user_filter
      end

      step "Admin presses the Create Local User button" do
        within_frame(0) { check_element_path :xpath, CloudBeesUsers::CREATE_USER_BTN_TA, CloudBeesUsers::CREATE_USER_BTN_IL }
        users_page.press_create_user_btn
      end

      step "Admin does not see the User Filter on the New User Creating page" do
        new_user_page.check_no_user_filter CloudBeesUsers::USER_FILTER_FIELD_IL, CloudBeesUsers::USER_FILTER_FIELD_TA, CloudBeesUsers::USER_FILTER_FIELD_EP
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

      step "Admin chooses the Users section in the Hamburger menu" do
        check_element_path :xpath, CloudBeesGlobal::USERS_SECTION_EP, CloudBeesGlobal::USERS_SECTION_IL
        global_page.choose_users_section :ep
      end

      step "Admin filters the user", settings('cloud_bees') do |user_data|
        within_frame(0) { check_element_path :css, CloudBeesUsers::USER_FILTER_FIELD_EP, CloudBeesUsers::USER_FILTER_FIELD_IL }
        users_page.fill_user_filter_field :ep, user_data['user_username']

        within_frame(0) { check_element_path :css, CloudBeesUsers::APPLY_USER_FILTER_EP, CloudBeesUsers::APPLY_USER_FILTER_IL }
        users_page.apply_user_filter :ep
      end

      step "Admin presses the Create Local User button" do
        within_frame(0) { check_element_path :xpath, CloudBeesUsers::CREATE_USER_BTN_EP, CloudBeesUsers::CREATE_USER_BTN_IL }
        users_page.press_create_user_btn :ep
      end

      step "Admin does not see the User Filter on the New User Creating page" do
        new_user_page.check_no_user_filter :ep, CloudBeesUsers::USER_FILTER_FIELD_IL, CloudBeesUsers::USER_FILTER_FIELD_TA, CloudBeesUsers::USER_FILTER_FIELD_EP
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

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu :il
      end

      step "Admin chooses the Users section in the Hamburger menu" do
        global_page.choose_users_section :il
      end

      step "Admin filters the user", settings('cloud_bees') do |user_data|
        users_page.fill_user_filter_field user_data['user_username']
        users_page.apply_user_filter :il
      end

      step "Admin presses the Create Local User button" do
        users_page.press_create_user_btn :il
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

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu :il
      end

      step "Admin chooses the Users section in the Hamburger menu" do
        global_page.choose_users_section :il
      end

      step "Admin filters the user", settings('cloud_bees') do |user_data|
        users_page.fill_user_filter_field :il, user_data['user_username']
        users_page.apply_user_filter :il
      end

      step "Admin presses the Create Local User button" do
        users_page.press_create_user_btn :il
      end

      step "Admin does not see the User Filter on the New User Creating page" do
        new_user_page.check_no_user_filter CloudBeesUsers::USER_FILTER_FIELD_IL, CloudBeesUsers::USER_FILTER_FIELD_TA, CloudBeesUsers::USER_FILTER_FIELD_EP
      end

      sleep 3
    end


  end
end