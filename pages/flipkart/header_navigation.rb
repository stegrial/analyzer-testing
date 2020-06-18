require_relative '../page_extension'

class HeaderNavigationFlipkart < PageExtension


  WOMEN_LINK_IL = "(//span[@class='_1QZ6fC _3Lgyp8'])[4]"
  WOMEN_LINK_TA = "flipkart:header_nav:women"

  DRESSES_LINK_IL = "(//a[@title='Dresses'])[1]"
  DRESSES_LINK_TA = "flipkart:header_nav:dresses"

  BODY_IL = "//body"
  BODY_TA = "flipkart:header_nav:body"

  JEANS_LINK_IL = "(//a[@title='Jeans'])[2]"
  JEANS_LINK_TA = "flipkart:header_nav:jeans"

  ELECTRONICS_IL = "//li/span[text()='Electronics']"
  ELECTRONICS_TA = "flipkart:header_nav:electronics"

  TV_APPLIANCES_IL = "//li/span[text()='TVs & Appliances']"
  TV_APPLIANCES_TA = "flipkart:header_nav:tv_appliances"

  SPORTS_BOOKS_MORE_IL = "//li/span[text()='Sports, Books & More']"
  SPORTS_BOOKS_MORE_TA = "flipkart:header_nav:sports_books_more"

  FLIGHTS_IL = "//a[contains(@href,'nmenu_Flights')]"
  FLIGHTS_TA = "flipkart:header_nav:flights"

  OFFER_ZONE_IL = "//a[contains(@href, 'offer-zone')]"
  OFFER_ZONE_TA = "flipkart:header_nav:offer_zone"

  CART_ICON_IL = "//a/span[text()='Cart']"
  CART_ICON_TA = "flipkart:header_nav:cart_icon"

  LOGO_IMG_IL = "//a/img[@alt='Flipkart']"
  LOGO_IMG_TA = "flipkart:header_nav:logo_img"

  MORE_DROPDOWN_IL = "//div[text()='More']"
  MORE_DROPDOWN_TA = "flipkart:header_nav:more_dropdown"

  SEARCH_INPUT_IL = "//input[@class='LM6RPg']"
  SEARCH_INPUT_TA = "flipkart:header_nav:search_input"

  SEARCH_BTN_IL = "//button[@class='vh79eN']"
  SEARCH_BTN_TA = "flipkart:header_nav:search_btn"

  LOGIN_BTN_IL = "//a[text()='Login']"
  LOGIN_BTN_TA = "flipkart:header_nav:login_btn"

  LOGIN_TEXT_IN_MODAL_IL = "//span[@class='_1hgiYz']//span[text()='Login']"
  LOGIN_TEXT_IN_MODAL_TA = "flipkart:header_nav:login_text_in_modal"


  def click_women_link(key = nil)
    find_element(key, il_type: :xpath, tl: WOMEN_LINK_TA, il: WOMEN_LINK_IL, check_path: $check_path).hover
  end

  def click_dresses_link(key = nil)
    find_element(key, il_type: :xpath, tl: DRESSES_LINK_TA, il: DRESSES_LINK_IL, check_path: $check_path).click
  end

  def click_jeans_link(key = nil)
    find_element(key, il_type: :xpath, tl: JEANS_LINK_TA, il: JEANS_LINK_IL, check_path: $check_path).click
  end

  def escape(key = nil)
    find_element(key, il_type: :xpath, tl: BODY_TA, il: BODY_IL, check_path: $check_path).send_keys :escape
  end

  def hover_electronics(key = nil)
    find_element(key, il_type: :xpath, tl: ELECTRONICS_TA, il: ELECTRONICS_IL, check_path: $check_path).hover
  end

  def hover_tv_appliances(key = nil)
    find_element(key, il_type: :xpath, tl: TV_APPLIANCES_TA, il: TV_APPLIANCES_IL, check_path: $check_path).hover
  end

  def hover_sports_books_more(key = nil)
    find_element(key, il_type: :xpath, tl: SPORTS_BOOKS_MORE_TA, il: SPORTS_BOOKS_MORE_IL, check_path: $check_path).hover
  end

  def click_flights_link(key = nil)
    find_element(key, il_type: :xpath, tl: FLIGHTS_TA, il: FLIGHTS_IL, check_path: $check_path).click
  end

  def click_offer_zone_link(key = nil)
    find_element(key, il_type: :xpath, tl: OFFER_ZONE_TA, il: OFFER_ZONE_IL, check_path: $check_path).click
  end

  def click_cart_icon(key = nil)
    find_element(key, il_type: :xpath, tl: CART_ICON_TA, il: CART_ICON_IL, check_path: $check_path).click
  end

  def click_logo(key = nil)
    find_element(key, il_type: :xpath, tl: LOGO_IMG_TA, il: LOGO_IMG_IL, check_path: $check_path).click
  end

  def hover_more_dropdown(key = nil)
    find_element(key, il_type: :xpath, tl: MORE_DROPDOWN_TA, il: MORE_DROPDOWN_IL, check_path: $check_path).hover
  end

  def fill_search_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: SEARCH_INPUT_TA, il: SEARCH_INPUT_IL, check_path: $check_path).set(value)
  end

  def click_search_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SEARCH_BTN_TA, il: SEARCH_BTN_IL, check_path: $check_path).click
  end

  def click_login_btn(key = nil)
    find_element(key, il_type: :xpath, tl: LOGIN_BTN_TA, il: LOGIN_BTN_IL, check_path: $check_path).click
  end

  def should_see_login_text_in_modal(key = nil)
    element = find_element(key, il_type: :xpath, tl: LOGIN_TEXT_IN_MODAL_TA, il: LOGIN_TEXT_IN_MODAL_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end