require_relative '../page_extension'

class WeeklyPageWalmart < PageExtension


  STORE_NAME_CITY_IL = ".store-name-city"
  STORE_NAME_CITY_TA = "walmart:weekly_page:store_name_city"

  FIND_ANOTHER_STORE_BTN_IL = "//button[text()='Find another store']"
  FIND_ANOTHER_STORE_BTN_TA = "walmart:weekly_page:find_another_store_btn"

  CURRENT_LOCATION_IL = ".current-location"
  CURRENT_LOCATION_TA = "walmart:weekly_page:current_location"

  NEAR_STORES_IL = "//section[contains(@class, 'current-location-container')]//p[contains(@data-automation-id, 'nearby-stores-text')]"
  NEAR_STORES_TA = "walmart:weekly_page:near_stores"

  FILTERS_IL = "//i[contains(@aria-label, 'Filters')]"
  FILTERS_TA = "walmart:weekly_page:filters"

  MAX_DISTANCE_IL = "//h6[contains(@class, 'js-sf-distance-title')]"
  MAX_DISTANCE_TA = "walmart:weekly_page:max_distance"

  DISTANCE_100_IL = "//div[contains(@class, 'radio-content') and text()='100']"
  DISTANCE_100_TA = "walmart:weekly_page:distance_100"

  CAKE_SERVICE_IL = "//span[@class='filter-icon-container']/i[contains(@class, 'elc-icon-cake')]"
  CAKE_SERVICE_TA = "walmart:weekly_page:cake_service"

  BACK_BTN_IL = "//button[contains(@class,'refine-close')]"
  BACK_BTN_TA = "walmart:weekly_page:back_btn"

  ZIP_CODE_INPUT_IL = "//input[@data-automation-id='searchbox-input']"
  ZIP_CODE_INPUT_TA = "walmart:weekly_page:zipcode"

  SET_LOCATION_IL = ".spin-button-children"
  SET_LOCATION_TA = "walmart:weekly_page:set_location_btn"


  def should_see_store_name_city(key = nil)
    element = find_element(key, il_type: :css, tl: STORE_NAME_CITY_TA, il: STORE_NAME_CITY_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_find_another_store_btn(key = nil)
    find_element(key, il_type: :xpath, tl: FIND_ANOTHER_STORE_BTN_TA, il: FIND_ANOTHER_STORE_BTN_IL, check_path: $check_path).click
  end

  def should_see_current_location(key = nil)
    element = find_element(key, il_type: :css, tl: CURRENT_LOCATION_TA, il: CURRENT_LOCATION_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_near_stores(key = nil)
    element = find_element(key, il_type: :xpath, tl: NEAR_STORES_TA, il: NEAR_STORES_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_filters_btn(key = nil)
    find_element(key, il_type: :xpath, tl: FILTERS_TA, il: FILTERS_IL, check_path: $check_path).click
  end

  def should_see_max_distance(key = nil)
    element = find_element(key, il_type: :xpath, tl: MAX_DISTANCE_TA, il: MAX_DISTANCE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_cake_service_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CAKE_SERVICE_TA, il: CAKE_SERVICE_IL, check_path: $check_path).click
  end

  def click_back_btn(key = nil)
    find_element(key, il_type: :xpath, tl: BACK_BTN_TA, il: BACK_BTN_IL, check_path: $check_path).click
  end

  def fill_zipcode_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: ZIP_CODE_INPUT_TA, il: ZIP_CODE_INPUT_IL, check_path: $check_path).set(value)
  end

  def click_set_location_btn(key = nil)
    find_element(key, il_type: :css, tl: SET_LOCATION_TA, il: SET_LOCATION_IL, check_path: $check_path).click
  end

end