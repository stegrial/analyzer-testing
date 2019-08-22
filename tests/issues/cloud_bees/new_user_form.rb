require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/cloud_bees'

it = CloudBees.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-1001, TA Analyzer returns the wrong input field in the form when the needed input field is already filled' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('cloud_bees')['username'] do |username|
        it.fill_username_field username
      end

      step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
        it.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button
      end

      step "User clicks on the Hamburger menu button" do
        it.click_hamburger_menu
      end

      step "User chooses the Users section in the Hamburger menu" do
        it.choose_users_section
      end

      step "User presses the Create Local User button" do
        it.press_create_user_btn
      end

      step "User fills the User Name field", 'UserName' do |name|
        it.fill_new_user_name_field name
      end

      step "User fills the Real Name field", 'My Real Name' do |name|
        it.fill_new_real_name_field name
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('cloud_bees')['username'] do |username|
        check_element_path :css, CloudBees::USERNAME_FIELD_TA, CloudBees::USERNAME_FIELD_IL
        it.fill_username_field username
      end

      step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
        check_element_path :css, CloudBees::PASSWORD_FIELD_TA, CloudBees::PASSWORD_FIELD_IL
        it.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :css, CloudBees::SIGN_IN_BTN_TA, CloudBees::SIGN_IN_BTN_IL
        it.click_sign_in_button
      end

      step "User clicks on the Hamburger menu button" do
        check_element_path :css, CloudBees::HAM_MENU_BTN_TA, CloudBees::HAM_MENU_BTN_IL
        it.click_hamburger_menu
      end

      step "User chooses the Users section in the Hamburger menu" do
        check_element_path :xpath, CloudBees::USERS_SECTION_TA, CloudBees::USERS_SECTION_IL
        it.choose_users_section
      end

      step "User presses the Create Local User button" do
        within_frame(0) { check_element_path :xpath, CloudBees::CREATE_USER_BTN_TA, CloudBees::CREATE_USER_BTN_IL }
        it.press_create_user_btn
      end

      step "User fills the User Name field", 'UserName' do |name|
        within_frame(0) { check_element_path :css, CloudBees::USER_NAME_FIELD_TA, CloudBees::USER_NAME_FIELD_IL }
        it.fill_new_user_name_field name
      end

      2.times do
        step "User fills the Real Name field", 'My Real Name' do |name|
          within_frame(0) { check_element_path :css, CloudBees::REAL_NAME_FIELD_TA, CloudBees::REAL_NAME_FIELD_IL }
          it.fill_new_real_name_field name
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
        check_element_path :css, CloudBees::USERNAME_FIELD_EP, CloudBees::USERNAME_FIELD_IL
        it.fill_username_field :ep, username
      end

      step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
        check_element_path :css, CloudBees::PASSWORD_FIELD_EP, CloudBees::PASSWORD_FIELD_IL
        it.fill_pass_field :ep, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :css, CloudBees::SIGN_IN_BTN_EP, CloudBees::SIGN_IN_BTN_IL
        it.click_sign_in_button :ep
      end

      step "User clicks on the Hamburger menu button" do
        check_element_path :css, CloudBees::HAM_MENU_BTN_EP, CloudBees::HAM_MENU_BTN_IL
        it.click_hamburger_menu :ep
      end

      step "User chooses the Users section in the Hamburger menu" do
        check_element_path :xpath, CloudBees::USERS_SECTION_EP, CloudBees::USERS_SECTION_IL
        it.choose_users_section :ep
      end

      step "User presses the Create Local User button" do
        within_frame(0) { check_element_path :xpath, CloudBees::CREATE_USER_BTN_EP, CloudBees::CREATE_USER_BTN_IL }
        it.press_create_user_btn :ep
      end

      step "User fills the User Name field", 'UserName' do |name|
        within_frame(0) { check_element_path :css, CloudBees::USER_NAME_FIELD_EP, CloudBees::USER_NAME_FIELD_IL }
        it.fill_new_user_name_field :ep, name
      end

      2.times do
        step "User fills the Real Name field", 'My Real Name' do |name|
          within_frame(0) { check_element_path :css, CloudBees::REAL_NAME_FIELD_EP, CloudBees::REAL_NAME_FIELD_IL }
          it.fill_new_real_name_field :ep, name
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
        it.fill_username_field :il, username
      end

      step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
        it.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button :il
      end

      step "User clicks on the Hamburger menu button" do
        it.click_hamburger_menu :il
      end

      step "User chooses the Users section in the Hamburger menu" do
        it.choose_users_section :il
      end

      step "User presses the Create Local User button" do
        it.press_create_user_btn :il
      end

      step "User fills the User Name field", 'UserName' do |name|
        it.fill_new_user_name_field :il, name
      end

      step "User fills the Real Name field", 'My Real Name' do |name|
        it.fill_new_real_name_field name
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('cloud_bees')['username'] do |username|
        it.fill_username_field :il, username
      end

      step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
        it.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button :il
      end

      step "User clicks on the Hamburger menu button" do
        it.click_hamburger_menu :il
      end

      step "User chooses the Users section in the Hamburger menu" do
        it.choose_users_section :il
      end

      step "User presses the Create Local User button" do
        it.press_create_user_btn :il
      end

      step "User fills the User Name field", 'UserName' do |name|
        it.fill_new_user_name_field :il, name
      end

      step "User fills the Real Name field", 'My Real Name' do |name|
        it.fill_new_real_name_field :il, name
      end

      step "User fills the Real Name field", 'My Real Name' do |name|
        it.fill_new_real_name_field name
      end

      sleep 3
    end


  end
end