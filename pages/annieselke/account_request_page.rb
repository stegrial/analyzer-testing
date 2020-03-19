require 'spec_helper'
require_relative '../page_extension'

class Account_Request_Page
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  CLOSE_BANNER_BTN = "//button[@class='offer-control close']"

  COUNTRY_SELECT_IL = "//select[@name='countryIso']"
  COUNTRY_SELECT_TA = "annieselke:account_request_page:country_select"

  TITLE_SELECT_IL = "//select[@name='titleCode']"
  TITLE_SELECT_TA = "annieselke:account_request_page:title_select"

  FIRST_NAME_IL = "//input[@id='address.firstName']"
  FIRST_NAME_TA = "annieselke:account_request_page:first_name"

  LAST_NAME_IL = "//input[@id='address.surname']"
  LAST_NAME_TA = "annieselke:account_request_page:last_name"

  ADDRESS_LINE_IL = "//input[@id='address.line1']"
  ADDRESS_LINE_TA = "annieselke:account_request_page:address_line"

  CITY_FIELD_IL = "//input[@id='address.townCity']"
  CITY_FIELD_TA = "annieselke:account_request_page:city_field"

  STATE_REGION_IL = "//select[@name='regionIso']"
  STATE_REGION_TA = "annieselke:account_request_page:state_region"

  POST_CODE_IL = "//input[@id='address.postcode']"
  POST_CODE_TA =  "annieselke:account_request_page:post_code"

  TYPE_SALES_IL = "//select[@name='typeOfSales']"
  TYPE_SALES_TA = "annieselke:account_request_page:type_sales"

  COMPANY_IL = "//input[@id='request.company']"
  COMPANY_TA = "annieselke:account_request_page:company"

  PHONE_NUMBER_IL = "//input[@id='request.phoneNumber']"
  PHONE_NUMBER_TA = "annieselke:account_request_page:phone_number"

  EMAIL_IL = "//input[@id='request.emailAddress']"
  EMAIL_TA = "annieselke:account_request_page:email_request"

  WEBSITE_IL = "//input[@id='request.website']"
  WEBSITE_TA = "annieselke:account_request_page:website_request"

  RESALE_NUMBER_IL = "//input[@id='request.resaleNumber']"
  RESALE_NUMBER_TA = "annieselke:account_request_page:resale_number"

  ACCOUNT_REQUEST_BTN_IL = "//button[@class='primary']"
  ACCOUNT_REQUEST_BTN_TA = "annieselke:account_request_page:request_account_btn"

  def search_country_item(key, name)
    locator_by key,
               "//select[@name='countryIso']/option[@value='#{name}']",
               "annieselke:account_request_page:#{ta_name(name)}"
  end

  def search_title_item(key, name)
    locator_by key,
               "//select[@name='titleCode']/option[@value='#{name}']",
               "annieselke:account_request_page:#{ta_name(name)}"
  end

  def search_state_item(key, name)
    locator_by key,
               "//select[@name='regionIso']/option[@value='#{name}']",
               "annieselke:account_request_page:#{ta_name(name)}"
  end

  def search_type_sales_item(key, name)
    locator_by key,
               "//select[@name='typeOfSales']/option[@value='#{name}']",
               "annieselke:account_request_page:#{ta_name(name)}"
  end

  def click_dropdown_arrow_country (key=nil)
    move_to_tab
    find_element_path(key, :xpath, COUNTRY_SELECT_TA, COUNTRY_SELECT_IL).click
  end

  def select_dropdown_country(key=nil, name)
    find_element_path(key, :xpath, search_country_item(:ta, name), search_country_item(:il, name)).click
  end

  def click_dropdown_arrow_title (key=nil)
    find_element_path(key, :xpath, TITLE_SELECT_TA, TITLE_SELECT_IL).click
  end

  def select_dropdown_title(key=nil, name)
    find_element_path(key, :xpath, search_title_item(:ta, name), search_title_item(:il, name)).click
  end

  def fill_first_name(key = nil, value)
    find_element_path(key, :xpath, FIRST_NAME_TA, FIRST_NAME_IL).set(value)
  end

  def fill_last_name(key = nil, value)
    find_element_path(key, :xpath, LAST_NAME_TA, LAST_NAME_IL).set(value)
  end

  def fill_address_line(key = nil, value)
    find_element_path(key, :xpath, ADDRESS_LINE_TA, ADDRESS_LINE_IL).set(value)
  end

  def fill_city(key = nil, value)
    find_element_path(key, :xpath, CITY_FIELD_TA, CITY_FIELD_IL).set(value)
  end

  def fill_post_code(key = nil, value)
    find_element_path(key, :xpath, POST_CODE_TA, POST_CODE_IL).set(value)
  end
  def click_dropdown_arrow_state (key=nil)
    find_element_path(key, :xpath, STATE_REGION_TA, STATE_REGION_IL).click
  end

  def select_dropdown_state(key=nil, name)
    find_element_path(key, :xpath, search_state_item(:ta, name), search_state_item(:il, name)).click
  end

  def click_dropdown_arrow_sales (key=nil)
    find_element_path(key, :xpath, TYPE_SALES_TA, TYPE_SALES_IL).click
  end

  def select_dropdown_sales_types(key=nil, name)
    find_element_path(key, :xpath, search_type_sales_item(:ta, name), search_type_sales_item(:il, name)).click
  end

  def fill_company(key = nil, value)
    find_element_path(key, :xpath, COMPANY_TA, COMPANY_IL).set(value)
  end

  def fill_phone(key = nil, value)
    find_element_path(key, :xpath, PHONE_NUMBER_TA, PHONE_NUMBER_IL).set(value)
  end

  def fill_email(key = nil, value)
    find_element_path(key, :xpath, WEBSITE_TA, WEBSITE_IL).set(value)
  end

  def fill_resale_number(key = nil, value)
    find_element_path(key, :xpath, RESALE_NUMBER_TA, RESALE_NUMBER_IL).set(value)
  end

  def click_request_account(key=nil)
    find_element_path(key, :xpath, ACCOUNT_REQUEST_BTN_TA, ACCOUNT_REQUEST_BTN_IL).click
  end

  def move_to_tab
    window = page.driver.browser.window_handles
    page.driver.browser.switch_to.window(window.last)
  end
end

