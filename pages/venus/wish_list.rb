require 'spec_helper'
require_relative '../page_extension'

class VenusWishList < PageExtension

  PRODUCT_SIZE_IL = "//span[contains(@id,'ProductSize')]"
  PRODUCT_SIZE_TA = "venus:wish_list_page:product_size"

  REMOVE_WISH_LIST_BTN_IL = "//a[text()='Remove item']"
  REMOVE_WISH_LIST_BTN_TA = "venus:wish_list_page:remove_wish_list_btn"


  def should_see_product_size(key = nil)
    post_processing key do
      element = find_element(key, il_type: :xpath, tl: PRODUCT_SIZE_TA, il: PRODUCT_SIZE_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_remove_wish_list(key = nil)
    post_processing key do
      find_element(key, il_type: :xpath, tl: PRODUCT_SIZE_TA, il: PRODUCT_SIZE_IL, check_path: $check_path).click
    end
  end

end