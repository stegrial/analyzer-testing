require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = Home_Page.new
login_page = Login_Page.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Search items on home page' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        home_page.close_banner
      end

      step "User clicks login link on home page"  do
        home_page.click_login_link
      end

      step "User clicks Create New Account arrow button"  do
        login_page.click_create_new_account_arrow
      end

      step "User clicks dropdown arrow", "ms"  do |value|
        login_page.click_dropdown_arrow
        login_page.select_dropdown value
        login_page.close_banner
      end

      step "User fills first name", settings('annieselke')['first_name'] do |first_name|
        login_page.fill_first_name(first_name)
      end

      step "User fills last name", settings('annieselke')['last_name'] do |last_name|
        login_page.fill_last_name(last_name)
      end

      step "User fills email", settings('annieselke')['email'] do |email|
        login_page.fill_email_name(email)
      end

      step "User fills pass", settings('annieselke')['pass'] do |pass|
        login_page.fill_pass(pass)
      end

      step "User confirms pass", settings('annieselke')['email'] do |pass|
        login_page.confirm_pass(pass)
      end

      step "User clicks Register  button"   do
        login_page.click_register_button
      end
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        home_page.close_banner
      end

      step "User clicks login link on home page"  do
        check_element_path :xpath, Home_Page::LOGIN_LINK_TA, Home_Page::LOGIN_LINK_IL
        home_page.click_login_link
      end

      step "User clicks Create New Account arrow button"  do
        check_element_path :xpath, Login_Page::CREATE_NEW_ACCOUNT_ARROW_TA, Login_Page::CREATE_NEW_ACCOUNT_ARROW_IL
        login_page.click_create_new_account_arrow
      end

      step "User clicks dropdown arrow", "ms"  do |value|
        check_element_path :xpath, Login_Page::DROPDOWN_ARROW_TA, Login_Page::DROPDOWN_ARROW_IL
        login_page.click_dropdown_arrow

        check_element_path :xpath, login_page.search_item(:ta, value), login_page.search_item(:il, value)
        login_page.select_dropdown value
      end

      step "User fills first name", settings('annieselke')['first_name'] do |first_name|
        check_element_path :xpath, Login_Page::FIRST_NAME_TA, Login_Page::FIRST_NAME_IL
        login_page.fill_first_name(first_name)
      end

      step "User fills last name", settings('annieselke')['last_name'] do |last_name|
        check_element_path :xpath, Login_Page::LAST_NAME_TA, Login_Page::LAST_NAME_IL
        login_page.fill_last_name(last_name)
      end

      step "User fills email", settings('annieselke')['email'] do |email|
        check_element_path :xpath, Login_Page::EMAIL_TA, Login_Page::EMAIL_IL
        login_page.fill_email_name(email)
      end

      step "User fills pass", settings('annieselke')['pass'] do |pass|
        check_element_path :xpath, Login_Page::PASS_TA, Login_Page::PASS_IL
        login_page.fill_pass(pass)
      end

      step "User confirms pass", settings('annieselke')['email'] do |pass|
        check_element_path :xpath, Login_Page::CONFIRM_PASS_TA, Login_Page::CONFIRM_PASS_IL
        login_page.confirm_pass(pass)
        login_page.close_banner
      end

      step "User clicks Register  button"   do
        check_element_path :xpath, Login_Page::REGISTER_BTN_TA, Login_Page::REGISTER_BTN_IL
        login_page.click_register_button
      end
    end
  end

end
