require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
users_page = CloudBeesUsers.new
new_user_page = CloudBeesNewUser.new
edit_user_page = CloudBeesEditUser.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    step "Remove created user", settings('cloud_bees') do |data|
      page.visit data['users_page']
      users_page.fill_user_filter_field :il, data['user_username']
      users_page.apply_user_filter :il
      users_page.press_delete_user_btn :il
      users_page.confirm_user_deletion :il
    end
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Editing user password by Admin' do

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

      step "Admin presses the Create Local User button" do
        sleep 3 # to waiting iframe
        users_page.press_create_user_btn
      end

      step "Admin creates new user", settings('cloud_bees') do |user_data|
        new_user_page.fill_user_name_field user_data['user_username']
        new_user_page.fill_real_name_field user_data['user_realname']
        new_user_page.fill_email_field user_data['user_email']
        new_user_page.fill_password_field user_data['user_password']
        new_user_page.fill_repassword_field user_data['user_password']
        new_user_page.confirm_create_new_user
      end

      step "Admin filters the user", settings('cloud_bees') do |user_data|
        users_page.fill_user_filter_field user_data['user_username']
        users_page.apply_user_filter
      end

      step "Admin presses the Edit user button" do
        sleep 3 # to waiting iframe
        users_page.press_edit_user_btn
      end

      step "Admin updates user password", settings('cloud_bees') do |data|
        edit_user_page.fill_admin_password_field data['pass']
        edit_user_page.fill_new_user_password data['user_password']
        edit_user_page.fill_new_user_repassword data['user_password']
        edit_user_page.update_user_data
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

      step "Admin presses the Create Local User button" do
        within_frame(0) { check_element_path :xpath, CloudBeesUsers::CREATE_USER_BTN_TA, CloudBeesUsers::CREATE_USER_BTN_IL }
        users_page.press_create_user_btn
      end

      step "Admin creates new user", settings('cloud_bees') do |user_data|
        within_frame(0) { check_element_path :css, CloudBeesNewUser::USER_NAME_FIELD_TA, CloudBeesNewUser::USER_NAME_FIELD_IL }
        new_user_page.fill_user_name_field user_data['user_username']

        within_frame(0) { check_element_path :css, CloudBeesNewUser::REAL_NAME_FIELD_TA, CloudBeesNewUser::REAL_NAME_FIELD_IL }
        new_user_page.fill_real_name_field user_data['user_realname']

        within_frame(0) { check_element_path :css, CloudBeesNewUser::EMAIL_FIELD_TA, CloudBeesNewUser::EMAIL_FIELD_IL }
        new_user_page.fill_email_field user_data['user_email']

        within_frame(0) { check_element_path :css, CloudBeesNewUser::PASSWORD_FIELD_TA, CloudBeesNewUser::PASSWORD_FIELD_IL }
        new_user_page.fill_password_field user_data['user_password']

        within_frame(0) { check_element_path :css, CloudBeesNewUser::REPASSWORD_FIELD_TA, CloudBeesNewUser::REPASSWORD_FIELD_IL }
        new_user_page.fill_repassword_field user_data['user_password']

        within_frame(0) {  check_element_path :css, CloudBeesNewUser::CONFIRM_NEW_USER_TA, CloudBeesNewUser::CONFIRM_NEW_USER_IL }
        new_user_page.confirm_create_new_user
      end

      step "Admin filters the user", settings('cloud_bees') do |user_data|
        within_frame(0) { check_element_path :css, CloudBeesUsers::USER_FILTER_FIELD_TA, CloudBeesUsers::USER_FILTER_FIELD_IL }
        users_page.fill_user_filter_field user_data['user_username']

        within_frame(0) { check_element_path :css, CloudBeesUsers::APPLY_USER_FILTER_TA, CloudBeesUsers::APPLY_USER_FILTER_IL }
        users_page.apply_user_filter
      end

      step "Admin presses the Edit user button" do
        within_frame(0) { check_element_path :css, CloudBeesUsers::EDIT_USER_BTN_TA, CloudBeesUsers::EDIT_USER_BTN_IL }
        users_page.press_edit_user_btn
      end

      step "Admin updates user password", settings('cloud_bees') do |data|
        within_frame(0) { check_element_path :css, CloudBeesEditUser::ADMIN_PASS_FIELD_TA, CloudBeesEditUser::ADMIN_PASS_FIELD_IL }
        edit_user_page.fill_admin_password_field data['pass']

        within_frame(0) { check_element_path :css, CloudBeesEditUser::USER_PASS_FIELD_TA, CloudBeesEditUser::USER_PASS_FIELD_IL }
        edit_user_page.fill_new_user_password data['user_password']

        within_frame(0) { check_element_path :css, CloudBeesEditUser::USER_REPASS_FIELD_TA, CloudBeesEditUser::USER_REPASS_FIELD_IL }
        edit_user_page.fill_new_user_repassword data['user_password']

        within_frame(0) { check_element_path :css, CloudBeesEditUser::UPDATE_USER_DATA_BTN_TA, CloudBeesEditUser::UPDATE_USER_DATA_BTN_IL }
        edit_user_page.update_user_data
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

      step "Admin presses the Create Local User button" do
        within_frame(0) { check_element_path :xpath, CloudBeesUsers::CREATE_USER_BTN_EP, CloudBeesUsers::CREATE_USER_BTN_IL }
        users_page.press_create_user_btn :ep
      end

      step "Admin creates new user", settings('cloud_bees') do |user_data|
        within_frame(0) { check_element_path :css, CloudBeesNewUser::USER_NAME_FIELD_EP, CloudBeesNewUser::USER_NAME_FIELD_IL }
        new_user_page.fill_user_name_field :ep, user_data['user_username']

        within_frame(0) { check_element_path :css, CloudBeesNewUser::REAL_NAME_FIELD_EP, CloudBeesNewUser::REAL_NAME_FIELD_IL }
        new_user_page.fill_real_name_field :ep, user_data['user_realname']

        within_frame(0) { check_element_path :css, CloudBeesNewUser::EMAIL_FIELD_EP, CloudBeesNewUser::EMAIL_FIELD_IL }
        new_user_page.fill_email_field :ep, user_data['user_email']

        within_frame(0) { check_element_path :css, CloudBeesNewUser::PASSWORD_FIELD_EP, CloudBeesNewUser::PASSWORD_FIELD_IL }
        new_user_page.fill_password_field :ep, user_data['user_password']

        within_frame(0) { check_element_path :css, CloudBeesNewUser::REPASSWORD_FIELD_EP, CloudBeesNewUser::REPASSWORD_FIELD_IL }
        new_user_page.fill_repassword_field :ep, user_data['user_password']

        within_frame(0) {  check_element_path :css, CloudBeesNewUser::CONFIRM_NEW_USER_EP, CloudBeesNewUser::CONFIRM_NEW_USER_IL }
        new_user_page.confirm_create_new_user :ep
      end

      step "Admin filters the user", settings('cloud_bees') do |user_data|
        within_frame(0) { check_element_path :css, CloudBeesUsers::USER_FILTER_FIELD_EP, CloudBeesUsers::USER_FILTER_FIELD_IL }
        users_page.fill_user_filter_field :ep, user_data['user_username']

        within_frame(0) { check_element_path :css, CloudBeesUsers::APPLY_USER_FILTER_EP, CloudBeesUsers::APPLY_USER_FILTER_IL }
        users_page.apply_user_filter :ep
      end

      step "Admin presses the Edit user button" do
        within_frame(0) { check_element_path :css, CloudBeesUsers::EDIT_USER_BTN_EP, CloudBeesUsers::EDIT_USER_BTN_IL }
        users_page.press_edit_user_btn :ep
      end

      step "Admin updates user password", settings('cloud_bees') do |data|
        within_frame(0) { check_element_path :css, CloudBeesEditUser::ADMIN_PASS_FIELD_EP, CloudBeesEditUser::ADMIN_PASS_FIELD_IL }
        edit_user_page.fill_admin_password_field :ep, data['pass']

        within_frame(0) { check_element_path :css, CloudBeesEditUser::USER_PASS_FIELD_EP, CloudBeesEditUser::USER_PASS_FIELD_IL }
        edit_user_page.fill_new_user_password :ep, data['user_password']

        within_frame(0) { check_element_path :css, CloudBeesEditUser::USER_REPASS_FIELD_EP, CloudBeesEditUser::USER_REPASS_FIELD_IL }
        edit_user_page.fill_new_user_repassword :ep, data['user_password']

        within_frame(0) { check_element_path :css, CloudBeesEditUser::UPDATE_USER_DATA_BTN_EP, CloudBeesEditUser::UPDATE_USER_DATA_BTN_IL }
        edit_user_page.update_user_data :ep
      end

      sleep 3
    end


  end
end