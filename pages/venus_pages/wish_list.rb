require 'spec_helper'

class VenusWishList
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  PRODUCT_SIZE_IL = "//span[contains(@id,'ProductSize')]"
  PRODUCT_SIZE_TA = "venus:product:product_size"
  PRODUCT_SIZE_EP = "EP:venus:product:product_size"

  REMOVE_WISH_LIST_BTN_IL = "//a[text()='Remove']"
  REMOVE_WISH_LIST_BTN_TA = "venus:product:remove_wish_list_btn"
  REMOVE_WISH_LIST_BTN_EP = "EP:venus:product:remove_wish_list_btn"


  def observe_product_size(key = nil)
    return find(ta(PRODUCT_SIZE_EP)) if key == :ep
    return find(:xpath, PRODUCT_SIZE_IL) if key == :il
    find(:xpath, ta(PRODUCT_SIZE_TA, PRODUCT_SIZE_IL))
  end

  def click_remove_wish_list(key = nil)
    return find(ta(REMOVE_WISH_LIST_BTN_EP)).click if key == :ep
    return find(:xpath, REMOVE_WISH_LIST_BTN_IL).click if key == :il
    find(:xpath, ta(REMOVE_WISH_LIST_BTN_TA, REMOVE_WISH_LIST_BTN_IL)).click
  end

end