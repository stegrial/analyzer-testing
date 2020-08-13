require_relative '../page_extension'

class PickupAndDeliveryPageWalmart < PageExtension


  CLOSE_BTN_IL = "//button[@data-automation-id='onboardingModalCloseBtn']"
  CLOSE_BTN_TA = "walmart:delivery_page:close_btn"

  EXPLORE_THE_SITE_IL = "//div[@data-automation-id='explore-the-site']"
  EXPLORE_THE_SITE_TA = "walmart:delivery_page:explore_the_site"

  FIND_NEAR_STORES_IL= "//div[@data-automation-id='FulfillmentBannerTitle-NoLocation']"
  FIND_NEAR_STORES_TA= "walmart:delivery_page:find_nearby_stores"

  CHANGE_STORES_LINK_IL = "//button[@data-automation-id='fulfillmentBannerBtn']"
  CHANGE_STORES_LINK_TA = "walmart:delivery_page:change_stores"

  LOCATIONS_H2_IL = "//h2[text()='Locations']"
  LOCATIONS_H2_TA = "walmart:delivery_page:locations_h2"

  CLOSE_LOCATIONS_MODAL_IL = "//button[@data-automation-id='flyout-close']"
  CLOSE_LOCATIONS_MODAL_TA = "walmart:delivery_page:close_locations"

  RESERVE_TIME_SLOT_IL = "//div[contains(@data-automation-id, 'reservationTextDetail')]"
  RESERVE_TIME_SLOT_TA = "walmart:delivery_page:reserve_time_slot"

  SEE_TIMES_BTN_IL = "//a[contains(@data-automation-id, 'signInLink') and text()='See times']"
  SEE_TIMES_BTN_TA = "walmart:delivery_page:see_times"

  CART_HEADER_IL = "//h2[contains(@data-automation-id, 'cartHeader')]"
  CART_HEADER_TA = "walmart:delivery_page:cart_header"

  YOUR_CART_IS_EMPTY_TEXT_IL = "//div[contains(text(), 'Your cart is currently empty.')]"
  YOUR_CART_IS_EMPTY_TEXT_TA = "walmart:delivery_page:your_cart_is_empty"

  ADD_ITEMS_BTN_IL = "//button[contains(@data-automation-id, 'favoritesLink')]"
  ADD_ITEMS_BTN_TA = "walmart:delivery_page:add_items_btn"

  CHECKOUT_BTN_IL = "//button[contains(@data-automation-id, 'checkoutBtn')]"
  CHECKOUT_BTN_TA = "walmart:delivery_page:checkout_btn"

  SUBTOTAL_IL = "//span[contains(text(), 'Subtotal')]"
  SUBTOTAL_TA = "walmart:delivery_page:subtotal"


  def click_close_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_BTN_TA, il: CLOSE_BTN_IL, check_path: $check_path).click
  end

  def click_explore_the_site(key = nil)
    find_element(key, il_type: :xpath, tl: EXPLORE_THE_SITE_TA, il: EXPLORE_THE_SITE_IL, check_path: $check_path).click
  end

  def should_see_find_nearby_stores(key = nil)
    element = find_element(key, il_type: :xpath, tl: FIND_NEAR_STORES_TA, il: FIND_NEAR_STORES_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_change_stores(key = nil)
    find_element(key, il_type: :xpath, tl: CHANGE_STORES_LINK_TA, il: CHANGE_STORES_LINK_IL, check_path: $check_path).click
  end

  def should_see_locations_h2(key = nil)
    element = find_element(key, il_type: :xpath, tl: LOCATIONS_H2_TA, il: LOCATIONS_H2_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_close_locations(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_LOCATIONS_MODAL_TA, il: CLOSE_LOCATIONS_MODAL_IL, check_path: $check_path).click
  end

  def should_see_reserve_time_slot(key = nil)
    element = find_element(key, il_type: :xpath, tl: RESERVE_TIME_SLOT_TA, il: RESERVE_TIME_SLOT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_see_times_btn(key = nil)
    element = find_element(key, il_type: :xpath, tl: SEE_TIMES_BTN_TA, il: SEE_TIMES_BTN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_cart_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: CART_HEADER_TA, il: CART_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_cart_is_empty_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: YOUR_CART_IS_EMPTY_TEXT_TA, il: YOUR_CART_IS_EMPTY_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_add_items_btn(key = nil)
    element = find_element(key, il_type: :xpath, tl: ADD_ITEMS_BTN_TA, il: ADD_ITEMS_BTN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_subtotal_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: SUBTOTAL_TA, il: SUBTOTAL_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_checkout_btn(key = nil)
    element = find_element(key, il_type: :xpath, tl: CHECKOUT_BTN_TA, il: CHECKOUT_BTN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
