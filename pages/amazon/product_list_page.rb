require_relative '../page_extension'

class ProductListPage < PageExtension


  PRODUCT_FROM_SEARCH_IL = "(//div[@class='a-section a-spacing-medium'])[5]"
  PRODUCT_FROM_SEARCH_TA = "amazon:product_list_page:product_from_search"

  RESULT_BAR_JEWELRY_IL = "//span[@data-component-type='s-result-info-bar']//span[text()='Jewelry']"
  RESULT_BAR_JEWELRY_TA = "amazon:product_list_page:result_bar_jewelry"

  EDITORIAL_RECOMMENDATIONS_IL = "(//span[text()='Editorial recommendations'])[1]"
  EDITORIAL_RECOMMENDATIONS_TA = "amazon:product_list_page:editorial_recommendations"

  READ_FULL_ARTICLE_IL = "(//a[contains(text(), 'Read full article')])[1]"
  READ_FULL_ARTICLE_TA =  "amazon:product_list_page:read_full_article"

  PAGINATION_PREVIOUS_IL = "//span[@cel_widget_id='MAIN-PAGINATION']//li[text()='Previous']"
  PAGINATION_PREVIOUS_TA = "amazon:product_list_page:previous_pagination"

  PAGINATION_NEXT_IL = "//span[@cel_widget_id='MAIN-PAGINATION']//a[text()='Next']"
  PAGINATION_NEXT_TA = "amazon:product_list_page:next_pagination"

  PAGINATION_2_IL = "//span[@cel_widget_id='MAIN-PAGINATION']//a[text()='2']"
  PAGINATION_2_TA = "amazon:product_list_page:pagination_2"

  BRANDS_IN_SEARCH_IL = "//div[@class='threepsl-header']/*[text()='Brands related to your search']"
  BRANDS_IN_SEARCH_TA = "amazon:product_list_page:brands_in_search"

  SPONSORED_PRODUCT_IN_SEARCH_IL = "//h2[contains(text(),'Sponsored products related to this search')]"
  SPONSORED_PRODUCT_IN_SEARCH_TA = "amazon:product_list_page:sponsored_product_in_search"

  NEED_HELP_BLOCK_IL = "//h2/span[text()='Need help?']"
  NEED_HELP_BLOCK_TA = "amazon:product_list_page:need_help_block"

  VISIT_HELP_SECTION_IL = "//a[contains(text(), 'Visit the help section')]"
  VISIT_HELP_SECTION_TA = "amazon:product_list_page:visit_help_section"

  CONTACT_US_IL = "//a[contains(text(), 'contact us')]"
  CONTACT_US_TA = "amazon:product_list_page:contact_us"


  def click_contact_us(key = nil)
    find_element(key, il_type: :xpath, tl: CONTACT_US_TA, il: CONTACT_US_IL, check_path: $check_path).click
  end

  def click_visit_help_section(key = nil)
    find_element(key, il_type: :xpath, tl: VISIT_HELP_SECTION_TA, il: VISIT_HELP_SECTION_IL, check_path: $check_path).click
  end

  def should_see_need_help_block(key = nil)
    element = find_element(key, il_type: :xpath, tl: NEED_HELP_BLOCK_TA, il: NEED_HELP_BLOCK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_product_from_search_result(key = nil)
    find_element(key, il_type: :xpath, tl: PRODUCT_FROM_SEARCH_TA, il: PRODUCT_FROM_SEARCH_IL, check_path: $check_path).click
  end

  def should_see_product_from_search(key = nil)
    element = find_element(key, il_type: :xpath, tl: PRODUCT_FROM_SEARCH_TA, il: PRODUCT_FROM_SEARCH_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_result_bar_jewelry(key = nil)
   element = find_element(key, il_type: :xpath, tl: RESULT_BAR_JEWELRY_TA, il: RESULT_BAR_JEWELRY_IL, check_path: $check_path)
   expect(element).to be_visible
  end

  def should_see_previous_pagination(key = nil)
    element = find_element(key, il_type: :xpath, tl: PAGINATION_PREVIOUS_TA, il: PAGINATION_PREVIOUS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_next_pagination(key = nil)
    element = find_element(key, il_type: :xpath, tl: PAGINATION_NEXT_TA, il: PAGINATION_NEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_pagination_2(key = nil)
    find_element(key, il_type: :xpath, tl: PAGINATION_2_TA, il: PAGINATION_2_IL, check_path: $check_path).click
  end

  def should_see_brands_in_search(key = nil)
    element = find_element(key, il_type: :xpath, tl: BRANDS_IN_SEARCH_TA, il: BRANDS_IN_SEARCH_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
