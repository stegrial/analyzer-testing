require 'spec_helper'
require_relative '../page_extension'

class VenusProduct
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  def list_size(locator, size)
    case locator
    when :il then "(//button[./span[text()='#{size}']])[1]"
    when :ta then "venus:product_page:list_size:#{size.tr('^A-Za-z0-9_', '')}"
    when :ep then "EP:venus:product_page:list_size:#{size.tr('^A-Za-z0-9_', '')}"
    else p 'Locator type is not set'
    end
  end

  QTY_DROPDOWN_IL = "//div[./div[text()='Qty:']]//div[@role='button']"
  QTY_DROPDOWN_TA = 'venus:product_page:qty_dropdown'
  QTY_DROPDOWN_EP = 'EP:venus:product_page:qty_dropdown'

  def quantity(locator, qty)
    case locator
    when :il then "//ul[@role='listbox']/li[text()='#{qty}']"
    when :ta then "venus:product_page:qty_dropdown:quantity_#{qty.tr('^A-Za-z0-9_', '')}"
    when :ep then "EP:venus:product_page:qty_dropdown:quantity_#{qty.tr('^A-Za-z0-9_', '')}"
    else p 'Locator type is not set'
    end
  end

  WISH_LIST_BTN_IL = "//button[./span[text()='+ wish list']]"
  WISH_LIST_BTN_TA = 'venus:product_page:wish_list_btn'
  WISH_LIST_BTN_EP = 'EP:venus:product_page:wish_list_btn'

  ADD_TO_BAG_BTN_IL = "//button[./span[text()='Add To Bag']]"
  ADD_TO_BAG_BTN_TA = 'venus:product_page:add_to_bag_btn'
  ADD_TO_BAG_BTN_EP = 'EP:venus:product_page:add_to_bag_btn'

  PRICE_ON_PRODUCT_IL = "(//div[contains(@data-page, 'Product')]//span[contains(., '$')])[1]"
  PRICE_ON_PRODUCT_TA = 'venus:product_page:price_on_product'
  PRICE_ON_PRODUCT_EP = 'EP:venus:product_page:price_on_product'

  def image_gallery(locator, image_index)
    case locator
    when :il then "(//img[@alt='thumbnail']/ancestor::button)[#{image_index}]"
    when :ta then "venus:product_page:image_gallery:#{image_index}"
    when :ep then "EP:venus:product_page:image_gallery:#{image_index}"
    else p 'Locator type is not set'
    end
  end

  def main_image(locator, image_index)
    case locator
    when :il then "//div[@aria-hidden='false']/descendant::img[@alt='product']"
    when :ta then "venus:product_page:main_image_on_product:#{image_index}"
    when :ep then "EP:venus:product_page:main_image_on_product:#{image_index}"
    else p 'Locator type is not set'
    end
  end


  def choose_list_size(key = nil, size)
    post_processing key do
      return find(ta(list_size(:ep, size))).click if key == :ep
      return find(:xpath, list_size(:il, size)).click if key == :il
      find(:xpath, ta(list_size(:ta, size), list_size(:il, size))).click
    end
  end

  def open_qty_dropdown(key = nil)
    post_processing key do
      return find(ta(QTY_DROPDOWN_EP)).click if key == :ep
      return find(:xpath, QTY_DROPDOWN_IL).click if key == :il
      find(:xpath, ta(QTY_DROPDOWN_TA, QTY_DROPDOWN_IL)).click
    end
  end

  def select_quantity(key = nil, qty)
    post_processing key do
      return find(ta(quantity(:ep, qty))).click if key == :ep
      return find(:xpath, quantity(:il, qty)).click if key == :il
      find(:xpath, ta(quantity(:ta, qty), quantity(:il, qty))).click
    end
  end

  def click_wish_list_button(key = nil)
    post_processing key do
      return find(ta(WISH_LIST_BTN_EP)).click if key == :ep
      return find(:xpath, WISH_LIST_BTN_IL).click if key == :il
      find(:xpath, ta(WISH_LIST_BTN_TA, WISH_LIST_BTN_IL)).click
    end
  end

  def click_add_to_bag_button(key = nil)
    post_processing key do
      return find(ta(ADD_TO_BAG_BTN_EP)).click if key == :ep
      return find(:xpath, ADD_TO_BAG_BTN_IL).click if key == :il
      find(:xpath, ta(ADD_TO_BAG_BTN_TA, ADD_TO_BAG_BTN_IL)).click
    end
  end

  def find_price_on_product(key = nil)
    post_processing key do
      return find(ta(PRICE_ON_PRODUCT_EP)) if key == :ep
      return find(:xpath, PRICE_ON_PRODUCT_IL) if key == :il
      find(:xpath, ta(PRICE_ON_PRODUCT_TA, PRICE_ON_PRODUCT_IL))
    end
  end

  def choose_image(key = nil, image)
    post_processing key do
      return find(ta(image_gallery(:ep, image))).click if key == :ep
      return find(:xpath, image_gallery(:il, image)).click if key == :il
      find(:xpath, ta(image_gallery(:ta, image), image_gallery(:il, image))).click
    end
  end

  def find_main_image_on_product(key = nil, image)
    post_processing key do
      return find(ta(main_image(:ep, image))) if key == :ep
      return find(:xpath, main_image(:il, image)) if key == :il
      find(:xpath, ta(main_image(:ta, image), main_image(:il, image)))
    end
  end

end





