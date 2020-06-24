require_relative '../page_extension'

class ProductPageFlipkart < PageExtension


  PRODUCT_NAME_H1_IL = "//h1/span[@class='_35KyD6']"
  PRODUCT_NAME_H1_TA = "flipkart:product_page:product_name"

  PRICE_OF_PRODUCT_IL = "//div[@class='_1vC4OE _3qQ9m1']"
  PRICE_OF_PRODUCT_TA = "flipkart:product_page:product_price"

  AVAILABLE_OFFERS_IL = "//div[text()='Available offers']"
  AVAILABLE_OFFERS_TA = "flipkart:product_page:available_offers"

  COLOR_BTN_IL = "(//div[@class='_2fXpRR _2RncVR _2UBURg'])[2]"
  COLOR_BTN_TA = "flipkart:product_page:product_color"

  SIZE_BTN_IL = "(//a[@class='_1TJldG _2I_hq9 _2UBURg'])[1]"
  SIZE_BTN_TA = "flipkart:product_page:product_size"

  PRODUCT_DETAILS_IL = "(//div[text()='Product Details'])[1]"
  PRODUCT_DETAILS_TA = "flipkart:product_page:product_details"

  ADD_TO_CART_IL = "//button[@class='_2AkmmA _2Npkh4 _2MWPVK']"
  ADD_TO_CART_TA = "flipkart:product_page:add_to_cart"


  def should_see_product_name(key = nil)
    element = find_element(key, il_type: :xpath, tl: PRODUCT_NAME_H1_TA, il: PRODUCT_NAME_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_product_price(key = nil)
    element = find_element(key, il_type: :xpath, tl: PRICE_OF_PRODUCT_TA, il: PRICE_OF_PRODUCT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_available_offers(key = nil)
    if page.has_xpath?("//div[text()='Available offers']")
      element = find_element(key, il_type: :xpath, tl: AVAILABLE_OFFERS_TA, il: AVAILABLE_OFFERS_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_to_choose_color(key = nil)
    if page.has_xpath?("(//div[@class='_2fXpRR _2RncVR _2UBURg'])[2]")
      find_element(key, il_type: :xpath, tl: COLOR_BTN_TA, il: COLOR_BTN_IL, check_path: $check_path).click
    end
  end

  def click_to_choose_size(key = nil)
    if page.has_xpath?("(//a[@class='_1TJldG _2I_hq9 _2UBURg'])[1]")
      find_element(key, il_type: :xpath, tl: SIZE_BTN_TA, il: SIZE_BTN_IL, check_path: $check_path).click
    end
  end

  def click_add_to_cart(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_CART_TA, il: ADD_TO_CART_IL, check_path: $check_path).click
  end
end
