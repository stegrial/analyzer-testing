require 'spec_helper'

class Booking

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  PLACE_INPUT_IL = "input#input_destination"
  PLACE_INPUT_TA = "booking:place_input"
  PLACE_INPUT_EP = "EP:booking:place_input"

  SEARCH_PLACE_INPUT_IL = "input#input_destination"
  SEARCH_PLACE_INPUT_TA = "booking:search_place_input"
  SEARCH_PLACE_INPUT_EP = "EP:booking:search_place_input"

  DEPARTURE_DATA_IL = "div#ci_date"
  DEPARTURE_DATA_TA = "booking:leave_data"
  DEPARTURE_DATA_EP = "EP:booking:leave_data"

  BACK_DATA_IL = "div#co_date"
  BACK_DATA_TA = "booking:back_data"
  BACK_DATA_EP = "EP:booking:back_data"

  SEARCH_BTN_IL = "button#submit_search"
  SEARCH_BTN_TA = "booking:search_btn"
  SEARCH_BTN_EP = "EP:booking:search_btn"

  SELECT_CITY_IL = "//li[@data-index='0']"
  SELECT_CITY_TA = "booking:select_city"
  SELECT_CITY_EP = "EP:booking:select_city"

  ACCEPT_IL = "(//button[@class='bui-button bui-button--primary'])[1]"
  ACCEPT_TA = "booking:accept"
  ACCEPT_EP = "EP:booking:accept"

  def click_place(key = nil)
    return find(ta(PLACE_INPUT_EP)).click if key ==:ep
    return find(:css, PLACE_INPUT_IL).click if key ==:il
    find(:css, ta(PLACE_INPUT_TA, PLACE_INPUT_IL)).click
  end

  def set_place(key = nil,value)
    return find(ta(SEARCH_PLACE_INPUT_EP)).set(value) if key ==:ep
    return find(:css, SEARCH_PLACE_INPUT_IL).set(value) if key ==:il
    find(:css, ta(SEARCH_PLACE_INPUT_TA, SEARCH_PLACE_INPUT_IL)).set(value)
  end

  def click_to_select_city(key = nil)
    return find(ta(SELECT_CITY_EP)).click if key ==:ep
    return find(:xpath, SELECT_CITY_IL).click if key ==:il
    find(:xpath, ta(SELECT_CITY_TA, SELECT_CITY_IL)).click
  end

  def click_to_select_departure_data(key = nil)
    return find(ta(FIRST_DATA_EP)).click() if key ==:ep
    return find(:css, FIRST_DATA_IL).click() if key ==:il
    find(:css, ta(FIRST_DATA_TA, FIRST_DATA_IL)).click()
  end

  def click_to_accept(key = nil)
    return find(ta(ACCEPT_EP)).click() if key ==:ep
    return find(:xpath, ACCEPT_IL).click() if key ==:il
    find(:xpath, ta(ACCEPT_TA, ACCEPT_IL)).click()
  end

  def click_search_btn(key = nil)
    return find(ta(SEARCH_BTN_EP)).click() if key ==:ep
    return find(:css, SEARCH_BTN_IL).click() if key ==:il
    find(:css, ta(SEARCH_BTN_TA, SEARCH_BTN_IL)).click()
  end

end