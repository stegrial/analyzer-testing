require_relative '../page_extension'

class ProductPage < PageExtension


  SIZE_LIST_IL = "(//span[@class='a-button-text a-declarative'])[1]"
  SIZE_LIST_TA = "amazon:product_page:size_list"

  SIZE_IL = "//ul[@class='a-nostyle a-list-link']/li[2]"
  SIZE_TA = "amazon:product_page:size"

  ADD_TO_CART_IL = "#add-to-cart-button"
  ADD_TO_CART_TA = "amazon:product_page:add_to_cart"


  def click_to_select_size_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SIZE_LIST_TA, il: SIZE_LIST_IL, check_path: $check_path).click
  end

  def should_see_size_btn(key = nil)
    element = find_element(key, il_type: :xpath, tl: SIZE_TA, il: SIZE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_for_add_to_cart(key = nil)
    find_element(key, il_type: :css, tl: ADD_TO_CART_TA, il: ADD_TO_CART_IL, check_path: $check_path).click
  end

end
