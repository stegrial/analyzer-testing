require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
login_page = LoginPage.new
forgotten_pass_page = ForgottenPassPage.new
banner_page = BannerPage.new
header_page = HeaderPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Password recovery ' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        banner_page.close_banner
      end

      step "User clicks login link on home page" do
        header_page.click_login_link
      end

      step "User clicks Oops! I forgot my password." do
        login_page.click_forgot_pass_link
      end

      step "User fills email", settings('annieselke')['email'] do |email|
        login_page.fill_email_input(email)
      end

      step "User clicks Send email button" do
        forgotten_pass_page.click_send_email_btn
      end

      step "User clicks Return to login button" do
        forgotten_pass_page.click_return_login_btn
      end

      sleep 3
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        banner_page.close_banner
      end

      step "User clicks login link on home page" do
        check_element_path :xpath, HeaderPage::LOGIN_LINK_TA, HeaderPage::LOGIN_LINK_IL
        header_page.click_login_link
      end

      step "User clicks Oops! I forgot my password." do
        check_element_path :xpath, LoginPage::FORGOTTEN_PASS_LINK_TA, LoginPage::FORGOTTEN_PASS_LINK_IL
        login_page.click_forgot_pass_link
      end

      step "User fills email", settings('annieselke')['email'] do |email|
        check_element_path :xpath, LoginPage::EMAIL_FIELD_TA, LoginPage::EMAIL_FIELD_IL
        login_page.fill_email_input(email)
      end

      step "User clicks Send email button" do
        check_element_path :xpath, ForgottenPassPage::SEND_EMAIL_BTN_TA, ForgottenPassPage::SEND_EMAIL_BTN_IL
        forgotten_pass_page.click_send_email_btn
      end

      step "User clicks Return to login button" do
        check_element_path :xpath, ForgottenPassPage::RETURN_LOGIN_BTN_TA, ForgottenPassPage::RETURN_LOGIN_BTN_IL
        forgotten_pass_page.click_return_login_btn
      end

      sleep 3
    end
  end
end
