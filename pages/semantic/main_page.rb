require_relative '../page_extension'

class MainPage < PageExtension

  LANGUAGES_DIV_IL = "//div[@id='languages']"
  LANGUAGES_DIV_TA = "semantic:main_page:language_div"

  ENGLISH_LANG_IL = "//div[@data-english='English']"
  ENGLISH_LANG_TA = "semantic:main_page:english_lang"

  ONE_BUTTON_IL = "//div[text()='One']"
  ONE_BUTTON_TA = "semantic:main_page:one_button"

  TWO_BUTTON_IL = "//div[text()='Two']"
  TWO_BUTTON_TA = "semantic:main_page:two_button"

  THREE_BUTTON_IL = "//div[text()='Three']"
  THREE_BUTTON_TA = "semantic:main_page:three_button"

  SELECT_THEME_IL = "//div[contains(@class, 'theme')]"
  SELECT_THEME_TA = "semantic:main_page:select_theme"

  THEME_SEMANTIC_IL = "//div[text()='Semantic UI']"
  THEME_SEMANTIC_TA = "semantic:main_page:theme_semantic"

  VIEW_SOURCE_IL = "//div[contains(.,'View Source') and contains(@class, 'button')]"
  VIEW_SOURCE_TA = "semantic:main_page:view_source"

  VIEW_DIV_IL = "(//div[contains(.,'View') and contains(@class, 'button')])[2]"
  VIEW_DIV_TA = "semantic:main_page:view_div"

  ADD_TO_CART_IL = "//div[contains(.,'Add to Cart') and contains(@class, 'button')]"
  ADD_TO_CART_TA = "semantic:main_page:add_to_cart"

  SAVE_FOR_LATER_IL = "//div[contains(.,'Save for Later') and contains(@class, 'button')]"
  SAVE_FOR_LATER_TA = "semantic:main_page:save_for_later"

  RATE_IL = "//div[contains(.,'Rate') and contains(@class, 'button')]"
  RATE_TA = "semantic:main_page:rate"

  ONE_DIV_IL = "(//div[text()='1'])[1]"
  ONE_DIV_TA = "semantic:main_page:one_div"

  TWO_DIV_IL = "(//div[text()='2'])[1]"
  TWO_DIV_TA = "semantic:main_page:two_div"

  THREE_DIV_IL = "(//div[text()='3'])[1]"
  THREE_DIV_TA = "semantic:main_page:three_div"

  DIVIDER_A_IL = "//div[text()='A']"
  DIVIDER_A_TA = "semantic:main_page:divider_a"

  DIVIDER_OR_IL = "//div[text()='or']"
  DIVIDER_OR_TA = "semantic:main_page:divider_or"

  DIVIDER_B_IL = "//div[text()='B']"
  DIVIDER_B_TA = "semantic:main_page:divider_b"

  SELECT_COUNTRY_IL = "//div[contains(@class, 'selection')]"
  SELECT_COUNTRY_TA = "semantic:main_page:select_country"

  COUNTRY_ARAB_EMIRATES_IL = "//div[@data-value='ae']"
  COUNTRY_ARAB_EMIRATES_TA = "semantic:main_page:country_arab_emirates"

  FILTER_POSTS_IL = "//span[text()='Filter Posts']"
  FILTER_POSTS_TA = "semantic:main_page:filter_posts"

  CART_HEADER_IL = "//div[text()='Rachel Maddaw']"
  CART_HEADER_TA = "semantic:main_page:cart_header"


  def click_language_btn(key = nil)
    find_element(key, il_type: :xpath, tl: LANGUAGES_DIV_TA, il: LANGUAGES_DIV_IL, check_path: $check_path).click
  end

  def click_english_lang_btn(key = nil)
    find_element(key, il_type: :xpath, tl: ENGLISH_LANG_TA, il: ENGLISH_LANG_IL, check_path: $check_path).click
  end

  def should_see_one_button(key = nil)
    element = find_element(key, il_type: :xpath, tl: ONE_BUTTON_TA, il: ONE_BUTTON_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_two_button(key = nil)
    element = find_element(key, il_type: :xpath, tl: TWO_BUTTON_TA, il: TWO_BUTTON_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_three_button(key = nil)
    element = find_element(key, il_type: :xpath, tl: THREE_BUTTON_TA, il: THREE_BUTTON_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_select_theme(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_THEME_TA, il: SELECT_THEME_IL, check_path: $check_path).click
  end

  def click_theme_semantic(key = nil)
    find_element(key, il_type: :xpath, tl: THEME_SEMANTIC_TA, il: THEME_SEMANTIC_IL, check_path: $check_path).click
  end

  def should_see_view_source_button(key = nil)
    element = find_element(key, il_type: :xpath, tl: VIEW_SOURCE_TA, il: VIEW_SOURCE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_view_button(key = nil)
    element = find_element(key, il_type: :xpath, tl: VIEW_DIV_TA, il: VIEW_DIV_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_add_to_cart_button(key = nil)
    element = find_element(key, il_type: :xpath, tl: ADD_TO_CART_TA, il: ADD_TO_CART_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_save_for_later_button(key = nil)
    element = find_element(key, il_type: :xpath, tl: SAVE_FOR_LATER_TA, il: SAVE_FOR_LATER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_rate_button(key = nil)
    element = find_element(key, il_type: :xpath, tl: RATE_TA, il: RATE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_one_div(key = nil)
    element = find_element(key, il_type: :xpath, tl: ONE_DIV_TA, il: ONE_DIV_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_two_div(key = nil)
    element = find_element(key, il_type: :xpath, tl: TWO_DIV_TA, il: TWO_DIV_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_three_div(key = nil)
    element = find_element(key, il_type: :xpath, tl: THREE_DIV_TA, il: THREE_DIV_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_divider_a_button(key = nil)
    element = find_element(key, il_type: :xpath, tl: DIVIDER_A_TA, il: DIVIDER_A_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_divider_or_button(key = nil)
    element = find_element(key, il_type: :xpath, tl: DIVIDER_OR_TA, il: DIVIDER_OR_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_divider_b_button(key = nil)
    element = find_element(key, il_type: :xpath, tl: DIVIDER_B_TA, il: DIVIDER_B_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_select_country(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_COUNTRY_TA, il: SELECT_COUNTRY_IL, check_path: $check_path).click
  end

  def click_country_arab_emirates(key = nil)
    find_element(key, il_type: :xpath, tl: COUNTRY_ARAB_EMIRATES_TA, il: COUNTRY_ARAB_EMIRATES_IL, check_path: $check_path).click
  end

  def should_see_filter_posts(key = nil)
    element = find_element(key, il_type: :xpath, tl: FILTER_POSTS_TA, il: FILTER_POSTS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_cart_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: CART_HEADER_TA, il: CART_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
