require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

iframe_page = TheTiebarIframe.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Help chat' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User fills search query field" do
        iframe_page.click_help_chat :il
        sleep 3
      end

      step "User fill name in chat modal", "testName" do |test_name|
        sleep 4
        iframe_page.fill_chat_name :il, test_name
      end

      step "User fill email in chat modal", "test@gmail.com" do |email|
        iframe_page.fill_chat_email  :il, email
      end

      step "User fill message in chat modal", "test test test" do |message|
        iframe_page.fill_chat_message :il, message
      end

      step "User clicks start button in chat modal" do
        iframe_page.click_start_chat_btn :il
      end

      step "User click minimaze chat button" do
        iframe_page.click_minimaze_chat :il
      end

      sleep 3
    end

    scenario 'Searching IL', il1: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User fills search query field" do
        check_element_path :xpath, TheTiebarIframe::HELP_CHAT_BTN_TA, TheTiebarIframe::HELP_CHAT_BTN_IL
        iframe_page.click_help_chat
      end

      step "User fill name in chat modal", "testName" do |test_name|
        within_frame(0) { check_element_path :xpath, TheTiebarIframe::CHAT_NAME_TA, TheTiebarIframe::CHAT_NAME_IL }
        iframe_page.fill_chat_name  test_name
      end

      step "User fill email in chat modal", "test@gmail.com" do |email|
        within_frame(0) { check_element_path :xpath, TheTiebarIframe::CHAT_EMAIL_TA, TheTiebarIframe::CHAT_EMAIL_IL }
        iframe_page.fill_chat_email  email
      end

      step "User fill message in chat modal", "test test test" do |message|
        within_frame(0) { check_element_path :xpath, TheTiebarIframe::CHAT_MESSAGE_TA, TheTiebarIframe::CHAT_MESSAGE_IL }
        iframe_page.fill_chat_message  message
      end

      step "User clicks start button in chat modal" do
        within_frame(0) { check_element_path :xpath, TheTiebarIframe::START_CHAT_BTN_TA, TheTiebarIframe::START_CHAT_BTN_IL }
        iframe_page.click_start_chat_btn
      end

      step "User click minimaze chat button" do
        within_frame(0) { check_element_path :xpath, TheTiebarIframe::MINIMAZE_CHAT_TA, TheTiebarIframe::MINIMAZE_CHAT_IL }
        iframe_page.click_minimaze_chat
      end

      sleep 3
    end

    # Element Picker

    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User fills search query field" do
        check_element_path :xpath, TheTiebarIframe::HELP_CHAT_BTN_EP, TheTiebarIframe::HELP_CHAT_BTN_IL
        iframe_page.click_help_chat :ep
      end

      step "User fill name in chat modal", "testName" do |test_name|
        within_frame(0) {  check_element_path :xpath, TheTiebarIframe::CHAT_NAME_EP, TheTiebarIframe::CHAT_NAME_IL }
        iframe_page.fill_chat_name  :ep, test_name
      end

      step "User fill email in chat modal", "test@gmail.com" do |email|
        within_frame(0) {  check_element_path :xpath, TheTiebarIframe::CHAT_EMAIL_EP, TheTiebarIframe::CHAT_EMAIL_IL }
        iframe_page.fill_chat_email  :ep, email
      end

      step "User fill message in chat modal", "test test test" do |message|
        within_frame(0) {   check_element_path :xpath, TheTiebarIframe::CHAT_MESSAGE_EP, TheTiebarIframe::CHAT_MESSAGE_IL }
        iframe_page.fill_chat_message :ep, message
      end

      step "User clicks start button in chat modal" do
        within_frame(0) {  check_element_path :xpath, TheTiebarIframe::START_CHAT_BTN_EP, TheTiebarIframe::START_CHAT_BTN_IL }
        iframe_page.click_start_chat_btn :ep
      end

      step "User click minimaze chat button" do
        within_frame(0) {  check_element_path :xpath, TheTiebarIframe::MINIMAZE_CHAT_EP, TheTiebarIframe::MINIMAZE_CHAT_IL }
        iframe_page.click_minimaze_chat :ep
      end

      sleep 3
    end

  end
end
