require 'spec_helper'
require_relative '../page_extension'

class Modal

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  CLOSE_DISCOUNT_BUTTON_IL = "(//*[text()=\"Want 20% Off?\"]//ancestor::div[contains(@class, 'klaviyo-form')]//button)[1]"
  CLOSE_DISCOUNT_BUTTON_TA = "planetblue:modal:close_discount_button"

  def click_close_discount_button(key = nil)
    find_element_path(key, :xpath, CLOSE_DISCOUNT_BUTTON_TA, CLOSE_DISCOUNT_BUTTON_IL).click
  end

  CLOSE_POLICIES_BUTTON_IL = "(//*[text()=\"We've Updated Our Policies\"]//ancestor::div[contains(@class, 'klaviyo-form')]//button)[1]"
  CLOSE_POLICIES_BUTTON_TA = "planetblue:modal:close_policies_button"

  def click_close_policies_button(key = nil)
    if find(:xpath, CLOSE_POLICIES_BUTTON_IL).visible?
      find_element_path(key, :xpath, CLOSE_POLICIES_BUTTON_TA, CLOSE_POLICIES_BUTTON_IL).click
    end
  end

end