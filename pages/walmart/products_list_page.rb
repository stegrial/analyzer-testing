require_relative '../page_extension'

class ProductsListPageWalmart < PageExtension


  UNISEX_IL = "//span[text()='Unisex']"
  UNISEX_TA = "walmart:page:unisex_gender"

  FREE_PICKUP_IL = "(//span[contains(.,'Free pickup')]/span)[1]"
  FREE_PICKUP_TA = "walmart:page:purees"

  ADD_TO_CART_IL = "(//button[contains(@aria-label, 'Add to cart')])[2]"
  ADD_TO_CART_TA = "walmart:page:add_to_cart"

  SORTING_BY_PRICE_RANGE_IL = "//button[@data-automation-id='util-bar-price']"
  SORTING_BY_PRICE_RANGE_TA = "walmart:page:sorting_by_price_range"

  MIN_PRICE_OF_SORTING_IL = "//div[@class='desktop-bar-left']//input[@name='minPrice']"
  MIN_PRICE_OF_SORTING_TA = "walmart:page:min_prise_of_sorting"

  MAX_PRICE_OF_SORTING_IL = "//div[@class='desktop-bar-left']//input[@name='maxPrice']"
  MAX_PRICE_OF_SORTING_TA = "walmart:page:max_prise_of_sorting"

  GO_LINK_IL = "//div[@class='desktop-bar-left']//button[@data-automation-id='price-submit-button']"
  GO_LINK_TA = "walmart:page:go_link"

  SORT_BY_TOP_BRANDS_IL = "//div[@class='desktop-bar-left']//button[@data-automation-id='util-bar-top-brand']"
  SORT_BY_TOP_BRANDS_TA = "walmart:page:sort_by_top_brands"

  BRAND_IL = "//div[@class='desktop-bar-left']//div[@data-automation-id='search-util-bar-brand-2']"
  BRAND_TA = "walmart:page:select_brand"

  SORTING_BY_PRICE_IL = "//select[@data-automation-id='utilbar-sort-filter']"
  SORTING_BY_PRICE_TA = "walmart:page:sort_by_price"

  PRICE_LOW_HIGH_IL= "//option[@data-automation-id='sort-1']"
  PRICE_LOW_HIGH_TA= "walmart:page:price_low_to_high"

  CLEAR_ALL_IL = "button.clear-all"
  CLEAR_ALL_TA =  "walmart:page:clear_all_button"


  def click_gender_unisex(key = nil)
    find_element(key, il_type: :xpath, tl: UNISEX_TA, il: UNISEX_IL, check_path: $check_path).click
  end

  def click_free_pickup(key = nil)
    find_element(key, il_type: :xpath, tl: FREE_PICKUP_TA, il: FREE_PICKUP_IL, check_path: $check_path).click
  end

  def click_to_add_product_to_cart(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_CART_TA, il: ADD_TO_CART_IL, check_path: $check_path).click
  end

  def click_filter_by_price_range(key = nil)
    find_element(key, il_type: :xpath, tl: SORTING_BY_PRICE_RANGE_TA, il: SORTING_BY_PRICE_RANGE_IL, check_path: $check_path).click
  end

  def fill_min_prise_of_sorting(key = nil, value)
    find_element(key, il_type: :xpath, tl: MIN_PRICE_OF_SORTING_TA, il: MIN_PRICE_OF_SORTING_IL, check_path: $check_path).set(value)
  end

  def fill_max_prise_of_sorting(key = nil, value)
    find_element(key, il_type: :xpath, tl: MAX_PRICE_OF_SORTING_TA, il: MAX_PRICE_OF_SORTING_IL, check_path: $check_path).set(value)
  end

  def click_go_link(key = nil)
    find_element(key, il_type: :xpath, tl: GO_LINK_TA, il: GO_LINK_IL, check_path: $check_path).click
  end

  def click_filter_by_top_brands(key = nil)
    find_element(key, il_type: :xpath, tl: SORT_BY_TOP_BRANDS_TA, il: SORT_BY_TOP_BRANDS_IL, check_path: $check_path).click
  end

  def click_to_select_brand(key = nil)
    find_element(key, il_type: :xpath, tl: BRAND_TA, il: BRAND_IL, check_path: $check_path).click
    end

  def click_sort_by_price(key = nil)
    find_element(key, il_type: :xpath, tl: SORTING_BY_PRICE_TA, il: SORTING_BY_PRICE_IL, check_path: $check_path).click
  end

  def click_price_low_to_high(key = nil)
    find_element(key, il_type: :xpath, tl: PRICE_LOW_HIGH_TA, il: PRICE_LOW_HIGH_IL, check_path: $check_path).click
  end

  def click_clear_all_button(key = nil)
    find_element(key, il_type: :css, tl: CLEAR_ALL_TA, il: CLEAR_ALL_IL, check_path: $check_path).click
  end

end
