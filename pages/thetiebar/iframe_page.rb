require 'spec_helper'

class TheTiebarIframe
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers


  HELP_CHAT_BTN_IL = "//div[contains(text(), 'Chat Us')]"
  HELP_CHAT_BTN_TA = "thetiebar:iframe:help_chat"
  HELP_CHAT_BTN_EP = "EP:thetiebar:iframe:help_chat"

  CHAT_NAME_IL = "(//input[contains(@id, 'garden-field-container')])[1]"
  CHAT_NAME_TA = "thetiebar:iframe:chat_name"
  CHAT_NAME_EP = "EP:thetiebar:iframe:chat_name"

  CHAT_EMAIL_IL = "(//input[contains(@id, 'garden-field-container')])[2]"
  CHAT_EMAIL_TA = "thetiebar:iframe:chat_email"
  CHAT_EMAIL_EP = "EP:thetiebar:iframe:chat_email"

  CHAT_MESSAGE_IL = "(//textarea[contains(@aria-labelledby, 'garden-field-container')])[1]"
  CHAT_MESSAGE_TA = "thetiebar:iframe:chat_message"
  CHAT_MESSAGE_EP = "EP:thetiebar:iframe:chat_message"

  START_CHAT_BTN_IL = "//button[contains(@class, 'button-bx6AA')]"
  START_CHAT_BTN_TA = "thetiebar:iframe:start_chat"
  START_CHAT_BTN_EP = "EP:thetiebar:iframe:start_chat"

  MINIMAZE_CHAT_IL = "(//button[contains(@class, 'IconButton')])[1]"
  MINIMAZE_CHAT_TA = "thetiebar:iframe:minimaze_chat"
  MINIMAZE_CHAT_EP = "EP:thetiebar:iframe:minimaze_chat"


  def click_help_chat(key = nil)
    return find(ta(HELP_CHAT_BTN_EP)).click if key == :ep
    return find(:xpath, HELP_CHAT_BTN_IL).click if key == :il
    find(:xpath, ta(HELP_CHAT_BTN_TA, HELP_CHAT_BTN_IL)).click
  end

  def fill_chat_name(key = nil, value)
    within_frame(0) do
      return find(ta(CHAT_NAME_EP)).set(value) if key == :ep
      return find(:xpath, CHAT_NAME_IL).set(value) if key == :il
      find(:xpath, ta(CHAT_NAME_TA, CHAT_NAME_IL)).set(value)
    end
  end

  def fill_chat_email(key = nil, value)
    within_frame(0) do
      return find(ta(CHAT_EMAIL_EP)).set(value) if key == :ep
      return find(:xpath, CHAT_EMAIL_IL).set(value) if key == :il
      find(:xpath, ta(CHAT_EMAIL_TA, CHAT_EMAIL_IL)).set(value)
    end
  end

  def fill_chat_message(key = nil, value)
    within_frame(0) do
      return find(ta(CHAT_MESSAGE_EP)).set(value) if key == :ep
      return find(:xpath, CHAT_MESSAGE_IL).set(value) if key == :il
      find(:xpath, ta(CHAT_MESSAGE_TA, CHAT_MESSAGE_IL)).set(value)
    end
  end

  def click_start_chat_btn(key = nil)
    within_frame(0) do
      return find(ta(START_CHAT_BTN_EP)).click if key == :ep
      return find(:xpath, START_CHAT_BTN_IL).click if key == :il
      find(:xpath, ta(START_CHAT_BTN_TA, START_CHAT_BTN_IL)).click
    end
  end

  def click_minimaze_chat(key = nil)
    within_frame(0) do
      return find(ta(MINIMAZE_CHAT_EP)).click if key == :ep
      return find(:xpath, MINIMAZE_CHAT_IL).click if key == :il
      find(:xpath, ta(MINIMAZE_CHAT_TA, MINIMAZE_CHAT_IL)).click
    end
  end

end