require 'spec_helper'

class TheTiebarGiftCartPage

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  AMOUNT_100_IL = "//span[text()='$100']"
  AMOUNT_100_TA = "thetiebar:gifr_page:100bucks"
  AMOUNT_100_EP = "EP:thetiebar:gifr_page:100bucks"

  CUSTOM_AMOUNT_IL = "//span[text()='Custom']"
  CUSTOM_AMOUNT_TA = "thetiebar:gifr_page:custom"
  CUSTOM_AMOUNT_EP = "EP:thetiebar:gifr_page:custom"

  CUSTOM_INPUT_IL = "//input[@placeholder='$']"
  CUSTOM_INPUT_TA = "thetiebar:gifr_page:custom_input"
  CUSTOM_INPUT_EP = "EP:thetiebar:gifr_page:custom_input"

  SENDER_NAME_IL = "//input[@id='gcSenderName']"
  SENDER_NAME_TA = "thetiebar:gifr_page:sender_name"
  SENDER_NAME_EP = "EP:thetiebar:gifr_page:sender_name"

  RECIPIENT_NAME_IL = "//input[@id='gcRecipientName']"
  RECIPIENT_NAME_TA = "thetiebar:gifr_page:recipient_name"
  RECIPIENT_NAME_EP = "EP:thetiebar:gifr_page:recipient_name"

  RECIPIENT_EMAIL_IL = "//input[@id='gcRecipientEmail']"
  RECIPIENT_EMAIL_TA = "thetiebar:gifr_page:recipient_email"
  RECIPIENT_EMAIL_EP = "EP:thetiebar:gifr_page:recipient_email"

  GIFT_MESSAGE_IL = "//textarea[@id='giftMessage']"
  GIFT_MESSAGE_TA = "thetiebar:gifr_page:gift_message"
  GIFT_MESSAGE_EP = "EP:thetiebar:gifr_page:gift_message"

  ADD_E_GIFT_CART_IL = "//div[contains(@class,'buttonInner')]"
  ADD_E_GIFT_CART_TA = "thetiebar:gifr_page:add_e_gift_card"
  ADD_E_GIFT_CART_EP = "EP:thetiebar:gifr_page:add_e_gift_card"

  def click_amount_100(key = nil)
    return find(ta(AMOUNT_100_EP)).click if key == :ep
    return find(:xpath, AMOUNT_100_IL).click if key == :il
    find(:xpath, ta(AMOUNT_100_TA, AMOUNT_100_IL)).click
  end

  def click_custom_amount(key = nil)
    return find(ta(CUSTOM_AMOUNT_EP)).click if key == :ep
    return find(:xpath, CUSTOM_AMOUNT_IL).click if key == :il
    find(:xpath, ta(CUSTOM_AMOUNT_TA, CUSTOM_AMOUNT_IL)).click
  end

  def fill_custom_input_field(key = nil, value)
    return find(ta(CUSTOM_INPUT_EP)).set(value) if key == :ep
    return find(:xpath, CUSTOM_INPUT_IL).set(value) if key == :il
    find(:xpath, ta(CUSTOM_INPUT_TA, CUSTOM_INPUT_IL)).set(value)
  end

  def fill_sender_name(key = nil, value)
    return find(ta(SENDER_NAME_EP)).set(value) if key == :ep
    return find(:xpath, SENDER_NAME_IL).set(value) if key == :il
    find(:xpath, ta(SENDER_NAME_TA, SENDER_NAME_IL)).set(value)
  end

  def fill_recipient_name(key = nil, value)
    return find(ta(RECIPIENT_NAME_EP)).set(value) if key == :ep
    return find(:xpath, RECIPIENT_NAME_IL).set(value) if key == :il
    find(:xpath, ta(RECIPIENT_NAME_TA, RECIPIENT_NAME_IL)).set(value)
  end

  def fill_recipient_email(key = nil, value)
    return find(ta(RECIPIENT_EMAIL_EP)).set(value) if key == :ep
    return find(:xpath, RECIPIENT_EMAIL_IL).set(value) if key == :il
    find(:xpath, ta(RECIPIENT_EMAIL_TA, RECIPIENT_EMAIL_IL)).set(value)
  end

  def fill_gift_message(key = nil, value)
    return find(ta(GIFT_MESSAGE_EP)).set(value) if key == :ep
    return find(:xpath, GIFT_MESSAGE_IL).set(value) if key == :il
    find(:xpath, ta(GIFT_MESSAGE_TA, GIFT_MESSAGE_IL)).set(value)
  end

  def click_add_e_gift_card(key = nil)
    return find(ta(ADD_E_GIFT_CART_EP)).click if key == :ep
    return find(:xpath, ADD_E_GIFT_CART_IL).click if key == :il
    find(:xpath, ta(ADD_E_GIFT_CART_TA, ADD_E_GIFT_CART_IL)).click
  end

end