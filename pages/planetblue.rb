require 'spec_helper'
require_relative 'page_extension'

class PlanetBlue

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  MAIN_MENU_BUTTON_IL = "[aria-label='Menu']"
  MAIN_MENU_BUTTON_TA = "planetblue:menu_button"

  def menu_category(locator, name)
    locator_by_type locator,
                    "//div[@role='button']/div[text()='#{name}']",
                    "planetblue:menu_button:#{ta_name(name)}"
  end

  def category_dropdown(locator, name)
    locator_by_type locator,
                    "//div[@style='align-items: center; flex-direction: row;']//button//span[text()='#{name}']",
                    "planetblue:category_dropdown:#{ta_name(name)}"
  end

  def collection_item(name)
    "//li//a[@aria-label='#{name}']//ancestor::li"
  end


  def collection_item_link(locator, name)
    locator_by_type locator,
                    "#{collection_item name}//a[@data-th='product-link']",
                    "planetblue:collection_item:#{ta_name(name)}:link"
  end

  def collection_item_title(locator, name)
    locator_by_type locator,
                    "#{collection_item name}//div[text()='#{name}']",
                    "planetblue:collection_item:#{ta_name(name)}:title"
  end

  def collection_item_image(locator, name)
    locator_by_type locator,
                    "#{collection_item name}//img[@alt='#{name}']",
                    "planetblue:collection_item:#{ta_name(name)}:image"
  end

  def collection_item_price(locator, name)
    locator_by_type locator,
                    "#{collection_item name}//span[contains(text(), '$')]",
                    "planetblue:collection_item:#{ta_name(name)}:price"
  end

  def collection_item_color(locator, name, color)
    locator_by_type locator,
                    "#{collection_item name}//div[contains(@amp-bind, 'color.selected.id')]//img[@alt='#{color}']",
                    "planetblue:collection_item:#{ta_name(name)}:color"
  end


  def click_menu_button(key = nil)
    find_element_path(key, :css, MAIN_MENU_BUTTON_TA, MAIN_MENU_BUTTON_IL).click
  end

  def click_menu_category(key = nil, name)
    find_element_path(key, :xpath, menu_category(:ta, name), menu_category(:il, name)).click
  end

  def find_category_dropdown(key = nil, name)
    find_element_path(key, :xpath, category_dropdown(:ta, name), category_dropdown(:il, name))
  end

  def check_collection_item(key = nil, name, color)
        find_element_path(key, :xpath, collection_item_link(:ta, name), collection_item_link(:il, name))
        find_element_path(key, :xpath, collection_item_title(:ta, name), collection_item_title(:il, name))
        find_element_path(key, :xpath, collection_item_image(:ta, name), collection_item_image(:il, name))
        find_element_path(key, :xpath, collection_item_price(:ta, name), collection_item_price(:il, name))
        find_element_path(key, :xpath, collection_item_color(:ta, name, color), collection_item_color(:il, name, color))
  end

end