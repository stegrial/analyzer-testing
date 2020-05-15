require 'spec_helper'
require_relative '../page_extension'

class AccessibilityInterfacePage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  ACCESSIBILITY_INTERFACE_IL = "//div[contains(@aria-label, 'Accessibility Interface')]"
  ACCESSIBILITY_INTERFACE_TA = "annieselke:accessibility_interface_page:accessibility_interface"

  LANGUAGE_IL = "//a[contains(@class, 'acsb-option-language')]"
  LANGUAGE_TA = "annieselke:accessibility_interface_page:language"

  ENGLISH_IL = "//span[contains(@data-acsb-language, 'en')]"
  ENGLISH_TA = "annieselke:accessibility_interface_page:english"

  HIDE_INTERFACE_IL = "//a[contains(@data-acsb-tooltip, 'Hide Interface')]"
  HIDE_INTERFACE_TA = "annieselke:accessibility_interface_page:hide_interface"

  CANCEL_BTN_IL = "//div[@class='acsb-buttons']/*[contains(text(), 'Cancel')]"
  CANCEL_BTN_TA = "annieselke:accessibility_interface_page:hide_interface"

  CHANGE_INTERFACE_POSITION_IL = "//a[contains(@aria-label, 'Change Interface Position')]"
  CHANGE_INTERFACE_POSITION_TA = "annieselke:accessibility_interface_page:change_interface_position"

  STOP_ANIMATIONS_IL = "//div[contains(@data-acsb-tooltip, 'Stop Animations')]"
  STOP_ANIMATIONS_TA = "annieselke:accessibility_interface_page:stop_animations"

  READABLE_FONT_IL = "//div[contains(@class, 'acsb-action-box-readableFont')]"
  READABLE_FONT_TA = "annieselke:accessibility_interface_page:readable_font"

  INVERT_CONTRAST_IL = "//div[contains(@class, 'acsb-action-box-invertContrast')]"
  INVERT_CONTRAST_TA = "annieselke:accessibility_interface_page:invert_contrast"

  FEEDBACK_IL = "//li[contains(@aria-label, 'Feedback')]"
  FEEDBACK_TA = "annieselke:accessibility_interface_page:feedback"

  FULL_NAME_IL = "//input[contains(@id, 'acsbForm_tmp[name]')]"
  FULL_NAME_TA = "annieselke:accessibility_interface_page:full_name"

  EMAIL_ADDRESS_IL = "//input[contains(@id, 'acsbForm_tmp[email]')]"
  EMAIL_ADDRESS_TA = "annieselke:accessibility_interface_page:email_address"

  PHONE_NUMBER_IL = "//input[contains(@id, 'acsbForm_tmp[phone]')]"
  PHONE_NUMBER_TA = "annieselke:accessibility_interface_page:phone_number"

  YOUR_FEEDBACK_IL = "//textarea[contains(@id, 'acsbForm_tmp[message]')]"
  YOUR_FEEDBACK_TA = "annieselke:accessibility_interface_page:your_feedback"

  SEND_FEEDBACK_BTN_IL = "//button[contains(@class, 'acsb-button-colorized')]"
  SEND_FEEDBACK_BTN_TA = "annieselke:accessibility_interface_page:send_feedback"

  CHECKBOX_AGREE_IL = "//input[contains(@id, 'acsbForm_tmp[agreement]')]"
  CHECKBOX_AGREE_TA = "annieselke:accessibility_interface_page:agreement"

  def click_accessibility_interface(key=nil)
    find_element_path(key, :xpath, ACCESSIBILITY_INTERFACE_TA, ACCESSIBILITY_INTERFACE_IL).click
    end

  def click_language(key=nil)
    find_element_path(key, :xpath, LANGUAGE_TA, LANGUAGE_IL).click
  end

  def click_english_language(key=nil)
    find_element_path(key, :xpath, ENGLISH_TA, ENGLISH_IL).click
  end

  def click_hide_interface(key=nil)
    find_element_path(key, :xpath, HIDE_INTERFACE_TA, HIDE_INTERFACE_IL).click
  end

  def click_cancel_btn(key=nil)
    find_element_path(key, :xpath, CANCEL_BTN_TA, CANCEL_BTN_IL).click
  end

  def click_change_interface_position(key=nil)
    find_element_path(key, :xpath, CHANGE_INTERFACE_POSITION_TA, CHANGE_INTERFACE_POSITION_IL).click
  end

  def click_stop_animations(key=nil)
    find_element_path(key, :xpath, STOP_ANIMATIONS_TA, STOP_ANIMATIONS_IL).click
  end

  def click_readable_font(key=nil)
    find_element_path(key, :xpath, READABLE_FONT_TA, READABLE_FONT_IL).click
  end

  def click_invert_contrast(key=nil)
    find_element_path(key, :xpath, INVERT_CONTRAST_TA, INVERT_CONTRAST_IL).click
  end

  def click_feedback(key=nil)
    find_element_path(key, :xpath, FEEDBACK_TA, FEEDBACK_IL).click
  end

  def fill_full_name(key = nil, value)
    find_element_path(key, :xpath, FULL_NAME_TA, FULL_NAME_IL).set(value)
  end

  def fill_email_address(key = nil, value)
    find_element_path(key, :xpath, EMAIL_ADDRESS_TA, EMAIL_ADDRESS_IL).set(value)
  end

  def fill_phone_number(key = nil, value)
    find_element_path(key, :xpath, PHONE_NUMBER_TA, PHONE_NUMBER_IL).set(value)
    end

  def fill_your_feedback(key = nil, value)
    find_element_path(key, :xpath, YOUR_FEEDBACK_TA, YOUR_FEEDBACK_IL).set(value)
    end

  def click_agreement_checkbox(key = nil)
    find_element_path(key, :xpath, CHECKBOX_AGREE_TA, CHECKBOX_AGREE_IL).click
    end

  def click_send_feedback(key = nil)
    find_element_path(key, :xpath, SEND_FEEDBACK_BTN_TA, SEND_FEEDBACK_BTN_IL).click
  end

end

