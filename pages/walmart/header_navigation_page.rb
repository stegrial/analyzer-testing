require_relative '../page_extension'

class HeaderNavigationPageWalmart < PageExtension


  HAMBURGER_BTN_IL = "//button[@aria-label='Menu']"
  HAMBURGER_BTN_TA = "walmart:header_navigation:hamburger_btn"

  BABY_CATEGORY_IL = "(//button//span[text()='Baby'])[1]"
  BABY_CATEGORY_TA = "walmart:header_navigation:baby_category"

  NEW_ARRIVALS_IL = "(//div[text()='New Arrivals'])[4]"
  NEW_ARRIVALS_TA = "walmart:header_navigation:new_arrivals"

  CART_ICON_IL = "#header-cart-link"
  CART_ICON_TA = "walmart:header_navigation:cart_icon"

  ACCOUNT_BTN_IL = "#header-account-toggle"
  ACCOUNT_BTN_TA = "walmart:header_navigation:account_btn"

  SIGN_IN_LINK_IL = "//a[@title='Sign In']"
  SIGN_IN_LINK_TA = "walmart:header_navigation:sign_in"

  TRACK_ORDERS_LINK_IL = "//a[@title='Track Orders']"
  TRACK_ORDERS_LINK_TA = "walmart:header_navigation:track_orders"

  ACCOUNT_LINK_IL = "//a[contains(@data-tl-id, 'GlobalAccountMenu') and @title='Account']"
  ACCOUNT_LINK_TA = "walmart:header_navigation:account_link"

  HELP_LINK_IL = "//a[@title='Help']"
  HELP_LINK_TA = "walmart:header_navigation:help_link"

  CLOSE_ACC_MENU_IL = "#account-menu-close-button"
  CLOSE_ACC_MENU_TA = "walmart:header_navigation:close_acc_menu"

  LOGO_IL = "#hf-home-link"
  LOGO_TA = "walmart:header_navigation:logo"

  SEARCH_DROPDOWN_IL = "#global-search-dropdown-toggle"
  SEARCH_DROPDOWN_TA = "walmart:header_navigation:search_dropdown"

  SEARCH_IN_TEXT_IL = "//div[text()='Search in ...']"
  SEARCH_IN_TEXT_TA = "walmart:header_navigation:search_in_text"

  HOME_SEARCH_ITEM_IL = "//button[@data-catid='4044']"
  HOME_SEARCH_ITEM_TA = "walmart:header_navigation:home_search_item"

  HOME_DROPDOWN_SEARCH_IL = "//span[@id='global-search-category-label' and text()='Home']"
  HOME_DROPDOWN_SEARCH_TA = "walmart:header_navigation:home_dropdown_search"

  SEARCH_QUERY_IL = "input#global-search-input"
  SEARCH_QUERY_TA = "walmart:header_navigation:search_query"

  SEARCH_BTN_IL = "button#global-search-submit"
  SEARCH_BTN_TA =  "walmart:header_navigation:search_btn"

  REORDER_LINK_IL = "//a[@aria-label='Reorder']"
  REORDER_LINK_TA = "walmart:header_navigation:reorder_link"

  PATIO_GARDEN_IL = "(//button//span[text()='Patio & Garden'])[1]"
  PATIO_GARDEN_TA = "walmart:header_navigation:patio_garden_category"

  PATIO_SETS_IL = "(//div[text()='Patio Sets'])[1]"
  PATIO_SETS_TA = "walmart:header_navigation:patio_sets"


  def click_hamburger_menu(key = nil)
    find_element(key, il_type: :xpath, tl: HAMBURGER_BTN_TA, il: HAMBURGER_BTN_IL, check_path: $check_path).click
  end

  def click_baby_category(key = nil)
    find_element(key, il_type: :xpath, tl: BABY_CATEGORY_TA, il: BABY_CATEGORY_IL, check_path: $check_path).hover
  end

  def click_new_arrivals(key = nil)
    find_element(key, il_type: :xpath, tl: NEW_ARRIVALS_TA, il: NEW_ARRIVALS_IL, check_path: $check_path).click
  end

  def click_cart_icon(key = nil)
    find_element(key, il_type: :css, tl: CART_ICON_TA, il: CART_ICON_IL, check_path: $check_path).click
  end

  def click_account_btn(key = nil)
    find_element(key, il_type: :css, tl: ACCOUNT_BTN_TA, il: ACCOUNT_BTN_IL, check_path: $check_path).click
  end

  def click_sign_in_link(key = nil)
    find_element(key, il_type: :xpath, tl: SIGN_IN_LINK_TA, il: SIGN_IN_LINK_IL, check_path: $check_path).click
  end

  def should_see_sign_in_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: SIGN_IN_LINK_TA, il: SIGN_IN_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_track_orders_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: TRACK_ORDERS_LINK_TA, il: TRACK_ORDERS_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_account_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: ACCOUNT_LINK_TA, il: ACCOUNT_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_help_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: HELP_LINK_TA, il: HELP_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_close_acc_menu(key = nil)
    find_element(key, il_type: :css, tl: CLOSE_ACC_MENU_TA, il: CLOSE_ACC_MENU_IL, check_path: $check_path).click
  end

  def should_see_logo(key = nil)
    element = find_element(key, il_type: :css, tl: LOGO_TA, il: LOGO_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_search_dropdown_btn(key = nil)
    find_element(key, il_type: :css, tl: SEARCH_DROPDOWN_TA, il: SEARCH_DROPDOWN_IL, check_path: $check_path).click
  end

  def should_see_search_in_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: SEARCH_IN_TEXT_TA, il: SEARCH_IN_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_home_search_item(key = nil)
    find_element(key, il_type: :xpath, tl: HOME_SEARCH_ITEM_TA, il: HOME_SEARCH_ITEM_IL, check_path: $check_path).click
  end

  def should_see_home_dropdown_search(key = nil)
    element = find_element(key, il_type: :xpath, tl: HOME_DROPDOWN_SEARCH_TA, il: HOME_DROPDOWN_SEARCH_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_search_query(key = nil, value)
    find_element(key, il_type: :css, tl: SEARCH_QUERY_TA, il: SEARCH_QUERY_IL, check_path: $check_path).set(value)
  end

  def click_search_btn(key = nil)
    find_element(key, il_type: :css, tl: SEARCH_BTN_TA, il: SEARCH_BTN_IL, check_path: $check_path).click
    end

  def click_reorder_link(key = nil)
    find_element(key, il_type: :xpath, tl: REORDER_LINK_TA, il: REORDER_LINK_IL, check_path: $check_path).click
  end

  def click_patio_garden_category(key = nil)
    find_element(key, il_type: :xpath, tl: PATIO_GARDEN_TA, il: PATIO_GARDEN_IL, check_path: $check_path).hover
    end

  def click_patio_sets(key = nil)
    find_element(key, il_type: :xpath, tl: PATIO_SETS_TA, il: PATIO_SETS_IL, check_path: $check_path).click
  end

end