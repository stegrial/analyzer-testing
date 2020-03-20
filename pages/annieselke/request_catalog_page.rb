require 'spec_helper'
require_relative '../page_extension'

class RequestCatalogPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  FIRST_NAME_IL = "//input[@id='first_name']"
  FIRST_NAME_TA = "annieselke:account_request_page:request_catalog_page:first_name"

  LAST_NAME_IL = "//input[@id='last_name']"
  LAST_NAME_TA = "annieselke:account_request_page:request_catalog_page:last_name"

  EMAIL_IL = "//input[@id='email']"
  EMAIL_TA = "annieselke:account_request_page:request_catalog_page:email"

  ADDRESS_IL = "//input[@id='address']"
  ADDRESS_TA = "annieselke:account_request_page:request_catalog_page:address"

  CITY_IL = "//input[@id='city']"
  CITY_TA = "annieselke:account_request_page:request_catalog_page:city"

  STATE_IL = "//select[@name='state']"
  STATE_TA = "annieselke:account_request_page:state"

  ZIP_CODE_IL = "//input[@id='post']"
  ZIP_CODE_TA = "annieselke:account_request_page:zip_code"

  ADD_EMAIL_LIST_IL = "//label[@id='emailSignUp']"
  ADD_EMAIL_LIST_TA = "annieselke:account_request_page:add_checkbox"

  REQUEST_CATALOG_BTN_IL = "//button[text()='Request a Catalog']"
  REQUEST_CATALOG_BTN_TA = "annieselke:account_request_page:request_catalog_btn"


  def fill_first_name(key = nil, value)
    find_element_path(key, :xpath, FIRST_NAME_TA, FIRST_NAME_IL).set(value)
  end

  def fill_last_name(key = nil, value)
    find_element_path(key, :xpath, LAST_NAME_TA, LAST_NAME_IL).set(value)
  end

  def fill_email(key = nil, value)
    find_element_path(key, :xpath, EMAIL_TA, EMAIL_IL).set(value)
  end

  def fill_address(key = nil, value)
    find_element_path(key, :xpath, ADDRESS_TA, ADDRESS_IL).set(value)
  end

  def fill_city(key = nil, value)
    find_element_path(key, :xpath, CITY_TA, CITY_IL).set(value)
  end

  def search_state_item(key, name)
    locator_by key,
               "//select[@name='state']/option[@value='#{name}']",
               "annieselke:request_catalog_page:#{ta_name(name)}"
  end

  def click_dropdown_arrow_state(key=nil)
    find_element_path(key, :xpath, STATE_TA, STATE_IL).click
  end

  def select_dropdown_state(key=nil, name)
    find_element_path(key, :xpath, search_state_item(:ta, name), search_state_item(:il, name)).click
  end

  def fill_zip_code(key = nil, value)
    find_element_path(key, :xpath, ZIP_CODE_TA, ZIP_CODE_IL).set(value)
  end

  def click_request_catalog(key=nil)
    find_element_path(key, :xpath, REQUEST_CATALOG_BTN_TA, REQUEST_CATALOG_BTN_IL).click
  end

  def click_add_email(key=nil)
    find_element_path(key, :xpath, ADD_EMAIL_LIST_TA, ADD_EMAIL_LIST_IL).click
  end
end

