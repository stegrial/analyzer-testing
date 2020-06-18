require_relative '../page_extension'

class HeaderNavigation < PageExtension


  MAIN_SEARCH_IL = "//input[@id='twotabsearchtextbox']"
  MAIN_SEARCH_TA = "amazon:header_navigation:search_input"

  SEARCH_BTN_IL = "//div/input[@value='Go']"
  SEARCH_BTN_TA = "amazon:header_navigation:search_btn"

  ACCOUNT_LIST_IL = "#nav-link-accountList"
  ACCOUNT_LIST_TA = "amazon:header_navigation:account_list"

  HAMBURGER_MENU_IL = "#nav-hamburger-menu"
  HAMBURGER_MENU_TA = "amazon:header_navigation:hamburger_menu"

  SEARCH_JEWELRY_BTN_SELECTED_IL = "//option[@value='search-alias=fashion-womens-jewelry']"
  SEARCH_JEWELRY_BTN_SELECTED_TA = "amazon:header_navigation:jewelry_selected_in_search"

  DELIVERY_BTN_IL = "//a[contains(@class,'a-popover-trigger a-declarative')]"
  DELIVERY_BTN_TA = "amazon:header_navigation:delivery_location"

  DELIVERY_VIETNAM_BTN_IL = "//span[contains(text(),'Vietnam') and @id='glow-ingress-line2']"
  DELIVERY_VIETNAM_BTN_TA = "amazon:header_navigation:delivery_vietnam_location"

  DEALS_TODAY_LINK_IL = "//div[@id='nav-main']//a[contains(text(), 'Deals')]"
  DEALS_TODAY_LINK_TA = "amazon:header_navigation:deals_today_btn"

  CUSTOMER_SERVICE_IL = "//div[@id='nav-main']//a[contains(text(), 'Customer Service')]"
  CUSTOMER_SERVICE_TA = "amazon:header_navigation:customer_service_btn"

  GIFT_CARDS_IL = "//div[@id='nav-main']//a[contains(text(), 'Gift Cards')]"
  GIFT_CARDS_TA = "amazon:header_navigation:gift_cards_btn"

  REGISTRY_IL = "//div[@id='nav-main']//a[contains(text(), 'Registry')]"
  REGISTRY_TA = "amazon:header_navigation:registry_btn"

  SELL_IL = "//div[@id='nav-main']//a[contains(text(), 'Sell')]"
  SELL_TA = "amazon:header_navigation:sell_btn"


  def set_data_in_search(key = nil, value)
    find_element(key, il_type: :xpath, tl: MAIN_SEARCH_TA, il: MAIN_SEARCH_IL, check_path: $check_path).set(value)
  end

  def click_search_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SEARCH_BTN_TA, il: SEARCH_BTN_IL, check_path: $check_path).click
  end

  def click_account_list_btn(key = nil)
    find_element(key, il_type: :css, tl: ACCOUNT_LIST_TA, il: ACCOUNT_LIST_IL, check_path: $check_path).click
  end

  def click_hamburger_menu_btn(key = nil)
    find_element(key, il_type: :css, tl: HAMBURGER_MENU_TA, il: HAMBURGER_MENU_IL, check_path: $check_path).click
  end

  def should_see_jewelry_in_search(key = nil)
    element = find_element(key, il_type: :xpath, tl: SEARCH_JEWELRY_BTN_SELECTED_TA, il: SEARCH_JEWELRY_BTN_SELECTED_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_delivery_location_btn(key = nil)
    find_element(key, il_type: :xpath, tl: DELIVERY_BTN_TA, il: DELIVERY_BTN_IL, check_path: $check_path).click
  end

  def should_see_delivery_vietnam(key = nil)
    element = find_element(key, il_type: :xpath, tl: DELIVERY_VIETNAM_BTN_TA, il: DELIVERY_VIETNAM_BTN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_deals_today_btn(key = nil)
    find_element(key, il_type: :xpath, tl: DEALS_TODAY_LINK_TA, il: DEALS_TODAY_LINK_IL, check_path: $check_path).click
  end

  def click_customer_service_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CUSTOMER_SERVICE_TA, il: CUSTOMER_SERVICE_IL, check_path: $check_path).click
  end

  def click_gift_cards_btn(key = nil)
    find_element(key, il_type: :xpath, tl: GIFT_CARDS_TA, il: GIFT_CARDS_IL, check_path: $check_path).click
  end

  def click_registry_btn(key = nil)
    find_element(key, il_type: :xpath, tl: REGISTRY_TA, il: REGISTRY_IL, check_path: $check_path).click
  end

  def click_sell_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SELL_TA, il: SELL_IL, check_path: $check_path).click
  end

end
