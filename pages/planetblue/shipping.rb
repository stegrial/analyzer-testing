require_relative '../page_extension'

class Shipping < PageExtension

  SHIPPING_DROPDOWN_IL = ".gep-switcher"
  SHIPPING_DROPDOWN_TA = "planetblue:shipping:country_dropdown"

  COUNTRY_DROPDOWN_IL = "#gle_selectedCountry"
  COUNTRY_DROPDOWN_TA = "planetblue:shipping:country_dropdown"

  CURRENCY_DROPDOWN_IL = "#gle_selectedCurrency"
  CURRENCY_DROPDOWN_TA = "planetblue:shipping:currency_dropdown"

  SAVE_BUTTON_IL = "[data-key='SavenClose']"
  SAVE_BUTTON_TA = "planetblue:shipping:save_button"

  def click_shipping_dropdown(key = nil)
    find_element(key, il_type: :css, tl: SHIPPING_DROPDOWN_TA, il: SHIPPING_DROPDOWN_IL, check_path: $check_path).click
  end

  def select_country(key = nil, name)
    find_element(key, il_type: :css, tl: COUNTRY_DROPDOWN_TA, il: COUNTRY_DROPDOWN_IL, check_path: $check_path).first(:option, name).select_option
  end

  def select_currency(key = nil, name)
    find_element(key, il_type: :css, tl: CURRENCY_DROPDOWN_TA, il: CURRENCY_DROPDOWN_IL, check_path: $check_path).first(:option, name).select_option
  end

  def click_save_button(key = nil)
    find_element(key, il_type: :css, tl: SAVE_BUTTON_TA, il: SAVE_BUTTON_IL, check_path: $check_path).click
  end

end