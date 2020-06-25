require_relative '../page_extension'

class CartPageWalmart < PageExtension


  YOUR_CART_IL = "#cart-active-cart-heading"
  YOUR_CART_TA = "walmart:cart_page:your_cart_h1"

  CHECKOUT_BTN_IL = "(//button[@data-tl-id='CartCheckOutBtnBottom'])[1]"
  CHECKOUT_BTN_TA = "walmart:cart_page:checkout_btn"


  def should_see_your_cart_h1(key = nil)
    element = find_element(key, il_type: :css, tl: YOUR_CART_TA, il: YOUR_CART_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_checkout_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CHECKOUT_BTN_TA, il: CHECKOUT_BTN_IL, check_path: $check_path).click
  end
end