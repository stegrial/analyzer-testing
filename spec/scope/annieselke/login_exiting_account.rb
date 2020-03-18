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

  feature 'Login via existing account' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        home_page.close_banner
      end

      step "User clicks login link on home page"  do
        home_page.click_login_link
      end

      step "User fills email", settings('annieselke')['email'] do |email|
        home_page.close_banner
        login_page.fill_email_input(email)
      end

      step "User fills pass", settings('annieselke')['pass'] do |pass|
        login_page.fill_pass_input(pass)
      end

      step "User clicks login button" do
        login_page.click_login_btn
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

      step "User fills email", settings('annieselke')['email'] do |email|
        home_page.close_banner
        check_element_path :xpath, Login_Page::EMAIL_FIELD_TA, Login_Page::EMAIL_FIELD_IL
        login_page.fill_email_input(email)
      end

      step "User fills pass", settings('annieselke')['pass'] do |pass|
        check_element_path :xpath, Login_Page::PASS_FIELD_TA, Login_Page::PASS_FIELD_IL
        login_page.fill_pass_input(pass)
      end

      step "User clicks login button" do
        check_element_path :xpath, Login_Page::LOGIN_BTN_TA, Login_Page::LOGIN_BTN_IL
        login_page.click_login_btn
      end
    end
  end
end
