require 'spec_helper'
require_relative 'page_extension'

class PlanetBlue

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  def ta_name(name)
    name.tr('^A-Za-z0-9_|', '')
  end

  def locator_by_type(locator, initial_locator, ta_locator)
    case locator
    when :il then initial_locator
    when :ta then ta_locator
    else p 'Locator type is not set'
    end
  end

  MAIN_MENU_BUTTON_IL = "[aria-label='Menu']"
  MAIN_MENU_BUTTON_TA = "planetblue:menu_button"

  def menu_category(locator, name)
    case locator
    when :il then "//div[@role='button']/div[text()='#{name}']"
    when :ta then "planetblue:menu_button:#{ta_name(name)}"
    else p 'Locator type is not set'
    end
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
                    "#{collection_item name}//span[contains('text', '$')]",
                    "planetblue:collection_item:#{ta_name(name)}:price"
  end

  def collection_item_color(locator, name)
    locator_by_type locator,
                    "#{collection_item name}//div[contains(@amp-bind, 'color.selected.id')",
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
      return find(:xpath, menu_category(:il, name)) if key == :il
      find(:xpath, ta(menu_category(:ta, name), menu_category(:il, name)))
    end
  end

  def check_collection_item_attributes(key = nil, name, title, price, color)
    post_processing key do
      return find(:xpath, collection_item_link key, name)
      expect(collection_item_title key, name).to have_attributes('')
    end

  end

end