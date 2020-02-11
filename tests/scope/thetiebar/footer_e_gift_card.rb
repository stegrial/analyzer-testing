require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

gift_cart_page = TheTiebarGiftCartPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Footer: E-GIFT CARD' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('thetiebar')['gift_cart_page'] do |url|
        page.visit url
      end

      step "User  select $100 amount button" do
        gift_cart_page.click_amount_100
      end

      step "User  select custom amount button" do
        gift_cart_page.click_custom_amount
      end

      step "User fill custom input field", "80" do |value|
        gift_cart_page.fill_custom_input_field value
      end

      step "User fill sender name field", "test_name" do |name|
        gift_cart_page.fill_sender_name name
      end

      step "User fill recipient name field", "test_name" do |name|
        gift_cart_page.fill_recipient_name name
      end

      step "User fill  recipient email field", "testemail@gmail.com" do |email|
        gift_cart_page.fill_recipient_email email
      end

      step "User fill gift message field", "test text"  do |message|
        gift_cart_page.fill_gift_message message
      end

      step "User fill add e-gift card button" do
        gift_cart_page.click_add_e_gift_card
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['gift_cart_page'] do |url|
        page.visit url
      end

      step "User  select $100 amount button" do
        check_element_path :xpath, TheTiebarGiftCartPage::AMOUNT_100_TA, TheTiebarGiftCartPage::AMOUNT_100_IL
        gift_cart_page.click_amount_100
      end

      step "User  select custom amount button" do
        check_element_path :xpath, TheTiebarGiftCartPage::CUSTOM_AMOUNT_TA, TheTiebarGiftCartPage::CUSTOM_AMOUNT_IL
        gift_cart_page.click_custom_amount
      end

      step "User fill custom input field", "80" do |value|
        check_element_path :xpath, TheTiebarGiftCartPage::CUSTOM_INPUT_TA, TheTiebarGiftCartPage::CUSTOM_INPUT_IL
        gift_cart_page.fill_custom_input_field value
      end

      step "User fill sender name field", "test_name" do |name|
        check_element_path :xpath, TheTiebarGiftCartPage::SENDER_NAME_TA, TheTiebarGiftCartPage::SENDER_NAME_IL
        gift_cart_page.fill_sender_name name
      end

      step "User fill recipient name field", "test_name" do |name|
        check_element_path :xpath, TheTiebarGiftCartPage::RECIPIENT_NAME_TA, TheTiebarGiftCartPage::RECIPIENT_NAME_IL
        gift_cart_page.fill_recipient_name name
      end

      step "User fill  recipient email field", "testemail@gmail.com" do |email|
        check_element_path :xpath, TheTiebarGiftCartPage::RECIPIENT_EMAIL_TA, TheTiebarGiftCartPage::RECIPIENT_EMAIL_IL
        gift_cart_page.fill_recipient_email email
      end

      step "User fill gift message field", "test text"  do |message|
        check_element_path :xpath, TheTiebarGiftCartPage::GIFT_MESSAGE_TA, TheTiebarGiftCartPage::GIFT_MESSAGE_IL
        gift_cart_page.fill_gift_message message
      end

      step "User fill add e-gift card button" do
        check_element_path :xpath, TheTiebarGiftCartPage::ADD_E_GIFT_CART_TA, TheTiebarGiftCartPage::ADD_E_GIFT_CART_IL
        gift_cart_page.click_add_e_gift_card
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do


      step "User goes to the page", settings('thetiebar')['gift_cart_page'] do |url|
        page.visit url
      end

      step "User  select $100 amount button" do
        check_element_path :xpath, TheTiebarGiftCartPage::AMOUNT_100_EP, TheTiebarGiftCartPage::AMOUNT_100_IL
        gift_cart_page.click_amount_100 :ep
      end

      step "User  select custom amount button" do
        check_element_path :xpath, TheTiebarGiftCartPage::CUSTOM_AMOUNT_EP, TheTiebarGiftCartPage::CUSTOM_AMOUNT_IL
        gift_cart_page.click_custom_amount :ep
      end

      step "User fill custom input field", "80" do |value|
        check_element_path :xpath, TheTiebarGiftCartPage::CUSTOM_INPUT_EP, TheTiebarGiftCartPage::CUSTOM_INPUT_IL
        gift_cart_page.fill_custom_input_field :ep, value
      end

      step "User fill sender name field", "test_name" do |name|
        check_element_path :xpath, TheTiebarGiftCartPage::SENDER_NAME_EP, TheTiebarGiftCartPage::SENDER_NAME_IL
        gift_cart_page.fill_sender_name :ep, name
      end

      step "User fill recipient name field", "test_name" do |name|
        check_element_path :xpath, TheTiebarGiftCartPage::RECIPIENT_NAME_EP, TheTiebarGiftCartPage::RECIPIENT_NAME_IL
        gift_cart_page.fill_recipient_name :ep, name
      end

      step "User fill  recipient email field", "testemail@gmail.com" do |email|
        check_element_path :xpath, TheTiebarGiftCartPage::RECIPIENT_EMAIL_EP, TheTiebarGiftCartPage::RECIPIENT_EMAIL_IL
        gift_cart_page.fill_recipient_email :ep, email
      end

      step "User fill gift message field", "test text"  do |message|
        check_element_path :xpath, TheTiebarGiftCartPage::GIFT_MESSAGE_EP, TheTiebarGiftCartPage::GIFT_MESSAGE_IL
        gift_cart_page.fill_gift_message :ep, message
      end

      step "User fill add e-gift card button" do
        check_element_path :xpath, TheTiebarGiftCartPage::ADD_E_GIFT_CART_EP, TheTiebarGiftCartPage::ADD_E_GIFT_CART_IL
        gift_cart_page.click_add_e_gift_card :ep
      end

    end
  end
end