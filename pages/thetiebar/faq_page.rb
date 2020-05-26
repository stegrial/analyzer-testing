require_relative '../page_extension'

class TheTiebarFaqPage < PageExtension

  VIEW_MY_REWARDS_IL = "(//div[text()='View My Rewards'])[1]"
  VIEW_MY_REWARDS_TA = "thetiebar:faq_page:view_my_rewards"

  LEARN_MORE_HERE_IL = "(//a[@href='/loyalty-rewards-program'])[1]"
  LEARN_MORE_HERE_TA = "thetiebar:faq_page:learn_more_link"

  FAQ_SECTION_IL = "(//a[contains(text(), 'For more details, visit the FAQ section')])[1]"
  FAQ_SECTION_TA = "thetiebar:faq_page:faq_section"

  RETURN_TO_THE_TIE_BAR_LINK_IL = "//span[@class='return-to-ttb-text']"
  RETURN_TO_THE_TIE_BAR_LINK_TA = "thetiebar:faq_page:return_to_thetiebar"

  WHAT_SIZE_NECKTIES_IL = "//zd-autocomplete-option[@tabindex='1']"
  WHAT_SIZE_NECKTIES_TA = "thetiebar:faq_page:size_neckties"

  TIE_BAR_BREADCRUMBS_IL = "(//a[text()='The Tie Bar'])[1]"
  TIE_BAR_BREADCRUMBS_TA = "thetiebar:faq_page:breadcrumb_tiebar"

  FAQ_SEARCH_BTN_IL = "//button[@class='search-btn']"
  FAQ_SEARCH_BTN_TA = "thetiebar:faq_page:faq_search_btn"

  KNOWLEDGE_BASE_NECKTIES_IL = "(//*[contains(text(), 'What size are your neckties?')])[1]"
  KNOWLEDGE_BASE_NECKTIES_TA = "thetiebar:faq_page:knowledge_size_neckties"

  FAQ_SEARCH_INPUT_IL = "//input[contains(@id, 'query')]"
  FAQ_SEARCH_INPUT_TA = "thetiebar:faq_page:faq_search_input"

  INTERNATIONAL_SECTION_IL = "//h4[text()='International']"
  INTERNATIONAL_SECTION_TA = "thetiebar:faq_page:international"

  ABOUT_THE_TIEBAR_SECTION_IL = "//h4[text()='About The Tie Bar']"
  ABOUT_THE_TIEBAR_SECTION_TA = "thetiebar:faq_page:about_the_tiebar"

  SIZING_SECTION_IL = "//h4[text()='Sizing']"
  SIZING_SECTION_TA = "thetiebar:faq_page:sizing"

  PRODUCTS_SECTION_IL = "//h4[text()='Products']"
  PRODUCTS_SECTION_TA = "thetiebar:faq_page:products"

  STYLING_SECTION_IL = "//h4[text()='Styling']"
  STYLING_SECTION_TA = "thetiebar:faq_page:styling"

  BULK_WHOLESALE_SECTION_IL = "//h4[text()='Bulk / Wholesale']"
  BULK_WHOLESALE_SECTION_TA = "thetiebar:faq_page:bulk_wholesale"

  RETURNS_PAYMENTS_SECTION_IL = "//h4[text()='Returns / Payments']"
  RETURNS_PAYMENTS_SECTION_TA = "thetiebar:faq_page:returns_payment"

  SHIPPING_SECTION_IL = "//h4[text()='Shipping']"
  SHIPPING_SECTION_TA = "thetiebar:faq_page:shipping"

  HOLIDAY_SECTION_IL = "//h4[text()='Holiday']"
  HOLIDAY_SECTION_TA = "thetiebar:faq_page:holiday"


  def click_view_my_rewards(key = nil)
    find_element(key, il_type: :xpath, tl: VIEW_MY_REWARDS_TA, il: VIEW_MY_REWARDS_IL, check_path: $check_path).click
  end

  def click_learn_more_link(key = nil)
    find_element(key, il_type: :xpath, tl: LEARN_MORE_HERE_TA, il: LEARN_MORE_HERE_IL, check_path: $check_path).click
  end

  def click_faq_section_link(key = nil)
    find_element(key, il_type: :xpath, tl: FAQ_SECTION_EP, il: FAQ_SECTION_IL, check_path: $check_path).click
  end

  def click_size_neckties(key = nil)
    find_element(key, il_type: :xpath, tl: WHAT_SIZE_NECKTIES_TA, il: WHAT_SIZE_NECKTIES_IL, check_path: $check_path).click
  end

  def click_breadcrumb_tiebar(key = nil)
    find_element(key, il_type: :xpath, tl: TIE_BAR_BREADCRUMBS_TA, il: TIE_BAR_BREADCRUMBS_IL, check_path: $check_path).click
  end

  def click_faq_search_btn(key = nil)
    find_element(key, il_type: :xpath, tl: FAQ_SEARCH_BTN_TA, il: FAQ_SEARCH_BTN_IL, check_path: $check_path).click
  end

  def click_knowledge_base_neckties(key = nil)
    find_element(key, il_type: :xpath, tl: KNOWLEDGE_BASE_NECKTIES_TA, il: KNOWLEDGE_BASE_NECKTIES_IL, check_path: $check_path).click
  end

  def fill_faq_search_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: FAQ_SEARCH_INPUT_TA, il: FAQ_SEARCH_INPUT_IL, check_path: $check_path).set(value)
  end

  def click_international_section(key = nil)
    find_element(key, il_type: :xpath, tl: INTERNATIONAL_SECTION_TA, il: INTERNATIONAL_SECTION_IL, check_path: $check_path).click
  end

  def click_about_the_tiebar_section(key = nil)
    find_element(key, il_type: :xpath, tl: ABOUT_THE_TIEBAR_SECTION_TA, il: ABOUT_THE_TIEBAR_SECTION_IL, check_path: $check_path).click
  end

  def click_sizing_section(key = nil)
    find_element(key, il_type: :xpath, tl: SIZING_SECTION_TA, il: SIZING_SECTION_IL, check_path: $check_path).click
  end

  def click_products_section(key = nil)
    find_element(key, il_type: :xpath, tl: PRODUCTS_SECTION_TA, il: PRODUCTS_SECTION_IL, check_path: $check_path).click
  end

  def click_styling_section(key = nil)
    find_element(key, il_type: :xpath, tl: STYLING_SECTION_TA, il: STYLING_SECTION_IL, check_path: $check_path).click
  end

  def click_bulk_wholesale_section(key = nil)
    find_element(key, il_type: :xpath, tl: BULK_WHOLESALE_SECTION_TA, il: BULK_WHOLESALE_SECTION_IL, check_path: $check_path).click
  end

  def click_returns_payment_section(key = nil)
    find_element(key, il_type: :xpath, tl: RETURNS_PAYMENTS_SECTION_TA, il: RETURNS_PAYMENTS_SECTION_IL, check_path: $check_path).click
  end

  def click_shipping_section(key = nil)
    find_element(key, il_type: :xpath, tl: SHIPPING_SECTION_TA, il: SHIPPING_SECTION_IL, check_path: $check_path).click
  end

  def click_holiday_section(key = nil)
    find_element(key, il_type: :xpath, tl: HOLIDAY_SECTION_TA, il: HOLIDAY_SECTION_IL, check_path: $check_path).click
  end

  def click_return_to_the_tiebar(key = nil)
    find_element(key, il_type: :xpath, tl: RETURN_TO_THE_TIE_BAR_LINK_TA, il: RETURN_TO_THE_TIE_BAR_LINK_IL, check_path: $check_path).click
  end

end
