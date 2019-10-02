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
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  after(:all) do
    delete_saved_elements
    Capybara.current_session.driver.quit
  end

  feature 'TA-1001, TA Analyzer returns the wrong input field in the form when the needed input field is already filled' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('cloud_bees')['username'] do |username|
        login_page.fill_username_field username
      end

      step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
        login_page.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button
      end

      step "User clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu
      end

      step "User chooses the Users section in the Hamburger menu" do
        global_page.choose_users_section
      end

      step "User presses the Create Local User button" do
        sleep 3 # to waiting iframe
        users_page.press_create_user_btn
      end

      step "User fills the User Name field", 'UserName' do |name|
        sleep 3 # to waiting iframe
        new_user_page.fill_user_name_field name
      end

      step "User fills the Real Name field", 'My Real Name' do |name|
        new_user_page.fill_real_name_field name
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('cloud_bees')['username'] do |username|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field username
      end

      step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_TA, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_TA, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "User clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu
      end

      step "User chooses the Users section in the Hamburger menu" do
        check_element_path :xpath, CloudBeesGlobal::USERS_SECTION_TA, CloudBeesGlobal::USERS_SECTION_IL
        global_page.choose_users_section
      end

      step "User presses the Create Local User button" do
        sleep 3 # to waiting iframe
        within_frame(0) { check_element_path :xpath, CloudBeesUsers::CREATE_USER_BTN_TA, CloudBeesUsers::CREATE_USER_BTN_IL }
        users_page.press_create_user_btn
      end

      step "User fills the User Name field", 'UserName' do |name|
        sleep 3 # to waiting iframe
        within_frame(0) { check_element_path :css, CloudBeesNewUser::USER_NAME_FIELD_TA, CloudBeesNewUser::USER_NAME_FIELD_IL }
        new_user_page.fill_user_name_field name
      end

      2.times do
        step "User fills the Real Name field twice", 'My Real Name' do |name|
          within_frame(0) { check_element_path :css, CloudBeesNewUser::REAL_NAME_FIELD_TA, CloudBeesNewUser::REAL_NAME_FIELD_IL }
          new_user_page.fill_real_name_field name
        end
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('cloud_bees')['username'] do |username|
        check_element_path :css, CloudBeesGlobal::USERNAME_FIELD_EP, CloudBeesGlobal::USERNAME_FIELD_IL
        login_page.fill_username_field :ep, username
      end

      step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
        check_element_path :css, CloudBeesGlobal::PASSWORD_FIELD_EP, CloudBeesGlobal::PASSWORD_FIELD_IL
        login_page.fill_pass_field :ep, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :css, CloudBeesGlobal::SIGN_IN_BTN_EP, CloudBeesGlobal::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
      end

      step "User clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu :ep
      end

      step "User chooses the Users section in the Hamburger menu" do
        check_element_path :xpath, CloudBeesGlobal::USERS_SECTION_EP, CloudBeesGlobal::USERS_SECTION_IL
        global_page.choose_users_section :ep
      end

      step "User presses the Create Local User button" do
        sleep 3 # to waiting iframe
        within_frame(0) { check_element_path :xpath, CloudBeesGlobal::CREATE_USER_BTN_EP, CloudBeesGlobal::CREATE_USER_BTN_IL }
        users_page.press_create_user_btn :ep
      end

      step "User fills the User Name field", 'UserName' do |name|
        sleep 3 # to waiting iframe
        within_frame(0) { check_element_path :css, CloudBeesGlobal::USER_NAME_FIELD_EP, CloudBeesGlobal::USER_NAME_FIELD_IL }
        new_user_page.fill_user_name_field :ep, name
      end

      2.times do
        step "User fills the Real Name field twice", 'My Real Name' do |name|
          within_frame(0) { check_element_path :css, CloudBeesGlobal::REAL_NAME_FIELD_EP, CloudBeesGlobal::REAL_NAME_FIELD_IL }
          new_user_page.fill_real_name_field :ep, name
        end
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('cloud_bees')['username'] do |username|
        login_page.fill_username_field :il, username
      end

      step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
        login_page.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button :il
      end

      step "User clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu :il
      end

      step "User chooses the Users section in the Hamburger menu" do
        global_page.choose_users_section :il
      end

      step "User presses the Create Local User button" do
        sleep 3 # to waiting iframe
        users_page.press_create_user_btn :il
      end

      step "User fills the User Name field", 'UserName' do |name|
        sleep 3 # to waiting iframe
        new_user_page.fill_user_name_field :il, name
      end

      step "User fills the Real Name field", 'My Real Name' do |name|
        new_user_page.fill_real_name_field name
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('cloud_bees')['username'] do |username|
        login_page.fill_username_field :il, username
      end

      step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
        login_page.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button :il
      end

      step "User clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu :il
      end

      step "User chooses the Users section in the Hamburger menu" do
        global_page.choose_users_section :il
      end

      step "User presses the Create Local User button" do
        sleep 3 # to waiting iframe
        users_page.press_create_user_btn :il
      end

      step "User fills the User Name field", 'UserName' do |name|
        sleep 3 # to waiting iframe
        new_user_page.fill_user_name_field :il, name
      end

      step "User fills the Real Name field", 'My Real Name' do |name|
        new_user_page.fill_real_name_field :il, name
      end

      step "User fills the Real Name field again", 'My Real Name' do |name|
        new_user_page.fill_real_name_field name
      end

      sleep 3
    end


  end
end