require_relative '../page_extension'

class CheckoutPageWalmart < PageExtension


  CHECKOUT_TEXT_IL = "//div[@class='checkout-text']"
  CHECKOUT_TEXT_TA = "walmart:cart_page:checkout_text"


  def should_see_checkout_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: CHECKOUT_TEXT_TA, il: CHECKOUT_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end