require 'spec_helper'
require_relative '../page_extension'

class VenusNavigation < PageExtension

  ACCOUNT_BUTTON_IL = "(//button[@aria-label='Account'])[2]"
  ACCOUNT_BUTTON_TA = 'venus:navigation_page:account_button'

  ORDER_HISTORY_IL = "(//a[text()='Order History'])[3]"
  ORDER_HISTORY_TA = 'venus:navigation_page:account_menu:order_history'

  VENUS_LOGO_IL = "//a[./span[text()='Venus']]"
  VENUS_LOGO_TA = 'venus:navigation_page:logo'

  SALE_CAT_IL = "//button[contains(., 'Sale')]"
  SALE_CAT_TA = 'venus:navigation_page:sale_cat'

  SEARCH_BUTTON_IL = "//button[@aria-label='Search']"
  SEARCH_BUTTON_TA = 'venus:navigation_page:search_button'

  SEARCH_FIELD_IL = "//input[contains (@placeholder, 'Search')]"
  SEARCH_FIELD_TA = 'venus:navigation_page:search_field'

  FIND_BUTTON_IL = "//button[@variant='contained']"
  FIND_BUTTON_TA = 'venus:navigation_page:find_button'

  CLOTHING_CAT_IL = "//button[contains(., 'Clothing')]"
  CLOTHING_CAT_TA = 'venus:navigation_page:clothing_cat'

  CART_BUTTON_IL = "//div[contains(@id, 'cart')]"
  CART_BUTTON_TA = 'venus:navigation_page:cart_button'

  MENU_BUTTON_IL = "button[aria-label='Menu']"
  MENU_BUTTON_TA = "venus:navigation_page:menu_button"

  def page_header(key, name)
    locator_by key, "//h1[contains(@class, 'mw-main-title') and text() = '#{name}']",
               "venus:navigation_page:header:#{ta_name(name)}"
  end

  def menu_item(key = nil, name)
    locator_by(key, "(//li[@role='menuitem']//div[text()='#{name}']//ancestor::a)[2]",
    "venus:navigation_page:menu_item:#{ta_name(name)}'")
  end

  def click_account_button(key = nil)
    find_element(key, il_type: :xpath, tl: ACCOUNT_BUTTON_TA, il: ACCOUNT_BUTTON_IL, check_path: $check_path).click
  end

  def click_order_history_option(key = nil)
    find_element(key, il_type: :css, tl: ORDER_HISTORY_TA, il: ORDER_HISTORY_IL, check_path: $check_path).click
  end

  def click_venus_logo(key = nil)
    find_element(key, il_type: :css, tl: VENUS_LOGO_TA, il: VENUS_LOGO_IL, check_path: $check_path).click
  end

  def click_sale_cat(key = nil)
    find_element(key, il_type: :css, tl: SALE_CAT_TA, il: SALE_CAT_IL, check_path: $check_path).click
  end

  def click_search_button(key = nil)
    find_element(key, il_type: :xpath, tl: SEARCH_BUTTON_TA, il: SEARCH_BUTTON_IL, check_path: $check_path).click
  end

  def enter_search_value(key = nil, value)
    find_element(key, il_type: :xpath, tl: SEARCH_FIELD_TA, il: SEARCH_FIELD_IL, check_path: $check_path).fill_in with: value
  end

  def click_find_button(key = nil)
    find_element(key, il_type: :xpath, tl: FIND_BUTTON_TA, il: FIND_BUTTON_IL, check_path: $check_path).click
  end

  def click_clothing_cat(key = nil)
    find_element(key, il_type: :xpath, tl: CLOTHING_CAT_TA, il: CLOTHING_CAT_IL, check_path: $check_path).click
  end

  def click_menu_button(key = nil)
    find_element(key, il_type: :css, tl: MENU_BUTTON_TA, il: MENU_BUTTON_IL, check_path: $check_path).click
  end

  def click_menu_item(key = nil, name)
    find_element(key, il_type: :xpath, tl: menu_item(:ta, name), il: menu_item(:il, name), check_path: $check_path).click
  end

  def should_see_page_header(key = nil, name)
    element = find_element(key, il_type: :xpath, tl: page_header(:ta, name), il: page_header(:il, name), check_path: $check_path)
    expect(element).to be_visible
  end

  def click_cart_button(key = nil)
    find_element(key, il_type: :xpath, tl: CART_BUTTON_TA, il: CART_BUTTON_IL, check_path: $check_path).click
  end

  #
  # def find_items_on_cart(key = nil)
  #   find_element(key, il_type: :css, tl: , il: ACCOUNT_BUTTON_IL, check_path: $check_path).click
  # end

  # def click_items_on_cart(key = nil)
  #   find_element(key, il_type: :css, tl: ACCOUNT_BUTTON_TA, il: ACCOUNT_BUTTON_IL, check_path: $check_path).click
  # end


end