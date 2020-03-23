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

  def find_category_dropdown(key = nil, name)
    find_element_path(key, :xpath, category_dropdown(:ta, name), category_dropdown(:il, name))
  end

  def sort_dropdown_value(key, value)
    locator_by key, "//span[text()='#{value}']/parent::button",
               "planetblue:category_dropdown:sort_value:#{ta_name(value)}"
  end

  def find_sort_dropdown_value(key = nil, value)
    find_element_path(key, :xpath, sort_dropdown_value(:ta, value), sort_dropdown_value(:il, value))
  end

  def select_from_sort_dropdown(key = nil, value)
    find_category_dropdown(key, 'Sort').click
    find_sort_dropdown_value(key, value).click
  end

  def refine_category_block(key, value)
    locator_by key, "//h6[text()='#{value}']/parent::*/parent::*/parent::*",
               "planetblue:category_dropdown:refine_category_block:#{value}"
  end

  def find_refine_category_block(key = nil, value)
    find_element_path(key, :xpath, refine_category_block(:ta, value), refine_category_block(:il, value))
  end

  def refine_dropdown_checkbox(key, refine_category, value)
    locator_by key,
               "//*[text()='#{refine_category}']/parent::*/parent::*/parent::*//span[text()='#{value}']",
               "planetblue:category_dropdown:refine_dropdown_value:#{refine_category}:#{ta_name(value)}"
  end

  def find_refine_dropdown_checkbox(key = nil, section, value)
    find_element_path(key, :xpath, refine_dropdown_checkbox(:ta, section, value),
                      refine_dropdown_checkbox(:il, section, value))
  end

  CLOSE_DROPDOWN_BUTTON_TA = "planetblue:category_dropdown:close_button"
  CLOSE_DROPDOWN_BUTTON_IL = "[role] button svg"

  def find_close_dropdown_button(key = nil)
    find_element_path key, :css, CLOSE_DROPDOWN_BUTTON_TA, CLOSE_DROPDOWN_BUTTON_IL
  end

  APPLY_BUTTON_TA = "planetblue:category_dropdown:apply_button"
  APPLY_BUTTON_IL = "//span[text()='Apply']/parent::button"

  def find_apply_dropdown_button(key = nil)
    find_element_path key, :xpath, APPLY_BUTTON_TA, APPLY_BUTTON_IL
  end

  def select_from_refine_dropdown(key = nil, section, values)
    find_category_dropdown(key, 'REFINE').click
    find_refine_category_block(key, section).click
    values.each do |value|
      find_refine_dropdown_checkbox(key, section, value).click
    end
    find_close_dropdown_button(key)
    find_apply_dropdown_button(key).click
  end

  def _collection_item(name, link = nil)
    return "//li//a[@aria-label='#{name}']//ancestor::li" if link == nil
    "//li//a[contains(@href, '#{link}')]//ancestor::li"
  end

  def collection_item_link(key, name)
    locator_by key, "#{_collection_item name}//ancestor::div[@style='align-items: stretch; flex-direction: column;']",
               "planetblue:collection_item:#{ta_name(name)}:link"
  end

  def collection_item_title(key, name)
    locator_by key, "#{_collection_item name}//div[text()='#{name}']",
               "planetblue:collection_item:#{ta_name(name)}:title"
  end

  def collection_item_image(key, name)
    locator_by key, "#{_collection_item name}//img[@alt='#{name}']",
               "planetblue:collection_item:#{ta_name(name)}:image"
  end

  def collection_item_price(key, name)
    locator_by key, "#{_collection_item name}//span[contains(text(), '$')]",
               "planetblue:collection_item:#{ta_name(name)}:price"
  end

  def collection_item_color(key, name, color)
    locator_by key, "#{_collection_item name}//div[contains(@amp-bind, 'color.selected.id')]//img[@alt='#{color}']",
               "planetblue:collection_item:#{ta_name(name)}:color"
  end

  def find_collection_item_details(key = nil, name, color)
        find_element_path(key, :xpath, collection_item_link(:ta, name), collection_item_link(:il, name))
        find_element_path(key, :xpath, collection_item_title(:ta, name), collection_item_title(:il, name))
        find_element_path(key, :xpath, collection_item_image(:ta, name), collection_item_image(:il, name))
        find_element_path(key, :xpath, collection_item_price(:ta, name), collection_item_price(:il, name))
        find_element_path(key, :xpath, collection_item_color(:ta, name, color), collection_item_color(:il, name, color))
  end

  def collection_item_by_link(key, name, link)
    locator_by key, "(#{_collection_item name, link}//a[@data-th='product-link'])[1]",
               "planetblue:collection_item:#{ta_name(name)}_by_link_#{ta_name(link)}"
  end

  def find_collection_item(key = nil, name, link)
    find_element_path(key, :xpath, collection_item_by_link(:ta, name, link),
                      collection_item_by_link(:il, name, link))
  end

  def click_collection_item(key = nil, name, link)
    find_collection_item(key, name, link).click
  end

  def total_items(key = nil, number)
    locator_by key, "//div[@style='align-items: center; flex-direction: row;']/span[contains(text(), '#{number}') and contains(text(), 'total items')]",
               "planetblue:total_items"
  end

  def find_total_items(key = nil, number)
    find_element_path(key, :xpath, total_items(:ta, number), total_items(:il, number))
  end

  def page_header(key, title)
    locator_by key, "//h1[text()='#{title}']",
               "planetblue:page_header_title:#{ta_name(title)}"
  end

  def find_page_header(key = nil, title)
    find_element_path key, :xpath, page_header(:ta, title), page_header(:il, title)
  end

  def navbar_link(key, title)
    locator_by key, "//span[contains(text(), '#{title}')]/ancestor::a",
               "planetblue:navbar:link:#{ta_name(title)}"
  end

  def click_navbar_link(key = nil, value)
    find_element_path(key, :xpath, navbar_link(:ta, value), navbar_link(:il, value)).click
  end

  def breadcrumb(key, name, with_link)
    with_link ? el = "//form//a[text()='#{name}']" : el = "//form//span[text()='#{name}']"
    locator_by key, el,"planetblue:breadcrumbs:#{ta_name(name)}"
  end

  def find_breadcrumb(key = nil, value, with_link)
    find_element_path(key, :xpath, breadcrumb(:ta, value, with_link),
                      breadcrumb(:il, value, with_link))
  end

end