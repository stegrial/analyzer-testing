require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/tumblr'

include ElementSearchValidation

it = Tumblr.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Tumblr - search results' do

  # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('tumblr')['page'] do |url|
        page.visit url
      end

      step "User click sign up button"  do
        sleep 5
        it.click_sign_up_btn
      end

      step "User set email in input", "arapova.jul2@gmail.com" do |email|
        it.set_email(email)
      end

      step "User set password in input", "4321test" do |pass|
        it.set_password(pass)
      end

      step "User click sign up link" do
        it.click_sign_up_link
      end

      step "User click sign up determine email", "arapova.jul2@gmail.com" do |mail|
        it.click_sign_up_determine_mail(mail)
      end

      step "User click sign up determine button" do
        it.click_sign_up_determine_btn
      end

      step "User click forgot password" do
        it.click_forgot_password
      end

      step "User set password in input", "123456789QWERTY" do |pass|
        it.set_password(pass)
      end

      step "User click sign up for login" do
        it.click_signup_for_login
      end

      step "User click add new post" do
        it.click_add_post
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('tumblr')['page'] do |url|
        page.visit url
      end

      step "User click sign up button"  do
        check_element_path :xpath,  Tumblr::SIGN_UP_BTN_TA, Tumblr::SIGN_UP_BTN_IL
        it.click_sign_up_btn
      end

      step "User set email in input", "arapova.jul2@gmail.com" do |email|
        check_element_path :xpath,  Tumblr::SIGN_UP_EMAIL_TA, Tumblr::SIGN_UP_EMAIL_IL
        it.set_email(email)
      end

      step "User set password in input", "4321test" do |pass|
        check_element_path :xpath,  Tumblr::SIGN_UP_PASSWORD_TA, Tumblr::SIGN_UP_PASSWORD_IL
        it.set_password(pass)
      end

      step "User click sign up link" do
        check_element_path :xpath,  Tumblr::SIGN_UP_LINK_TA, Tumblr::SIGN_UP_LINK_IL
        it.click_sign_up_link
      end

      step "User click sign up determine email", "arapova.jul2@gmail.com" do |mail|
        check_element_path :xpath,  Tumblr::REGISTR_EMAIL_TA, Tumblr::REGISTR_EMAIL_IL
        it.click_sign_up_determine_mail(mail)
      end

      step "User click sign up determine button" do
        check_element_path :xpath,  Tumblr::NEXT_BTN_TA, Tumblr::NEXT_BTN_IL
        it.click_sign_up_determine_btn
      end

      step "User click forgot password" do
        check_element_path :xpath,  Tumblr::FORGOT_PASSWORD_LINK_TA, Tumblr::FORGOT_PASSWORD_LINK_IL
        it.click_forgot_password
      end

      step "User set password in input", "123456789QWERTY" do |pass|
        check_element_path :xpath,  Tumblr::SIGN_UP_PASSWORD_TA, Tumblr::SIGN_UP_PASSWORD_IL
        it.set_password(pass)
      end

      step "User click sign up for login" do
        check_element_path :xpath,  Tumblr::SIGN_UP_LOGIN_TA, Tumblr::SIGN_UP_LOGIN_IL
        it.click_signup_for_login
      end

      step "User click add new post" do
        check_element_path :xpath,  Tumblr::ADD_POST_BTN_TA, Tumblr::ADD_POST_BTN_IL
        it.click_add_post
      end

    end

  # Element Picker from Repository

    scenario 'TA-826 - Searching EP', ep: true do

      step "User goes to the page", settings('tumblr')['page'] do |url|
        page.visit url
      end

      step "User click sign up button"  do
        check_element_path :xpath,  Tumblr::SIGN_UP_BTN_EP, Tumblr::SIGN_UP_BTN_IL
        it.click_sign_up_btn :ep
      end

      step "User set email in input", "arapova.jul2@gmail.com" do |email|
        check_element_path :xpath,  Tumblr::SIGN_UP_EMAIL_EP, Tumblr::SIGN_UP_EMAIL_IL
        it.set_email(:ep,email)
      end

      step "User set password in input", "4321test" do |pass|
        check_element_path :xpath,  Tumblr::SIGN_UP_PASSWORD_EP, Tumblr::SIGN_UP_PASSWORD_IL
        it.set_password(:ep,pass)
      end

      step "User click sign up link" do
        check_element_path :xpath,  Tumblr::SIGN_UP_LINK_EP, Tumblr::SIGN_UP_LINK_IL
        it.click_sign_up_link :ep
      end

      step "User click sign up determine email", "arapova.jul2@gmail.com" do |mail|
        check_element_path :xpath,  Tumblr::REGISTR_EMAIL_EP, Tumblr::REGISTR_EMAIL_IL
        it.click_sign_up_determine_mail(:ep,mail)
      end

      step "User click sign up determine button" do
        check_element_path :xpath,  Tumblr::NEXT_BTN_EP, Tumblr::NEXT_BTN_IL
        it.click_sign_up_determine_btn :ep
      end

      step "User click forgot password" do
        check_element_path :xpath,  Tumblr::FORGOT_PASSWORD_LINK_EP, Tumblr::FORGOT_PASSWORD_LINK_IL
        it.click_forgot_password :ep
      end

      step "User set password in input", "123456789QWERTY" do |pass|
        check_element_path :xpath,  Tumblr::SIGN_UP_PASSWORD_EP, Tumblr::SIGN_UP_PASSWORD_IL
        it.set_password(:ep,pass)
      end

      step "User click sign up for login" do
        check_element_path :xpath,  Tumblr::SIGN_UP_LOGIN_EP, Tumblr::SIGN_UP_LOGIN_IL
        it.click_signup_for_login :ep
      end

      step "User click add new post" do
        check_element_path :xpath,  Tumblr::ADD_POST_BTN_EP, Tumblr::ADD_POST_BTN_IL
        it.click_add_post :ep
      end
    end
  end
end