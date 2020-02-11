require 'spec_helper'
require_relative '../../helpers/special_methods'

class VenusWishList
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  PRODUCT_SIZE_IL = "//span[contains(@id,'ProductSize')]"
  PRODUCT_SIZE_TA = "venus:wish_list_page:product_size"
  PRODUCT_SIZE_EP = "EP:venus:wish_list_page:product_size"

  REMOVE_WISH_LIST_BTN_IL = "//a[text()='Remove']"
  REMOVE_WISH_LIST_BTN_TA = "venus:wish_list_page:remove_wish_list_btn"
  REMOVE_WISH_LIST_BTN_EP = "EP:venus:wish_list_page:remove_wish_list_btn"


  def observe_product_size(key = nil)
    post_processing key do
      return find(ta(PRODUCT_SIZE_EP)) if key == :ep
      return find(:xpath, PRODUCT_SIZE_IL) if key == :il
      find(:xpath, ta(PRODUCT_SIZE_TA, PRODUCT_SIZE_IL))
    end
  end

  def click_remove_wish_list(key = nil)
    post_processing key do
      return find(ta(REMOVE_WISH_LIST_BTN_EP)).click if key == :ep
      return find(:xpath, REMOVE_WISH_LIST_BTN_IL).click if key == :il
      find(:xpath, ta(REMOVE_WISH_LIST_BTN_TA, REMOVE_WISH_LIST_BTN_IL)).click
    end
  end

end