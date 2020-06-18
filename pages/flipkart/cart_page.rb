require_relative '../page_extension'

class CartPageFlipkart < PageExtension


  MY_CART_IL = "(//div[contains(text(), 'My Cart')])[1]"
  MY_CART_TA = "flipkart:cart_page:my_cart"


  def should_see_my_cart(key = nil)
    element = find_element(key, il_type: :xpath, tl: MY_CART_TA, il: MY_CART_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end