require 'spec_helper'
require_relative '../page_extension'

class Menu

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  MENU_BUTTON_IL = "[aria-label='Menu']"
  MENU_BUTTON_TA = "planetblue:menu:menu_button"

  def click_menu_button(key = nil)
    find_element_path(key, :css, MENU_BUTTON_TA, MENU_BUTTON_IL).click
  end

  def menu_category(key, name)
    locator_by key, "//div[@role='button']/div[text()='#{name}']",
               "planetblue:menu:menu_button:#{ta_name(name)}"
  end

  def click_menu_category(key = nil, name)
    find_element_path(key, :xpath, menu_category(:ta, name), menu_category(:il, name)).click
  end

  def menu_item(key, name)
    locator_by key, "//a[contains(@href, '/pages/') and text()='#{name}']",
               "planetblue:menu:menu_item:#{ta_name(name)}"
  end

  def click_menu_item(key = nil, name)
    find_element_path(key, :xpath, menu_item(:ta, name), menu_item(:il, name)).click
  end

  SEARCH_BUTTON_IL = "button[aria-label='Search']"
  SEARCH_BUTTON_TA = "planetblue:menu:search_button"

  def click_search_button(key = nil)
    find_element_path(key, :css, SEARCH_BUTTON_TA, SEARCH_BUTTON_IL).click
  end

  SEARCH_FIELD_IL = "input[aria-label='Search']"
  SEARCH_FIELD_TA = "planetblue:menu:search_field"

  def fill_search_field(key = nil, value)
    find_element_path(key, :css, SEARCH_FIELD_TA, SEARCH_FIELD_IL).fill_in with: value
  end

  def search_item(key, name)
    locator_by key, "//p[text() = 'Search Suggestions']/../ul/li//span[text()='#{name}']",
               "planetblue:menu:search_item:#{ta_name(name)}"
  end

  def click_search_item(key = nil, name)
    find_element_path(key, :xpath, search_item(:ta, name), search_item(:il, name)).click
  end

end