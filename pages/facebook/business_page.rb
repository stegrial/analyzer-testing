require_relative '../page_extension'

class BusinessPageFacebook < PageExtension


  GET_STARTED_BUSINESS_IL = "(//div[contains(text(), 'Get Started')])[1]"
  GET_STARTED_BUSINESS_TA = "facebook:business_page:get_started_business"

  PAGE_NAME_IL  = "#BUSINESS_SUPERCATEGORYPageNameInput"
  PAGE_NAME_TA = "facebook:business_page:page_name"

  ADD_A_CATEGORY_IL = "(//input[contains(@placeholder, 'Add a category')])[1]"
  ADD_A_CATEGORY_TA = "facebook:business_page:add_a_category"

  TEST_PREPARATION_CENTER_IL = "//div[contains(@class, 'uiContextualLayerBelowLeft')]//span[text()='Test Preparation Center']"
  TEST_PREPARATION_CENTER_TA = "facebook:business_page:test_preparation_center"

  PAGE_ADDRESS_IL = "#pageAddress"
  PAGE_ADDRESS_TA = "facebook:business_page:page_address"

  CITY_ADDRESS_IL = "//span[@initialvalue='City, State']//input"
  CITY_ADDRESS_TA = "facebook:business_page:city_address"

  ZIP_CODE_IL = "#pageZipCode"
  ZIP_CODE_TA = "facebook:business_page:zip_code"

  DO_NOT_SHOW_MY_ADDRESS_IL = "(//label/button)[1]"
  DO_NOT_SHOW_MY_ADDRESS_TA = "facebook:business_page:dont_show_address_checkbox"

  CONTINUE_BTN_IL = "(//button//div[contains(text(), 'Continue')])[1]"
  CONTINUE_BTN_TA = "facebook:business_page:continue_btn"

  BUSINESS_OR_BRAND_TEXT_IL = "(//span[contains(text(),'Business or Brand')])[2]"
  BUSINESS_OR_BRAND_TEXT_TA = "facebook:business_page:business_or_brand_text"

  PHONE_NUMBER_IL = "#pagePhoneNumber"
  PHONE_NUMBER_TA = "facebook:business_page:phone_number"

  ERROR_TEXT_IL = "//div[contains(text(), 'Please correct the highlighted fields.')]"
  ERROR_TEXT_TA = "facebook:business_page:error_text"

   def click_get_started_business_btn(key = nil)
    find_element(key, il_type: :xpath, tl: GET_STARTED_BUSINESS_TA, il: GET_STARTED_BUSINESS_IL, check_path: $check_path).click
  end

  def fill_page_name(key = nil, value)
    find_element(key, il_type: :css, tl: PAGE_NAME_TA, il: PAGE_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_add_a_category(key = nil, value)
    find_element(key, il_type: :xpath, tl: ADD_A_CATEGORY_TA, il: ADD_A_CATEGORY_IL, check_path: $check_path).set(value)
  end

  def click_test_preparation_center(key = nil)
    find_element(key, il_type: :xpath, tl: TEST_PREPARATION_CENTER_TA, il: TEST_PREPARATION_CENTER_IL, check_path: $check_path).click
  end

  def fill_page_address(key = nil, value)
    find_element(key, il_type: :css, tl: PAGE_ADDRESS_TA, il: PAGE_ADDRESS_IL, check_path: $check_path).set(value)
  end

  def fill_city_address(key = nil, value)
    find_element(key, il_type: :xpath, tl: CITY_ADDRESS_TA, il: CITY_ADDRESS_IL, check_path: $check_path).set(value)
  end

  def fill_zip_code(key = nil, value)
    find_element(key, il_type: :css, tl: ZIP_CODE_TA, il: ZIP_CODE_IL, check_path: $check_path).set(value)
  end

  def click_dont_show_address(key = nil)
    find_element(key, il_type: :xpath, tl: DO_NOT_SHOW_MY_ADDRESS_TA, il: DO_NOT_SHOW_MY_ADDRESS_IL, check_path: $check_path).click
  end

  def click_continue_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CONTINUE_BTN_TA, il: CONTINUE_BTN_IL, check_path: $check_path).click
  end

  def should_see_error_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: ERROR_TEXT_TA, il: ERROR_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_business_or_brand_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: BUSINESS_OR_BRAND_TEXT_TA, il: BUSINESS_OR_BRAND_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_phone_number(key = nil, value)
    find_element(key, il_type: :css, tl: PHONE_NUMBER_TA, il: PHONE_NUMBER_IL, check_path: $check_path).set(value)
  end

end