require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

header_page = TheTiebarIframe.new

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
        header_page.click_help_chat
      end

      step "User fill name in chat modal", "testName" do |test_name|
        sleep 4
        header_page.fill_chat_name  test_name
      end

      step "User fill email in chat modal", "test@gmail.com" do |email|
        header_page.fill_chat_email  email
      end

      step "User fill message in chat modal", "test test test" do |message|
        header_page.fill_chat_message  message
      end

      step "User clicks start button in chat modal" do
        header_page.click_start_chat_btn
      end

      step "User click minimaze chat button" do
        header_page.click_minimaze_chat
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User fills search query field" do
        check_element_path :xpath, TheTiebarIframe::HELP_CHAT_BTN_TA, TheTiebarIframe::HELP_CHAT_BTN_IL
        header_page.click_help_chat
      end

      step "User fill name in chat modal", "testName" do |test_name|
        check_element_path :xpath, TheTiebarIframe::CHAT_NAME_TA, TheTiebarIframe::CHAT_NAME_IL
        header_page.fill_chat_name  test_name
      end

      step "User fill email in chat modal", "test@gmail.com" do |email|
        check_element_path :xpath, TheTiebarIframe::CHAT_EMAIL_TA, TheTiebarIframe::CHAT_EMAIL_IL
        header_page.fill_chat_email  email
      end

      step "User fill message in chat modal", "test test test" do |message|
        check_element_path :xpath, TheTiebarIframe::CHAT_MESSAGE_TA, TheTiebarIframe::CHAT_MESSAGE_IL
        header_page.fill_chat_message  message
      end

      step "User clicks start button in chat modal" do
        check_element_path :xpath, TheTiebarIframe::START_CHAT_BTN_TA, TheTiebarIframe::START_CHAT_BTN_IL
        header_page.click_start_chat_btn
      end

      step "User click minimaze chat button" do
        check_element_path :xpath, TheTiebarIframe::MINIMAZE_CHAT_TA, TheTiebarIframe::MINIMAZE_CHAT_IL
        header_page.click_minimaze_chat
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
        header_page.click_help_chat :ep
      end

      step "User fill name in chat modal", "testName" do |test_name|
        check_element_path :xpath, TheTiebarIframe::CHAT_NAME_EP, TheTiebarIframe::CHAT_NAME_IL
        header_page.fill_chat_name  :ep, test_name
      end

      step "User fill email in chat modal", "test@gmail.com" do |email|
        check_element_path :xpath, TheTiebarIframe::CHAT_EMAIL_EP, TheTiebarIframe::CHAT_EMAIL_IL
        header_page.fill_chat_email  :ep, email
      end

      step "User fill message in chat modal", "test test test" do |message|
        check_element_path :xpath, TheTiebarIframe::CHAT_MESSAGE_EP, TheTiebarIframe::CHAT_MESSAGE_IL
        header_page.fill_chat_message :ep, message
      end

      step "User clicks start button in chat modal" do
        check_element_path :xpath, TheTiebarIframe::START_CHAT_BTN_EP, TheTiebarIframe::START_CHAT_BTN_IL
        header_page.click_start_chat_btn :ep
      end

      step "User click minimaze chat button" do
        check_element_path :xpath, TheTiebarIframe::MINIMAZE_CHAT_EP, TheTiebarIframe::MINIMAZE_CHAT_IL
        header_page.click_minimaze_chat :ep
      end

      sleep 3
    end

  end
end
