require 'spec_helper'
require_relative '../page_extension'

class ShippingPage < PageExtension

  FIRST_NAME_FIELD_IL = "#ctl00_checkoutBodyContent_txtFirstName"
  FIRST_NAME_FIELD_IL = 'venus:shipping_page:first_name_field'

  LAST_NAME_FIELD_IL = "#ctl00_checkoutBodyContent_txtLastName"
  LAST_NAME_FIELD_IL = 'venus:shipping_page:last_name_field'

  COUNTRY_FIELD_IL = "#ctl00_checkoutBodyContent_ddlCountry"
  COUNTRY_FIELD_TA = 'venus:shipping_page:country_field'

  ADDRESS_LINE_FIELD_IL = "#ctl00_checkoutBodyContent_txtAddress1"
  ADDRESS_LINE_FIELD_TA = 'venus:shipping_page:address_line_field'

  ADDRESS_LINE_OPTIONAL_FIELD_IL = "#ctl00_checkoutBodyContent_txtAddress2"
  ADDRESS_LINE_OPTIONAL_FIELD_TA = 'venus:shipping_page:address_optional_line_field'

  CITY_FIELD_IL = "#ctl00_checkoutBodyContent_txtCity"
  CITY_FIELD_TA = 'venus:shipping_page:city_field'

  STATE_FIELD_IL = "#ctl00_checkoutBodyContent_ddlState"
  STATE_FIELD_TA = 'venus:shipping_page:state_field'

  POSTAL_CODE_FIELD_IL = "#ctl00_checkoutBodyContent_txtPostalCode"
  POSTAL_CODE_FIELD_TA = 'venus:shipping_page:postal_code_field'

  PHONE_FIELD_IL = "#ctl00_checkoutBodyContent_txtDayPhone"
  PHONE_FIELD_TA = 'venus:shipping_page:phone_field'

  SHIPPING_OPTION_SELECTOR_IL = "shipping-option-selector"
  SHIPPING_OPTION_SELECTOR_TA = 'venus:shipping_page:shipping_option_selector'

  BILLING_BUTTON_IL = "#ctl00_checkoutBodyContent_btnContinueToBilling"
  BILLING_BUTTON_TA = "venus:shipping_page:billing_button"


  def should_see_first_name_field(key = nil)
    element = find_element(key, il_type: :css, tl: FIRST_NAME_FIELD_TA, il: FIRST_NAME_FIELD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_last_name_field(key = nil)
    element = find_element(key, il_type: :css, tl: FIRST_NAME_FIELD_TA, il: FIRST_NAME_FIELD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_country_field(key = nil)
    element = find_element(key, il_type: :css, tl: COUNTRY_FIELD_TA, il: COUNTRY_FIELD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_address_line_field(key = nil)
    element = find_element(key, il_type: :css, tl: ADDRESS_LINE_FIELD_TA, il: ADDRESS_LINE_FIELD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_address_line_optional_field(key = nil)
    element = find_element(key, il_type: :css, tl: ADDRESS_LINE_OPTIONAL_FIELD_TA, il: ADDRESS_LINE_OPTIONAL_FIELD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_city_field(key = nil)
    element = find_element(key, il_type: :css, tl: CITY_FIELD_TA, il: CITY_FIELD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_state_field(key = nil)
    element = find_element(key, il_type: :css, tl: STATE_FIELD_TA, il: STATE_FIELD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_postal_code_field(key = nil)
    element = find_element(key, il_type: :css, tl: POSTAL_CODE_FIELD_TA, il: POSTAL_CODE_FIELD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_shipping_option_selector(key = nil)
    element = find_element(key, il_type: :css, tl: SHIPPING_OPTION_SELECTOR_TA, il: SHIPPING_OPTION_SELECTOR_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_phone_field(key = nil)
    element = find_element(key, il_type: :css, tl: PHONE_FIELD_TA, il: PHONE_FIELD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_billing_button(key = nil)
    element = find_element(key, il_type: :css, tl: BILLING_BUTTON_TA, il: BILLING_BUTTON_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end