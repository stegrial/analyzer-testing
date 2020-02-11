require 'spec_helper'

class TheTiebarCartPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers


  PLUS_QUANTITY_CART_IL = "(//button[contains(@aria-label, 'subtract')])[1]"
  PLUS_QUANTITY_CART_TA = "thetiebar:cart_page:plus_quantity_cart"
  PLUS_QUANTITY_CART_EP = "EP:thetiebar:cart_page:plus_quantity_cart"

  VIEW_CART_IL = "//a/h4[text()='View Cart']"
  VIEW_CART_TA = "thetiebar:cart_page:view_cart"
  VIEW_CART_EP = "EP:thetiebar:cart_page:view_cart"

  SUBTRACT_QUANTITY_IL = "(//button[@value='Subtract quantity'])[1]"
  SUBTRACT_QUANTITY_TA = "thetiebar:cart_page:subtract_quantity_minus"
  SUBTRACT_QUANTITY_EP = "EP:thetiebar:cart_page:subtract_quantity_minus"

  CHECKOUT_NOW_BTN_IL = "(//button[@title='Checkout Now'])[1]"
  CHECKOUT_NOW_BTN_TA = "thetiebar:cart_page:checkout_now_btn"
  CHECKOUT_NOW_BTN_EP = "EP:thetiebar:cart_page:checkout_now_btn"

  REMOVE_LINK_IL = "(//a[contains(text(), 'Remove')])[1]"
  REMOVE_LINK_TA = "thetiebar:cart_page:remove_link"
  REMOVE_LINK_EP = "EP:thetiebar:cart_page:remove_link"

  REMOVE_LINK_FROM_CART_IL = "(//a[contains(@value, 'Remove from cart')])[1]"
  REMOVE_LINK_FROM_CART_TA = "thetiebar:cart_page:remove_from_cart_link"
  REMOVE_LINK_FROM_CART_EP = "EP:thetiebar:cart_page:remove_from_cart_link"

  CHECKOUT_NOW_BTN_MODAL_IL = "//button[@data-th='checkout-link']"
  CHECKOUT_NOW_BTN_MODAL_TA = "thetiebar:cart_page:checkout_now_btn_in_modal"
  CHECKOUT_NOW_BTN_MODAL_EP = "EP:thetiebar:cart_page:checkout_now_btn_in_modal"


  def click_plus_quantity_icon(key = nil)
    return find(ta(PLUS_QUANTITY_CART_EP)).click if key == :ep
    return find(:xpath, PLUS_QUANTITY_CART_IL).click if key == :il
    find(:xpath, ta(PLUS_QUANTITY_CART_TA, PLUS_QUANTITY_CART_IL)).click
  end

  def click_view_cart_link(key = nil)
    return find(ta(VIEW_CART_EP)).click if key == :ep
    return find(:xpath, VIEW_CART_IL).click if key == :il
    find(:xpath, ta(VIEW_CART_TA, VIEW_CART_IL)).click
  end

  def click_minus_quantity_icon(key = nil)
    return find(ta(SUBTRACT_QUANTITY_EP)).click if key == :ep
    return find(:xpath, SUBTRACT_QUANTITY_IL).click if key == :il
    find(:xpath, ta(SUBTRACT_QUANTITY_TA, SUBTRACT_QUANTITY_IL)).click
  end

  def click_checkout_now_btn(key = nil)
    return find(ta(CHECKOUT_NOW_BTN_EP)).click if key == :ep
    return find(:xpath, CHECKOUT_NOW_BTN_IL).click if key == :il
    find(:xpath, ta(CHECKOUT_NOW_BTN_TA, CHECKOUT_NOW_BTN_IL)).click
  end

  def click_remove_link(key = nil)
    return find(ta(REMOVE_LINK_EP)).click if key == :ep
    return find(:xpath, REMOVE_LINK_IL).click if key == :il
    find(:xpath, ta(REMOVE_LINK_TA, REMOVE_LINK_IL)).click
  end

  def click_remove_link_from_cart_page(key = nil)
    return find(ta(REMOVE_LINK_FROM_CART_EP)).click if key == :ep
    return find(:xpath, REMOVE_LINK_FROM_CART_IL).click if key == :il
    find(:xpath, ta(REMOVE_LINK_FROM_CART_TA, REMOVE_LINK_FROM_CART_IL)).click
  end

  def click_checkout_now_btn_modal(key = nil)
    return find(ta(CHECKOUT_NOW_BTN_MODAL_EP)).click if key == :ep
    return find(:xpath, CHECKOUT_NOW_BTN_MODAL_IL).click if key == :il
    find(:xpath, ta(CHECKOUT_NOW_BTN_MODAL_TA, CHECKOUT_NOW_BTN_MODAL_IL)).click
  end

end