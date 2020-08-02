require 'spec_helper'
require_relative '../page_extension'

class OrderDetails < PageExtension

  CHECKOUT_BUTTON_IL = "#ctl00_Body1_btnProceedToCheckout"
  CHECKOUT_BUTTON_TA = 'venus:order_page:checkout_button'

  def order_item(key = nil, name)
    locator_by(key, "//a[@class='mw-item-name' and text()='#{name}']",
               "venus:order_page:order_item:#{ta_name(name)}'")
  end


  def should_see_order_item(key = nil, name)
    find_element(key, il_type: :xpath, tl: order_item(:ta, name), il: order_item(:il, name), check_path: $check_path).click
  end

  def clicks_checkout_button(key = nil)
    find_element(key, il_type: :css, tl: CHECKOUT_BUTTON_TA, il: CHECKOUT_BUTTON_IL, check_path: $check_path).click
  end

end