require_relative '../page_extension'

class Menu < PageExtension

  MENU_BUTTON_IL = "[aria-label='Menu']"
  MENU_BUTTON_TA = "planetblue:menu:menu_button"

  SEARCH_BUTTON_IL = "button[aria-label='Search']"
  SEARCH_BUTTON_TA = "planetblue:menu:search_button"

  SEARCH_FIELD_IL = "input[aria-label='Search']"
  SEARCH_FIELD_TA = "planetblue:menu:search_field"

  MENU_USER_BUTTON_TA = "planetblue:menu:user_button"
  MENU_USER_BUTTON_IL = "a[href*='/account/login']"

  def click_menu_button(key = nil)
    find_element(key, il_type: :css, tl: MENU_BUTTON_TA, il: MENU_BUTTON_IL, check_path: $check_path).click
  end

  def menu_category(key, name)
    locator_by key, "//div[@role='button']/div[text()='#{name}']",
               "planetblue:menu:menu_button:#{ta_name(name)}"
  end

  def click_menu_category(key = nil, name)
    find_element(key, il_type: :xpath, tl: menu_category(:ta, name), il: menu_category(:il, name), check_path: $check_path).click
  end

  def menu_item(key, name)
    locator_by key, "//a[contains(@href, '/pages/') and text()='#{name}']",
               "planetblue:menu:menu_item:#{ta_name(name)}"
  end

  def click_menu_item(key = nil, name)
    find_element(key, il_type: :xpath, tl: menu_item(:ta, name), il: menu_item(:il, name), check_path: $check_path).click
  end

  def click_search_button(key = nil)
    find_element(key, il_type: :css, tl: SEARCH_BUTTON_TA, il: SEARCH_BUTTON_IL, check_path: $check_path).click
  end

  def fill_search_field(key = nil, value)
    find_element(key, il_type: :css, tl: SEARCH_FIELD_TA, il: SEARCH_FIELD_IL, check_path: $check_path).fill_in with: value
  end

  def search_item(key, name)
    locator_by key, "//p[text() = 'Search Suggestions']/../ul/li//span[text()='#{name}']",
               "planetblue:menu:search_item:#{ta_name(name)}"
  end

  def click_search_item(key = nil, name)
    find_element(key, il_type: :xpath, tl: search_item(:ta, name), il: search_item(:il, name), check_path: $check_path).click
  end

  def click_user_button(key = nil)
    find_element(key, il_type: :css, tl: MENU_USER_BUTTON_TA, il: MENU_USER_BUTTON_IL, check_path: $check_path).click
  end

end