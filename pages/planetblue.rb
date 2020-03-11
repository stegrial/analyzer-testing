require 'spec_helper'
require_relative 'page_extension'

class PlanetBlue

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  MENU_BUTTON_IL = "[aria-label='Menu']"
  MENU_BUTTON_TA = "planetblue:menu_button"

  SEARCH_BUTTON_IL = "button[aria-label='Search']"
  SEARCH_BUTTON_TA = "planetblue:search_button"

  SEARCH_FIELD_IL = "input[aria-label='Search']"
  SEARCH_FIELD_TA = "planetblue:search_field"

  def search_item(key, name)
    locator_by key,
               "//p[text() = 'Search Suggestions']/../ul/li//span[text()='#{name}']",
               "planetblue:search_item:#{ta_name(name)}"
  end

  def menu_category(key, name)
    locator_by key,
               "//div[@role='button']/div[text()='#{name}']",
               "planetblue:menu_button:#{ta_name(name)}"
  end

  def menu_item(key, name)
    locator_by key,
               "//a[contains(@href, '/pages/') and text()='#{name}']",
               "planetblue:menu_item:#{ta_name(name)}"
  end

  def category_dropdown(key, name)
    locator_by key,
               "//div[@style='align-items: center; flex-direction: row;']//button//span[text()='#{name}']",
               "planetblue:category_dropdown:#{ta_name(name)}"
  end

  def collection_item(name, link = nil)
    return "//li//a[@aria-label='#{name}']//ancestor::li" if link != nil
    "//li//a[contains(@href, '#{link}')]//ancestor::li"
  end

  def collection_item_by_link(key, name, link)
    locator_by key,
               "#{collection_item name, link: link}//a[@data-th='product-link']",
               "planetblue:collection_item:#{ta_name(name)}_by_link_#{ta_name(link)}"
  end

  def collection_item_link(key, name)
    locator_by key,
               "#{collection_item name}//ancestor::div[@style='align-items: stretch; flex-direction: column;']",
               "planetblue:collection_item:#{ta_name(name)}:link"
  end

  def collection_item_title(key, name)
    locator_by key,
               "#{collection_item name}//div[text()='#{name}']",
               "planetblue:collection_item:#{ta_name(name)}:title"
  end

  def collection_item_image(key, name)
    locator_by key,
               "#{collection_item name}//img[@alt='#{name}']",
               "planetblue:collection_item:#{ta_name(name)}:image"
  end

  def collection_item_price(key, name)
    locator_by key,
               "#{collection_item name}//span[contains(text(), '$')]",
               "planetblue:collection_item:#{ta_name(name)}:price"
  end

  def collection_item_color(key, name, color)
    locator_by key,
               "#{collection_item name}//div[contains(@amp-bind, 'color.selected.id')]//img[@alt='#{color}']",
               "planetblue:collection_item:#{ta_name(name)}:color"
  end

  def total_items(key, number)
    locator_by key,
               "//div[@style='align-items: center; flex-direction: row;']/span[contains(text(), '#{number}') and contains(text(), 'total items')]",
               "planetblue:total_items"
  end

  def page_header(key, title)
    locator_by key, "//div[@class='page-header__title' and text()='#{title}']",
               "planetblue:page_header_title:#{title}"
  end

  def find_store_item_details(key, title)
    locator_by key,
               "//div[@class='store-card']//h5[text()='#{title}']",
               "planetblue:find_a_store_item:#{ta_name(title)}"
  end


  def click_menu_button(key = nil)
    find_element_path(key, :css, MENU_BUTTON_TA, MENU_BUTTON_IL).click
  end

  def click_menu_category(key = nil, name)
    find_element_path(key, :xpath, menu_category(:ta, name), menu_category(:il, name)).click
  end

  def click_menu_item(key = nil, name)
    find_element_path(key, :xpath, menu_item(:ta, name), menu_item(:il, name)).click
  end

  def find_category_dropdown(key = nil, name)
    find_element_path(key, :xpath, category_dropdown(:ta, name), category_dropdown(:il, name))
  end

  def find_collection_item_details(key = nil, name, color)
        find_element_path(key, :xpath, collection_item_link(:ta, name), collection_item_link(:il, name))
        find_element_path(key, :xpath, collection_item_title(:ta, name), collection_item_title(:il, name))
        find_element_path(key, :xpath, collection_item_image(:ta, name), collection_item_image(:il, name))
        find_element_path(key, :xpath, collection_item_price(:ta, name), collection_item_price(:il, name))
        find_element_path(key, :xpath, collection_item_color(:ta, name, color), collection_item_color(:il, name, color))
  end

  def find_collection_item(key = nil, name, link:)
    find_element_path(key, :xpath, collection_item_by_link(:ta, name, link),
                      collection_item_by_link(:il, name, link))
  end

  def find_total_items(key = nil, number)
    find_element_path(key, :xpath, total_items(:ta, number), total_items(:il, number))
  end

  def find_page_header(key = nil, title)
    find_element_path key, :xpath, page_header(:ta, title), page_header(:il, title)
  end

  def click_search_button(key = nil)
    find_element_path(key, :css, SEARCH_BUTTON_TA, SEARCH_BUTTON_IL).click
  end

  def fill_search_field(key = nil, value)
    find_element_path(key, :css, SEARCH_FIELD_TA, SEARCH_FIELD_IL).fill_in with: value
  end

  def click_search_item(key = nil, name)
    find_element_path(key, :xpath, search_item(:ta, name), search_item(:il, name)).click
  end

end