require 'spec_helper'
require_relative '../page_extension'

class PlanetBlue

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  def category_dropdown(key, name)
    locator_by key, "//div[@style='align-items: center; flex-direction: row;']//span[text()='#{name}']",
               "planetblue:category_dropdown:#{ta_name(name)}"
  end

  def collection_item(name, link = nil)
    return "//li//a[@aria-label='#{name}']//ancestor::li" if link == nil
    "//li//a[contains(@href, '#{link}')]//ancestor::li"
  end

  def collection_item_by_link(key, name, link)
    locator_by key, "(#{collection_item name, link}//a[@data-th='product-link'])[1]",
               "planetblue:collection_item:#{ta_name(name)}_by_link_#{ta_name(link)}"
  end

  def collection_item_link(key, name)
    locator_by key, "#{collection_item name}//ancestor::div[@style='align-items: stretch; flex-direction: column;']",
               "planetblue:collection_item:#{ta_name(name)}:link"
  end

  def collection_item_title(key, name)
    locator_by key, "#{collection_item name}//div[text()='#{name}']",
               "planetblue:collection_item:#{ta_name(name)}:title"
  end

  def collection_item_image(key, name)
    locator_by key, "#{collection_item name}//img[@alt='#{name}']",
               "planetblue:collection_item:#{ta_name(name)}:image"
  end

  def collection_item_price(key, name)
    locator_by key, "#{collection_item name}//span[contains(text(), '$')]",
               "planetblue:collection_item:#{ta_name(name)}:price"
  end

  def collection_item_color(key, name, color)
    locator_by key, "#{collection_item name}//div[contains(@amp-bind, 'color.selected.id')]//img[@alt='#{color}']",
               "planetblue:collection_item:#{ta_name(name)}:color"
  end

  def total_items(key, number)
    locator_by key, "//div[@style='align-items: center; flex-direction: row;']/span[contains(text(), '#{number}') and contains(text(), 'total items')]",
               "planetblue:total_items"
  end

  def page_header(key, title)
    locator_by key, "//h1[@class='page-header__title' and text()='#{title}']",
               "planetblue:page_header_title:#{title}"
  end

  def navbar_link(key, title)
    locator_by key, "//span[contains(text(), '#{title}')]/ancestor::a",
               "planetblue:navbar:link:#{ta_name(title)}"
  end

  # Actions

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

  def click_navbar_link(key = nil, value)
    find_element_path(key, :xpath, navbar_link(:ta, value), navbar_link(:il, value)).click
  end

end