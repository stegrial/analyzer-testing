require_relative '../page_extension'

class ProductListPageFlipkart < PageExtension


  SECOND_PRODUCT_LINK_IL = "(//a[@class='_3dqZjq'])[2]"
  SECOND_PRODUCT_LINK_TA = "flipkart:product_list_page:second_dress"

  PRODUCTS_CATEGORY_H1_IL = "//h1[@class='_2yAnYN']"
  PRODUCTS_CATEGORY_H1_TA = "flipkart:product_list_page:products_category_h1"

  SORT_LOW_TO_HIGH_IL = "//div[contains(text(), 'Low to High')]"
  SORT_LOW_TO_HIGH_TA = "flipkart:product_list_page:sort_by_low_to_high"

  SORT_HIGH_TO_LOW_IL = "//div[contains(text(),  'High to Low')]"
  SORT_HIGH_TO_LOW_TA = "flipkart:product_list_page:sort_by_high_to_low"

  SORT_NEWEST_FIRST_IL = "//div[contains(text(),  'Newest First')]"
  SORT_NEWEST_FIRST_TA = "flipkart:product_list_page:sort_by_newest_first"

  PRICE_FILTER_IL = "//section[@class='_1MCcAi D_NGuZ']//span[contains(text(),  'Price')]"
  PRICE_FILTER_TA = "flipkart:product_list_page:price_filter"

  FILTER_MIN_PRISE_IL = "(//select[@class='fPjUPw'])[1]"
  FILTER_MIN_PRISE_TA = "flipkart:product_list_page:min_price_filter"

  FILTER_MAX_PRISE_IL = "(//select[@class='fPjUPw'])[2]"
  FILTER_MAX_PRISE_TA = "flipkart:product_list_page:max_price_filter"

  SEARCH_BRAND_IL = "//input[@placeholder='Search Brand']"
  SEARCH_BRAND_TA = "flipkart:product_list_page:search_brand"

  LEE_BRAND_IL = "//div[contains(@class, '_1GEhLw') and text()='Lee']"
  LEE_BRAND_TA = "flipkart:product_list_page:lee_brand"

  COLOR_FILTER_IL = "//div[contains(@class, '_2yccxO D0YrLF') and text()='Color']"
  COLOR_FILTER_TA = "flipkart:product_list_page:open_color_filter"

  BLUE_COLOR_IL = "//div[contains(@class, '_1GEhLw') and text()='Blue']"
  BLUE_COLOR_TA =  "flipkart:product_list_page:blue_color"


  def click_second_dress_link(key = nil)
    find_element(key, il_type: :xpath, tl: SECOND_PRODUCT_LINK_TA, il: SECOND_PRODUCT_LINK_IL, check_path: $check_path).click
  end

  def switch_to_window
    last_handle = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(last_handle)
  end

  def should_see_products_category_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: PRODUCTS_CATEGORY_H1_TA, il: PRODUCTS_CATEGORY_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_sort_by_low_to_high(key = nil)
    find_element(key, il_type: :xpath, tl: SORT_LOW_TO_HIGH_TA, il: SORT_LOW_TO_HIGH_IL, check_path: $check_path).click
  end

  def click_sort_by_high_to_low(key = nil)
    find_element(key, il_type: :xpath, tl: SORT_HIGH_TO_LOW_TA, il: SORT_HIGH_TO_LOW_IL, check_path: $check_path).click
  end

  def click_sort_by_newest_first(key = nil)
    find_element(key, il_type: :xpath, tl: SORT_NEWEST_FIRST_TA, il: SORT_NEWEST_FIRST_IL, check_path: $check_path).click
  end

  def should_see_price_filter(key = nil)
    element = find_element(key, il_type: :xpath, tl: PRICE_FILTER_TA, il: PRICE_FILTER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def select_min_price_filter(key = nil, value)
    find_element(key, il_type: :xpath, tl: FILTER_MIN_PRISE_TA, il: FILTER_MIN_PRISE_IL, check_path: $check_path).select(value)
  end

  def select_max_price_filter(key = nil, value)
    find_element(key, il_type: :xpath, tl: FILTER_MAX_PRISE_TA, il: FILTER_MAX_PRISE_IL, check_path: $check_path).select(value)
  end

  def fill_search_brand(key = nil, value)
    find_element(key, il_type: :xpath, tl: SEARCH_BRAND_TA, il: SEARCH_BRAND_IL, check_path: $check_path).set(value)
  end

  def click_lee_brand(key = nil)
    find_element(key, il_type: :xpath, tl: LEE_BRAND_TA, il: LEE_BRAND_IL, check_path: $check_path).click
  end

  def click_color_filter(key = nil)
    find_element(key, il_type: :xpath, tl: COLOR_FILTER_TA, il: COLOR_FILTER_IL, check_path: $check_path).click
  end

  def click_blue_color(key = nil)
    find_element(key, il_type: :xpath, tl: BLUE_COLOR_TA, il: BLUE_COLOR_IL, check_path: $check_path).click
  end

end