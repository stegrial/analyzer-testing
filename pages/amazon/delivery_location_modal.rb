require_relative '../page_extension'

class DeliveryLocationModal < PageExtension


  CHOOSE_LOCATION_TEXT_IL = "//*[contains(@id,'a-popover-header-3') and text()='Choose your location']"
  CHOOSE_LOCATION_TEXT_TA = "amazon:location_modal:choose_location_text"

  SIGNIN_TO_SEE_ADDRESSES_IL = "//input[@aria-label='Sign in to see your addresses']"
  SIGNIN_TO_SEE_ADDRESSES_TA = "amazon:location_modal:signin_to_see_addresses_btn"

  ZIP_CODE_INPUT_IL = "#GLUXZipUpdateInput"
  ZIP_CODE_INPUT_TA = "amazon:location_modal:zip_code_input"

  OPEN_COUNTRY_DROPDOWN_IL = "#GLUXCountryValue"
  OPEN_COUNTRY_DROPDOWN_TA = "amazon:location_modal:country_dropdown"

  APPLY_BTN_IL = "#GLUXZipUpdate-announce"
  APPLY_BTN_TA = "amazon:location_modal:apply_btn"

  SELECT_VIETNAM_IL = "//a[text()='Vietnam']"
  SELECT_VIETNAM_TA = "amazon:location_modal:vietnam"

  DONE_BTN_IL = "//button[@name='glowDoneButton']"
  DONE_BTN_TA = "amazon:location_modal:done_btn"


  def should_see_choose_location_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: CHOOSE_LOCATION_TEXT_TA, il: CHOOSE_LOCATION_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_delivery_location_btn(key = nil)
    find_element(key, il_type: :xpath, tl: DELIVERY_BTN_TA, il: DELIVERY_BTN_IL, check_path: $check_path).click
  end

  def should_see_signin_addresses_btn(key = nil)
    element = find_element(key, il_type: :xpath, tl: SIGNIN_TO_SEE_ADDRESSES_TA, il: SIGNIN_TO_SEE_ADDRESSES_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_zip_code_input(key = nil, value)
    find_element(key, il_type: :css, tl: ZIP_CODE_INPUT_TA, il: ZIP_CODE_INPUT_IL, check_path: $check_path).set(value)
  end

  def click_country_dropdown(key = nil)
    find_element(key, il_type: :css, tl: OPEN_COUNTRY_DROPDOWN_TA, il: OPEN_COUNTRY_DROPDOWN_IL, check_path: $check_path).click
  end

  def select_vietnam_from_list(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_VIETNAM_TA, il: SELECT_VIETNAM_IL, check_path: $check_path).click
  end

  def should_see_apply_btn(key = nil)
    element = find_element(key, il_type: :css, tl: APPLY_BTN_TA, il: APPLY_BTN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_done_btn(key = nil)
    find_element(key, il_type: :xpath, tl: DONE_BTN_TA, il: DONE_BTN_IL, check_path: $check_path).click
  end

end
