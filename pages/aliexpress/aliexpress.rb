require 'spec_helper'
require_relative '../page_extension'


class AliexpressPage

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  PHONES_LINK_IL = "(//a[contains(@href, 'telecommunications')])[1]"
  PHONES_LINK_TA = "aliexpress:left_sidebar:phone_link"
  PHONES_LINK_EP = "EP:aliexpress:left_sidebar:phone_link"

  ELECTRONICS_LINK_IL = "(//a[contains(@href, 'electronics')])[1]"
  ELECTRONICS_LINK_TA = "aliexpress:left_sidebar:electronics_link"
  ELECTRONICS_LINK_EP = "EP:aliexpress:left_sidebar:electronics_link"

  CLOSE_MODAL_IL = "//a[@class='close-layer']"
  CLOSE_MODAL_TA = "aliexpress:left_sidebar:close_modal"
  CLOSE_MODAL_EP = "EP:aliexpress:left_sidebar:close_modal"

  def click_x_to_close_modal(key = nil)
    post_processing key do
      return find(ta(CLOSE_MODAL_EP)).click if key == :ep
      return find(:xpath, CLOSE_MODAL_IL).click if key == :il
      find(:xpath, ta(CLOSE_MODAL_TA, CLOSE_MODAL_IL)).click
    end
  end

  def click_phone_link_sidebar(key = nil)
    post_processing key do
      return find(ta(PHONES_LINK_EP)).hover if key == :ep
      return find(:xpath, PHONES_LINK_IL).hover if key == :il
      find(:xpath, ta(PHONES_LINK_TA, PHONES_LINK_IL)).hover
    end
  end

  def click_electronics_link_sidebar(key = nil)
    post_processing key do
      return find(ta(ELECTRONICS_LINK_EP)).hover if key == :ep
      return find(:xpath, ELECTRONICS_LINK_IL).hover if key == :il
      find(:xpath, ta(ELECTRONICS_LINK_TA, ELECTRONICS_LINK_IL)).hover
    end
  end


end