require_relative '../page_extension'

class TheTiebarCheckoutPage < PageExtension

  GUEST_CHECKOUT_IL = "(//button[contains(@id, 'Guest')])[1]"
  GUEST_CHECKOUT_TA = "thetiebar:checkout_page:guest_checkout"

  GUEST_EMAIL_IL = "(//input[contains(@id, 'emailFieldGuest')])[1]"
  GUEST_EMAIL_TA = "thetiebar:checkout_page:guest_mail"

  CONTINUE_AS_GUEST_IL = "(//button[contains(@id, 'emailButton')])[1]"
  CONTINUE_AS_GUEST_TA = "thetiebar:checkout_page:continue_as_guest"

  FIRST_NAME_IL = "//input[contains(@id, 'firstName')]"
  FIRST_NAME_TA = "thetiebar:checkout_page:first_name"

  LAST_NAME_IL = "//input[contains(@id, 'lastName')]"
  LAST_NAME_TA = "thetiebar:checkout_page:last_name"

  COMPANY_IL = "//input[contains(@id, 'company')]"
  COMPANY_TA = "thetiebar:checkout_page:company"

  COUNTRY_FIELD_IL = "//select[contains(@id, 'countrySelect')]"
  COUNTRY_FIELD_TA = "thetiebar:checkout_page:country"

  ADDRESS_FIELD_IL = "//input[contains(@id, 'shippingAddress1')]"
  ADDRESS_FIELD_TA = "thetiebar:checkout_page:address"

  ADDRESS_TWO_FIELD_IL = "//input[@id='shippingAddress2']"
  ADDRESS_TWO_FIELD_TA = "thetiebar:checkout_page:address_two"

  CITY_FIELD_IL = "//input[@id='CityInput']"
  CITY_FIELD_TA = "thetiebar:checkout_page:city"

  STATE_FIELD_IL = "//select[@id='stateSelect']"
  STATE_FIELD_TA = "thetiebar:checkout_page:state"

  ZIP_FIELD_IL = "//input[@id='ZipInput']"
  ZIP_FIELD_TA = "thetiebar:checkout_page:zip"

  PHONE_FIELD_IL = "//input[@id='phone']"
  PHONE_FIELD_TA = "thetiebar:checkout_page:phone"

  CONTINUE_TO_PAY_BTN_IL = "//button[contains(text(), 'Continue to Pay ›')]"
  CONTINUE_TO_PAY_BTN_TA = "thetiebar:checkout_page:continue_to_pay_btn"

  USE_ENTERED_ADDRESS_IL = "(//input[contains(@id, 'entered-address')])[1]"
  USE_ENTERED_ADDRESS_TA = "thetiebar:checkout_page:use_address"

  CONTINUE_BTN_IL = "//button[text()='Continue']"
  CONTINUE_BTN_TA = "thetiebar:checkout_page:continue_btn"

  CREDIT_CARD_IL = "(//input[contains(@id, 'cardNumber')])[1]"
  CREDIT_CARD_TA = "thetiebar:checkout_page:credit_card"

  EXP_MONTH_IL = "(//input[contains(@id, 'expirationMonth')])[1]"
  EXP_MONTH_TA = "thetiebar:checkout_page:exp_month"

  EXP_YEAR_IL = "(//input[contains(@id, 'expirationYear')])[1]"
  EXP_YEAR_TA = "thetiebar:checkout_page:exp_year"

  BILLING_ZIP_IL = "(//input[contains(@id, 'billingZip')])[1]"
  BILLING_ZIP_TA = "thetiebar:checkout_page:billing_zip"

  CVC_CVV_IL = "(//input[contains(@id, 'cvv')])[1]"
  CVC_CVV_TA = "thetiebar:checkout_page:cvc_cvv"

  CONTINUE_TO_REVIEW_BTN_IL = "//button[text()='Continue to Review ›']"
  CONTINUE_TO_REVIEW_BTN_TA = "thetiebar:checkout_page:continue_btn"

  PLACE_ORDER_BTN_IL = "//span[text()='Place Order']"
  PLACE_ORDER_BTN_TA = "thetiebar:checkout_page:place_order_btn"


  def fill_first_name(key = nil, value)
    find_element(key, il_type: :xpath, tl: FIRST_NAME_TA, il: FIRST_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_last_name(key = nil, value)
    find_element(key, il_type: :xpath, tl: LAST_NAME_TA, il: LAST_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_company(key = nil, value)
    find_element(key, il_type: :xpath, tl: COMPANY_TA, il: COMPANY_IL, check_path: $check_path).set(value)
  end

  def fill_country_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: COUNTRY_FIELD_TA, il: COUNTRY_FIELD_IL, check_path: $check_path).select(value)
  end

  def fill_address_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: ADDRESS_FIELD_TA, il: ADDRESS_FIELD_IL, check_path: $check_path).set(value)
  end

  def fill_address_two_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: ADDRESS_TWO_FIELD_TA, il: ADDRESS_TWO_FIELD_IL, check_path: $check_path).set(value)
  end

  def fill_city_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: CITY_FIELD_TA, il: CITY_FIELD_IL, check_path: $check_path).set(value)
  end

  def fill_state_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: STATE_FIELD_TA, il: STATE_FIELD_IL, check_path: $check_path).select(value)
  end

  def fill_zip_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: ZIP_FIELD_TA, il: ZIP_FIELD_IL, check_path: $check_path).set(value)
  end

  def fill_phone_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: PHONE_FIELD_TA, il: PHONE_FIELD_IL, check_path: $check_path).set(value)
  end

  def click_continue_to_pay_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CONTINUE_TO_PAY_BTN_TA, il: CONTINUE_TO_PAY_BTN_IL, check_path: $check_path).click
  end

  def click_use_entered_address(key = nil)
    find_element(key, il_type: :xpath, tl: USE_ENTERED_ADDRESS_TA, il: USE_ENTERED_ADDRESS_IL, check_path: $check_path).click
  end

  def click_continue_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CONTINUE_BTN_TA, il: CONTINUE_BTN_IL, check_path: $check_path).click
  end

  def fill_credit_card_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: CREDIT_CARD_TA, il: CREDIT_CARD_IL, check_path: $check_path).set(value)
  end

  def fill_exp_month_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: EXP_MONTH_TA, il: EXP_MONTH_IL, check_path: $check_path).set(value)
  end

  def fill_exp_year_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: EXP_YEAR_TA, il: EXP_YEAR_IL, check_path: $check_path).set(value)
  end

  def fill_billing_zip_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: BILLING_ZIP_TA, il: BILLING_ZIP_IL, check_path: $check_path).set(value)
  end

  def fill_cvc_cvv_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: CVC_CVV_TA, il: CVC_CVV_IL, check_path: $check_path).set(value)
  end

  def click_continue_to_review(key = nil)
    find_element(key, il_type: :xpath, tl: CONTINUE_TO_REVIEW_BTN_TA, il: CONTINUE_TO_REVIEW_BTN_IL, check_path: $check_path).click
  end

  def click_place_to_order(key = nil)
    find_element(key, il_type: :xpath, tl: PLACE_ORDER_BTN_TA, il: PLACE_ORDER_BTN_IL, check_path: $check_path).click
  end

  def click_guest_checkout(key = nil)
    find_element(key, il_type: :xpath, tl: GUEST_CHECKOUT_TA, il: GUEST_CHECKOUT_IL, check_path: $check_path).click
  end

  def fill_guest_email(key = nil, value)
    find_element(key, il_type: :xpath, tl: GUEST_EMAIL_TA, il: GUEST_EMAIL_IL, check_path: $check_path).set(value)
  end

  def click_continue_as_guest(key = nil)
    find_element(key, il_type: :xpath, tl: CONTINUE_AS_GUEST_TA, il: CONTINUE_AS_GUEST_IL, check_path: $check_path).click
  end

end
