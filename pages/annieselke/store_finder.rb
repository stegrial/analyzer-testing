require 'spec_helper'
require_relative '../page_extension'

class StoreFinderPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension


  CITY_IL = "//input[@id='storelocator-query']"
  CITY_TA = "annieselke:home_page:store_finder_page:city_field"

  BRAND_IL = "//select[@name='brand']"
  BRAND_TA = "annieselke:home_page:store_finder_page:brand_select"

  SEARCH_BTN_IL = "//button[text()='Search']"
  SEARCH_BTN_TA = "annieselke:home_page:store_finder_page:search_btn"

  FIND_STORE_BTN_IL = "//a[text()='Find stores near me']"
  FIND_STORE_BTN_TA = "annieselke:home_page:store_finder_page:find_store_btn"

  def search_brand_item(key, name)
    locator_by key,
               "//select[@name='brand']/option[@value='#{name}']",
               "annieselke:home_page:store_finder_page:#{ta_name(name)}"
  end


  def set_city(key=nil, value)
    find_element_path(key, :xpath, CITY_TA, CITY_IL).set(value)
  end

  def click_dropdown_arrow_brand (key=nil)
    find_element_path(key, :xpath, BRAND_TA, BRAND_IL).click
  end

  def select_brand(key=nil, name)
    find_element_path(key, :xpath, search_brand_item(:ta, name), search_brand_item(:il, name)).click
  end

  def click_search_btn (key=nil)
    find_element_path(key, :xpath, SEARCH_BTN_TA, SEARCH_BTN_IL)
  end

  def click_find_store (key=nil)
    find_element_path(key, :xpath, FIND_STORE_BTN_TA, FIND_STORE_BTN_IL)
  end
end

