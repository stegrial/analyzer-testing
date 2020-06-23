require_relative '../page_extension'

class Menu < PageExtension

  MENU_BUTTON_IL = "[aria-label='Menu']"
  MENU_BUTTON_TA = "planetblue:menu:menu_button"

  SEARCH_BUTTON_IL = "button[aria-label='Search']"
  SEARCH_BUTTON_TA = "planetblue:menu:search_button"

  SEARCH_FIELD_IL = "input[id='searchLabel']"
  SEARCH_FIELD_TA = "planetblue:menu:search_field"

  MENU_USER_BUTTON_TA = "planetblue:menu:user_button"
  MENU_USER_BUTTON_IL = "(//a[contains(@href, '/account/login')])[2]"

  HEADER_USER_BUTTON_TA = "planetblue:menu:user_button_header"
  HEADER_USER_BUTTON_IL = "(//a[contains(@href, '/account/login')])[1]"

  def click_menu_button(key = nil)
    find_element(key, il_type: :css, tl: MENU_BUTTON_TA, il: MENU_BUTTON_IL, check_path: $check_path).click
  end

  def menu_category(key, name)
    locator_by key, "//a[@data-th='nav']//span[contains(text(), '#{name}')]",
               "planetblue:menu:menu_button:#{ta_name(name)}"
  end

  def menu_category_menu(key, name)
    locator_by key, "//div[@class='header-dropdown__menu']//a[text()='#{name}']",
               "planetblue:menu:menu_menu_button:#{ta_name(name)}"
  end

  def click_menu_category_menu(key = nil, name)
    find_element(key, il_type: :xpath, tl: menu_category_menu(:ta, name), il: menu_category_menu(:il, name), check_path: $check_path).click
  end

  def hover_menu_category(key = nil, name)
    find_element(key, il_type: :xpath, tl: menu_category(:ta, name), il: menu_category(:il, name), check_path: $check_path).hover
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
    find_element(key, il_type: :xpath, tl: MENU_USER_BUTTON_TA, il: MENU_USER_BUTTON_IL, check_path: $check_path).click
  end

  def click_user_header_button(key = nil)
    find_element(key, il_type: :xpath, tl: HEADER_USER_BUTTON_TA, il: HEADER_USER_BUTTON_IL, check_path: $check_path).click
  end

end
