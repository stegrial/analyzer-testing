require_relative '../page_extension'

class TheTiebarCartPage < PageExtension

  PLUS_QUANTITY_CART_IL = "(//button[contains(@aria-label, 'subtract')])[1]"
  PLUS_QUANTITY_CART_TA = "thetiebar:cart_page:plus_quantity_cart"

  VIEW_CART_IL = "//a/p[text()='View Cart']"
  VIEW_CART_TA = "thetiebar:cart_page:view_cart"

  SUBTRACT_QUANTITY_IL = "(//button[@value='Subtract quantity'])[1]"
  SUBTRACT_QUANTITY_TA = "thetiebar:cart_page:subtract_quantity_minus"

  CHECKOUT_NOW_BTN_IL = "(//button[@title='Proceed To Checkout'])[1]"
  CHECKOUT_NOW_BTN_TA = "thetiebar:cart_page:checkout_now_btn"

  REMOVE_LINK_IL = "(//a[contains(text(), 'Remove')])[1]"
  REMOVE_LINK_TA = "thetiebar:cart_page:remove_link"

  REMOVE_LINK_FROM_CART_IL = "(//a[contains(@value, 'Remove from cart')])[1]/span[@class='tdu']"
  REMOVE_LINK_FROM_CART_TA = "thetiebar:cart_page:remove_from_cart_link"

  CHECKOUT_NOW_BTN_MODAL_IL = "//button[@data-th='checkout-link']"
  CHECKOUT_NOW_BTN_MODAL_TA = "thetiebar:cart_page:checkout_now_btn_in_modal"


  def click_plus_quantity_icon(key = nil)
    find_element(key, il_type: :xpath, tl: PLUS_QUANTITY_CART_TA, il: PLUS_QUANTITY_CART_IL, check_path: $check_path).click
  end

  def click_view_cart_link(key = nil)
    find_element(key, il_type: :xpath, tl: VIEW_CART_TA, il: VIEW_CART_IL, check_path: $check_path).click
  end

  def click_minus_quantity_icon(key = nil)
    find_element(key, il_type: :xpath, tl: SUBTRACT_QUANTITY_TA, il: SUBTRACT_QUANTITY_IL, check_path: $check_path).click
  end

  def click_checkout_now_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CHECKOUT_NOW_BTN_TA, il: CHECKOUT_NOW_BTN_IL, check_path: $check_path).click
  end

  def click_remove_link(key = nil)
    find_element(key, il_type: :xpath, tl: REMOVE_LINK_TA, il: REMOVE_LINK_IL, check_path: $check_path).click
  end

  def click_remove_link_from_cart_page(key = nil)
    find_element(key, il_type: :xpath, tl: REMOVE_LINK_FROM_CART_TA, il: REMOVE_LINK_FROM_CART_IL, check_path: $check_path).click
  end

  def click_checkout_now_btn_modal(key = nil)
    find_element(key, il_type: :xpath, tl: CHECKOUT_NOW_BTN_MODAL_TA, il: CHECKOUT_NOW_BTN_MODAL_IL, check_path: $check_path).click
  end

end
