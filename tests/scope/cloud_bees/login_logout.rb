require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Authorization (Login and Logout)' do

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

      step "User clicks on the Administrator menu button" do
        global_page.click_admin_menu
      end

      step "User clicks on the Logout button" do
        global_page.click_logout_button
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

      step "User clicks on the Administrator menu button" do
        check_element_path :xpath, CloudBeesGlobal::ADMIN_MENU_TA, CloudBeesGlobal::ADMIN_MENU_IL
        global_page.click_admin_menu
      end

      step "User clicks on the Logout button" do
        check_element_path :xpath, CloudBeesGlobal::LOGOUT_BTN_TA, CloudBeesGlobal::LOGOUT_BTN_IL
        global_page.click_logout_button
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", settings('cloud_bees')['username'] do |username|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_EP, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field :ep, username
      end

      step "User fills the Password field", settings('cloud_bees')['pass'] do |pass|
        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_EP, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field :ep, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_EP, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
      end

      step "User clicks on the Hamburger menu button" do
        check_element_path :xpath, CloudBeesGlobal::ADMIN_MENU_EP, CloudBeesGlobal::ADMIN_MENU_IL
        global_page.click_admin_menu :ep
      end

      step "User clicks on the Logout button" do
        check_element_path :xpath, CloudBeesGlobal::LOGOUT_BTN_EP, CloudBeesGlobal::LOGOUT_BTN_IL
        global_page.click_logout_button :ep
      end

      sleep 3
    end

  end
end