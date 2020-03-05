require 'spec_helper'
require_relative 'page_extension'

class PlanetBlue

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  def ta_name(name)
    name.tr('0-9_ ', '').tr('|', '').tr('A-Z', 'a-z')
  end

  def locator_by_type(locator, initial_locator, ta_locator)
    case locator
    when :il then initial_locator
    when :ta then ta_locator
    else p 'Locator type is not set'
    end
  end

  def find_element_path(key, format, initialLocator, taLocator)
    post_processing key do
      return find(format, initialLocator) if key == :il
      find(format, ta(taLocator, initialLocator))
    end
  end

  MAIN_MENU_BUTTON_IL = "[aria-label='Menu']"
  MAIN_MENU_BUTTON_TA = "planetblue:menu_button"

  def menu_category(locator, name)
    locator_by_type locator,
                    "//div[@role='button']/div[text()='#{name}']",
                    "planetblue:menu_button:#{ta_name(name)}"
  end

  def category_dropdown(locator, name)
    locator_by_type locator,
                    "//button/span/span[text()='#{name}']",
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


  def click_menu_category(key = nil, name)
    post_processing key do
      return find(:xpath, menu_category(:il, name)).click if key == :il
      find(:xpath, ta(menu_category(:ta, name), menu_category(:il, name))).click
    end
  end

  def click_menu_button(key = nil)
    post_processing key do
      return find(:css, MAIN_MENU_BUTTON_IL).click if key == :il
      find(:css, ta(MAIN_MENU_BUTTON_TA, MAIN_MENU_BUTTON_IL)).click
    end
  end

  def find_category_dropdown(key = nil, name)
    post_processing key do
      return find(:xpath, category_dropdown(:il, name)) if key == :il
      find(:xpath, ta(category_dropdown(:ta, name), category_dropdown(:il, name)))
    end
  end

  def check_collection_item(key = nil, name, color)
        find_element_path(key, :xpath, collection_item_link(:il, name), collection_item_link(:ta, name))
        find_element_path(key, :xpath, collection_item_title(:il, name), collection_item_title(:ta, name))
        find_element_path(key, :xpath, collection_item_image(:il, name), collection_item_image(:ta, name))
        find_element_path(key, :xpath, collection_item_price(:il, name), collection_item_price(:ta, name))
        find_element_path(key, :xpath, collection_item_color(:il, name, color), collection_item_color(:ta, name, color))
  end

end