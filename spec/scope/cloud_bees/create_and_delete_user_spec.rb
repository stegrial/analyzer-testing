require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
users_page = CloudBeesUsers.new
new_user_page = CloudBeesNewUser.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Creating and Deleting user' do

    scenario 'Test - Recording', record: true do
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

      step "Admin presses the Create Local User button" do
        sleep 3 # to waiting iframe
        users_page.press_create_user_btn
      end

      step "Admin fills the User Name field", 'Car' do |name|
        sleep 3 # to waiting iframe
        new_user_page.fill_user_name_field name
      end

      step "Admin fills the Real Name field", 'CarCar' do |name|
        new_user_page.fill_real_name_field name
      end

      step "Admin fills the Email field", 'CarCar@email.com' do |name|
        new_user_page.fill_email_field name
      end

      step "Admin fills the Password field", 'pass' do |name|
        new_user_page.fill_password_field name
      end

      step "Admin fills the Retype Password field", 'pass' do |name|
        new_user_page.fill_repassword_field name
      end

      step "Admin confirms create new user" do
        new_user_page.confirm_create_new_user
      end

      step "Admin fills the filter field", 'Car' do |user_username|
        users_page.fill_user_filter_field user_username
      end

      step "Admin filters the user" do
        users_page.apply_user_filter
      end

      step "Admin clicks on deleting user" do
        users_page.press_delete_user_btn
      end

      step "Admin clicks on confirm deleting user" do
        users_page.confirm_user_deletion
      end

      sleep 3
    end

    scenario 'Test - Searching', search: true do
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

      step "Admin presses the Create Local User button" do
        sleep 3 # to waiting iframe
        within_frame(0) { check_element_path :xpath, CloudBeesUsers::CREATE_USER_BTN_TA, CloudBeesUsers::CREATE_USER_BTN_IL }
        users_page.press_create_user_btn
      end

      step "Admin fills the User Name field", 'Car' do |name|
        sleep 3 # to waiting iframe
        within_frame(0) { check_element_path :css, CloudBeesNewUser::USER_NAME_FIELD_TA, CloudBeesNewUser::USER_NAME_FIELD_IL }
        new_user_page.fill_user_name_field name
      end

      step "Admin fills the Real Name field", 'CarCar' do |name|
        within_frame(0) { check_element_path :css, CloudBeesNewUser::REAL_NAME_FIELD_TA, CloudBeesNewUser::REAL_NAME_FIELD_IL }
        new_user_page.fill_real_name_field name
      end

      step "Admin fills the Email field", 'CarCar@email.com' do |name|
        within_frame(0) { check_element_path :css, CloudBeesNewUser::EMAIL_FIELD_TA, CloudBeesNewUser::EMAIL_FIELD_IL }
        new_user_page.fill_email_field name
      end

      step "Admin fills the Password field", 'pass' do |name|
        within_frame(0) { check_element_path :css, CloudBeesNewUser::PASSWORD_FIELD_TA, CloudBeesNewUser::PASSWORD_FIELD_IL }
        new_user_page.fill_password_field name
      end

      step "Admin fills the Retype Password field", 'pass' do |name|
        within_frame(0) { check_element_path :css, CloudBeesNewUser::REPASSWORD_FIELD_TA, CloudBeesNewUser::REPASSWORD_FIELD_IL }
        new_user_page.fill_repassword_field name
      end

      step "Admin confirms create new user" do
        within_frame(0) { check_element_path :css, CloudBeesNewUser::CONFIRM_NEW_USER_TA, CloudBeesNewUser::CONFIRM_NEW_USER_IL }
        new_user_page.confirm_create_new_user
      end

      step "Admin fills the filter field", 'Car' do |user_username|
        within_frame(0) { check_element_path :css, CloudBeesUsers::USER_FILTER_FIELD_TA, CloudBeesUsers::USER_FILTER_FIELD_IL }
        users_page.fill_user_filter_field user_username
      end

      step "Admin filters the user" do
        within_frame(0) { check_element_path :css, CloudBeesUsers::APPLY_USER_FILTER_TA, CloudBeesUsers::APPLY_USER_FILTER_IL }
        users_page.apply_user_filter
      end

      step "Admin clicks on deleting user" do
        within_frame(0) { check_element_path :css, CloudBeesUsers::DELETE_USER_BTN_TA, CloudBeesUsers::DELETE_USER_BTN_IL }
        users_page.press_delete_user_btn
      end

      step "Admin clicks on confirm deleting user" do
        within_frame(0) { check_element_path :xpath, CloudBeesUsers::CONFIRM_USER_DELETION_BTN_TA, CloudBeesUsers::CONFIRM_USER_DELETION_BTN_IL }
        users_page.confirm_user_deletion
      end

      sleep 3
    end

  end
end