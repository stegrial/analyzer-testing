require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
ai_page = AccessibilityInterfacePage.new
banner_page = BannerPage.new


describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Navigation and adding product to cart' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
      end

      step "Close banners" do
        banner_page.close_banner
        banner_page.close_cupon_banner
      end

      step "User clicks accessibility interface button" do
        ai_page.click_accessibility_interface
      end

      step "User clicks language" do
        ai_page.click_language
      end

      step "User clicks english language" do
        ai_page.click_english_language
      end

      step "User clicks hide interface button" do
        ai_page.click_hide_interface
      end

      step "User clicks cancel button" do
        ai_page.click_cancel_btn
      end

      step "Close banners" do
        banner_page.close_cupon_banner
      end

      step "User clicks change interface position" do
        ai_page.click_change_interface_position
      end

      step "User clicks stop animations" do
        ai_page.click_stop_animations
      end

      step "User clicks readable font button" do
        ai_page.click_readable_font
      end

      step "User clicks invert contrast" do
        ai_page.click_invert_contrast
      end

      step "User clicks feedback button" do
        ai_page.click_feedback
      end

      step "User clicks", "test_name" do |value|
        ai_page.fill_full_name (value)
      end

      step "User clicks", "test@email.com" do |value|
        ai_page.fill_email_address (value)
      end

      step "User clicks", "380911234567" do |value|
        ai_page.fill_phone_number (value)
      end

      step "User clicks", "test text" do |value|
        ai_page.fill_your_feedback (value)
      end

      step "User clicks" do
        ai_page.click_agreement_checkbox
        end

      step "User clicks" do
        ai_page.click_send_feedback
      end
    end

    scenario 'Searching IL', search: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
      end

      step "Close banners" do
        banner_page.close_banner
        banner_page.close_cupon_banner
      end

      step "User clicks accessibility interface button" do
        check_element_path :xpath, AccessibilityInterfacePage::ACCESSIBILITY_INTERFACE_TA, AccessibilityInterfacePage::ACCESSIBILITY_INTERFACE_IL
        ai_page.click_accessibility_interface
      end

      step "User clicks language" do
        check_element_path :xpath, AccessibilityInterfacePage::LANGUAGE_TA, AccessibilityInterfacePage::LANGUAGE_IL
        ai_page.click_language
      end

      step "User clicks english language" do
        check_element_path :xpath, AccessibilityInterfacePage::ENGLISH_TA, AccessibilityInterfacePage::ENGLISH_IL
        ai_page.click_english_language
      end

      step "User clicks hide interface button" do
        check_element_path :xpath, AccessibilityInterfacePage::HIDE_INTERFACE_TA, AccessibilityInterfacePage::HIDE_INTERFACE_IL
        ai_page.click_hide_interface
      end

      step "User clicks cancel button" do
        check_element_path :xpath, AccessibilityInterfacePage::CANCEL_BTN_TA, AccessibilityInterfacePage::CANCEL_BTN_IL
        ai_page.click_cancel_btn
      end

      step "Close banners" do
        banner_page.close_cupon_banner
      end

      step "User clicks change interface position" do
        check_element_path :xpath, AccessibilityInterfacePage::CHANGE_INTERFACE_POSITION_TA, AccessibilityInterfacePage::CHANGE_INTERFACE_POSITION_IL
        ai_page.click_change_interface_position
      end

      step "User clicks stop animations" do
        check_element_path :xpath, AccessibilityInterfacePage::STOP_ANIMATIONS_TA, AccessibilityInterfacePage::STOP_ANIMATIONS_IL
        ai_page.click_stop_animations
      end

      step "User clicks readable font button" do
        check_element_path :xpath, AccessibilityInterfacePage::READABLE_FONT_TA, AccessibilityInterfacePage::READABLE_FONT_IL
        ai_page.click_readable_font
      end

      step "User clicks invert contrast" do
        check_element_path :xpath, AccessibilityInterfacePage::INVERT_CONTRAST_TA, AccessibilityInterfacePage::INVERT_CONTRAST_IL
        ai_page.click_invert_contrast
      end

      step "User clicks feedback button" do
        check_element_path :xpath, AccessibilityInterfacePage::FEEDBACK_TA, AccessibilityInterfacePage::FEEDBACK_IL
        ai_page.click_feedback
      end

      step "User clicks", "test_name" do |value|
        check_element_path :xpath, AccessibilityInterfacePage::FULL_NAME_TA, AccessibilityInterfacePage::FULL_NAME_IL
        ai_page.fill_full_name (value)
      end

      step "User clicks", "test@email.com" do |value|
        check_element_path :xpath, AccessibilityInterfacePage::EMAIL_ADDRESS_TA, AccessibilityInterfacePage::EMAIL_ADDRESS_IL
        ai_page.fill_email_address (value)
      end

      step "User clicks", "380911234567" do |value|
        check_element_path :xpath, AccessibilityInterfacePage::PHONE_NUMBER_TA, AccessibilityInterfacePage::PHONE_NUMBER_IL
        ai_page.fill_phone_number (value)
      end

      step "User clicks", "test text" do |value|
        check_element_path :xpath, AccessibilityInterfacePage::YOUR_FEEDBACK_TA, AccessibilityInterfacePage::YOUR_FEEDBACK_IL
        ai_page.fill_your_feedback (value)
      end

      step "User clicks" do
        check_element_path :xpath, AccessibilityInterfacePage::CHECKBOX_AGREE_TA, AccessibilityInterfacePage::CHECKBOX_AGREE_IL
        ai_page.click_agreement_checkbox
      end

      step "User clicks" do
        check_element_path :xpath, AccessibilityInterfacePage::SEND_FEEDBACK_BTN_TA, AccessibilityInterfacePage::SEND_FEEDBACK_BTN_IL
        ai_page.click_send_feedback
      end
    end
  end
end
