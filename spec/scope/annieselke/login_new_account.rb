require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
login_page = LoginPage.new
banner_page = BannerPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Login to new account ' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        banner_page.close_banner
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
        banner_page.close_banner
      end

      step "User fills first name", settings('annieselke')['first_name'] do |first_name|
        login_page.fill_first_name(first_name)
      end

      step "User fills last name", settings('annieselke')['last_name'] do |last_name|
        banner_page.close_banner
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
        banner_page.close_banner
      end

      step "User clicks Register  button"   do
        login_page.click_register_button
      end
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        banner_page.close_banner
      end

      step "User clicks login link on home page"  do
        check_element_path :xpath, HomePage::LOGIN_LINK_TA, HomePage::LOGIN_LINK_IL
        home_page.click_login_link
      end

      step "User clicks Create New Account arrow button"  do
        check_element_path :xpath, LoginPage::CREATE_NEW_ACCOUNT_ARROW_TA, LoginPage::CREATE_NEW_ACCOUNT_ARROW_IL
        login_page.click_create_new_account_arrow
      end

      step "User clicks dropdown arrow", "ms"  do |value|
        check_element_path :xpath, LoginPage::DROPDOWN_ARROW_TA, LoginPage::DROPDOWN_ARROW_IL
        login_page.click_dropdown_arrow

        check_element_path :xpath, login_page.search_item(:ta, value), login_page.search_item(:il, value)
        login_page.select_dropdown value
        banner_page.close_banner
      end

      step "User fills first name", settings('annieselke')['first_name'] do |first_name|
        check_element_path :xpath, LoginPage::FIRST_NAME_TA, LoginPage::FIRST_NAME_IL
        login_page.fill_first_name(first_name)
      end

      step "User fills last name", settings('annieselke')['last_name'] do |last_name|
        check_element_path :xpath, LoginPage::LAST_NAME_TA, LoginPage::LAST_NAME_IL
        login_page.fill_last_name(last_name)
      end

      step "User fills email", settings('annieselke')['email'] do |email|
        check_element_path :xpath, LoginPage::EMAIL_TA, LoginPage::EMAIL_IL
        login_page.fill_email_name(email)
      end

      step "User fills pass", settings('annieselke')['pass'] do |pass|
        check_element_path :xpath, LoginPage::PASS_TA, LoginPage::PASS_IL
        login_page.fill_pass(pass)
      end

      step "User confirms pass", settings('annieselke')['email'] do |pass|
        check_element_path :xpath, LoginPage::CONFIRM_PASS_TA, LoginPage::CONFIRM_PASS_IL
        login_page.confirm_pass(pass)
        banner_page.close_banner
      end

      step "User clicks Register  button"   do
        check_element_path :xpath, LoginPage::REGISTER_BTN_TA, LoginPage::REGISTER_BTN_IL
        login_page.click_register_button
      end
    end
  end

end
