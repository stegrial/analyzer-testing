require 'spec_helper'
require_relative '../page_extension'

class Shipping

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  SHIPPING_DROPDOWN_IL = ".gep-switcher"
  SHIPPING_DROPDOWN_TA = "planetblue:shipping:country_dropdown"

  def find_shipping_dropdown(key = nil)
    find_element_path key, :css, SHIPPING_DROPDOWN_TA, SHIPPING_DROPDOWN_IL
  end

  def click_shipping_dropdown(key = nil)
    find_shipping_dropdown(key).click
  end

  COUNTRY_DROPDOWN_IL = "#gle_selectedCountry"
  COUNTRY_DROPDOWN_TA = "planetblue:shipping:country_dropdown"

  def select_country(key = nil, name)
    find_element_path(key, :css, COUNTRY_DROPDOWN_TA, COUNTRY_DROPDOWN_IL).first(:option, name).select_option
  end

  CURRENCY_DROPDOWN_IL = "#gle_selectedCurrency"
  CURRENCY_DROPDOWN_TA = "planetblue:shipping:currency_dropdown"

  def select_currency(key = nil, name)
    find_element_path(key, :css, CURRENCY_DROPDOWN_TA, CURRENCY_DROPDOWN_IL).first(:option, name).select_option
  end

  SAVE_BUTTON_IL = "[data-key='SavenClose']"
  SAVE_BUTTON_TA = "planetblue:shipping:save_button"

  def click_save_button(key = nil)
    find_element_path(key, :css, SAVE_BUTTON_TA, SAVE_BUTTON_IL).click
  end

end