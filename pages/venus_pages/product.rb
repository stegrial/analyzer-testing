require 'spec_helper'

class VenusProduct
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  def list_size(locator, size)
    case locator
    when :il then "(//button[./span[text()='#{size}']])[1]"
    when :ta then "venus:list_size:#{size.tr('^A-Za-z0-9_', '')}"
    when :ep then "EP:venus:list_size:#{size.tr('^A-Za-z0-9_', '')}"
    else p 'Locator type is not set'
    end
  end

  QTY_DROPDOWN_IL = "//div[./div[text()='Qty:']]//div[@role='button']"
  QTY_DROPDOWN_TA = 'venus:product:qty_dropdown'
  QTY_DROPDOWN_EP = 'EP:venus:product:qty_dropdown'

  def quantity(locator, qty)
    case locator
    when :il then "//ul[@role='listbox']/li[text()='#{qty}']"
    when :ta then "venus:product:qty_dropdown:quantity_#{qty.tr('^A-Za-z0-9_', '')}"
    when :ep then "EP:venus:product:qty_dropdown:quantity_#{qty.tr('^A-Za-z0-9_', '')}"
    else p 'Locator type is not set'
    end
  end

  WISH_LIST_BTN_IL = "//button[./span[text()='+ wish list']]"
  WISH_LIST_BTN_TA = 'venus:product:wish_list_btn'
  WISH_LIST_BTN_EP = 'EP:venus:product:wish_list_btn'


  def choose_list_size(key = nil, size)
    return find(ta(list_size(:ep, size))).click if key == :ep
    return find(:xpath, list_size(:il, size)).click if key == :il
    find(:xpath, ta(list_size(:ta, size), list_size(:il, size))).click
  end

  def open_qty_dropdown(key = nil)
    return find(ta(QTY_DROPDOWN_EP)).click if key == :ep
    return find(:xpath, QTY_DROPDOWN_IL).click if key == :il
    find(:xpath, ta(QTY_DROPDOWN_TA, QTY_DROPDOWN_IL)).click
  end

  def select_quantity(key = nil, qty)
    return find(ta(quantity(:ep, qty))).click if key == :ep
    return find(:xpath, quantity(:il, qty)).click if key == :il
    find(:xpath, ta(quantity(:ta, qty), quantity(:il, qty))).click
  end

  def click_wish_list_button(key = nil)
    return find(ta(WISH_LIST_BTN_EP)).click if key == :ep
    return find(:xpath, WISH_LIST_BTN_IL).click if key == :il
    find(:xpath, ta(WISH_LIST_BTN_TA, WISH_LIST_BTN_IL)).click
  end

end





