require 'spec_helper'
require_relative '../page_extension'

class Press_Page
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  CLOSE_BANNER_BTN = "//button[@class='offer-control close']"

  PRESS_CATALOG_IL = "//div[@class='collections-grid-item first'][1]/a[1]"
  PRESS_CATALOG_TA = "annieselke:home_page:press_page:catalog_item"

  CHOOSE_ITEMS_IL = "//a[text()='Choose Items Below']"
  CHOOSE_ITEMS_TA = "annieselke:home_page:press_page:choose_items"

  SELECT_SIZE_IL = "//select[@name='productCodePost']"
  SELECT_SIZE_TA = "annieselke:home_page:press_page:select_size"

  QUANTITY_FIELD_IL = "//input[@class='cartQty']"
  QUANTITY_FIELD_TA = "annieselke:home_page:press_page:quantity"

  ADD_TO_CARD_IL = "//button[@class='button primary add-to-cart color-change']"
  ADD_TO_CARD_TA = "annieselke:home_page:press_page:add_card_btn"

  def select_size_item(key)
    locator_by key,
               "//select[@name='productCodePost']/option[2]",
               "annieselke:home_page:press_page:#{ta_name('item_option')}"
  end

  def close_banner
    within_frame(:xpath,"//div[@class='fcopt_modal'") do
      find(:xpath, CLOSE_BANNER_BTN).click
    end
  rescue
    puts 'Banner doesnt exist'
  end

  def click_first_catalog(key=nil)
    find_element_path(key, :xpath, PRESS_CATALOG_TA, PRESS_CATALOG_IL).click
  end

  def click_choose_items(key=nil)
    find_element_path(key, :xpath, CHOOSE_ITEMS_TA, CHOOSE_ITEMS_IL).click
  end

  def select_size(key=nil)
    find_element_path(key, :xpath, SELECT_SIZE_TA, SELECT_SIZE_IL).click
    find_element_path(key, :xpath, select_size_item(:ta), select_size_item(:il)).click
  end

  def set_quantity(key=nil, value)
    find_element_path(key, :xpath, QUANTITY_FIELD_TA, QUANTITY_FIELD_IL).set(value)
  end

  def add_to_card(key=nil)
    find_element_path(key, :xpath, ADD_TO_CARD_TA, ADD_TO_CARD_IL)
  end
end

