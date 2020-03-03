require 'spec_helper'
require_relative '../page_extension'

class VenusCart
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  REMOVE_ADD_TO_BAG_BTN_IL = "//input[@value='Remove']"
  REMOVE_ADD_TO_BAG_BTN_TA = "venus:cart_page:remove_add_to_bag_btn"
  REMOVE_ADD_TO_BAG_BTN_EP = "EP:venus:cart_page:remove_add_to_bag_btn"


  def click_remove_item_from_bag(key = nil)
    post_processing key do
      return find(ta(REMOVE_ADD_TO_BAG_BTN_EP)).click if key == :ep
      return find(:xpath, REMOVE_ADD_TO_BAG_BTN_IL).click if key == :il
      find(:xpath, ta(REMOVE_ADD_TO_BAG_BTN_TA, REMOVE_ADD_TO_BAG_BTN_IL)).click
    end
  end

end