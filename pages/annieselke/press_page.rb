require_relative '../page_extension'

class PressPage < PageExtension

  PRESS_CATALOG_IL = "//div[@class='collections-grid-item first'][1]/a[1]"
  PRESS_CATALOG_TA = "annieselke:home_page:press_page:catalog_item"

  CHOOSE_ITEMS_IL = "//a[text()='Choose Items Below']"
  CHOOSE_ITEMS_TA = "annieselke:home_page:press_page:choose_items"

  SELECT_SIZE_IL = "//select[@name='productCodePost']"
  SELECT_SIZE_TA = "annieselke:home_page:press_page:select_size"

  QUANTITY_FIELD_IL = "//input[@class='cartQty']"
  QUANTITY_FIELD_TA = "annieselke:home_page:press_page:quantity"

  ADD_TO_CARD_IL = "//button[@class='button primary add-to-cart color-change']"
  ADD_TO_CARD_TA = "annieselke:home_page:press_page:add_card_btn"


  def select_size_item(key)
    locator_by key,
               "//select[@name='productCodePost']/option[2]",
               "annieselke:home_page:press_page:#{ta_name('item_option')}"
  end

  def click_first_catalog(key=nil)
    find_element(key, il_type: :xpath, tl: PRESS_CATALOG_TA, il: PRESS_CATALOG_IL, check_path: $check_path).click
  end

  def click_choose_items(key=nil)
    find_element(key, il_type: :xpath, tl: CHOOSE_ITEMS_TA, il: CHOOSE_ITEMS_IL, check_path: $check_path).click
  end

  def select_size(key=nil)
    find_element(key, il_type: :xpath, tl: SELECT_SIZE_TA, il: SELECT_SIZE_IL, check_path: $check_path).click
    find_element(key, il_type: :xpath, tl: select_size_item(:ta), il: select_size_item(:il), check_path: $check_path).click
  end

  def set_quantity(key=nil, value)
    find_element(key, il_type: :xpath, tl: QUANTITY_FIELD_TA, il: QUANTITY_FIELD_IL, check_path: $check_path).set(value)
  end

  def add_to_card(key=nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_CARD_TA, il: ADD_TO_CARD_IL, check_path: $check_path).click
  end

end

