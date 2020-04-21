require 'spec_helper'
require_relative '../page_extension'

class Whishlist

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  INPUT_FIELD_WITH_LINK_TA = "planetblue:whishlist:input_field_with_link"
  INPUT_FIELD_WITH_LINK_IL = "input.giftreggie-permalink.form-control"

  COPY_LINK_BUTTON_TA = "planetblue:whishlist:copy_link_button"
  COPY_LINK_BUTTON_IL = "button[data-copy-link]"

  WISHLIST_BACK_BUTTON_TA = "planetblue:whishlist:back_button"
  WISHLIST_BACK_BUTTON_IL = ".wishlist__back-button"

  def find_input_field_with_link(i)
    find_element_path(key, :css, INPUT_FIELD_WITH_LINK_TA, INPUT_FIELD_WITH_LINK_IL)
  end

  def product_card(key, card_id)
    locator_by key, "planetblue:product_card:#{card_id}:container", "#product-card-#{card_id}"
  end

  def whishlist_remove_button(key, card_id)
    locator_by key, "planetblue:product_card:#{card_id}:remove_button", "#product-card-#{card_id} .wishlist__remove-button"
  end

  def find_product_card(key = nil, card_id)
    find_element_path(key, :css, product_card(:ta, card_id), product_card(:il, card_id))
  end

  def click_whishlist_remove_button(key = nil, card_id)
    find_element_path(key, :css, whishlist_remove_button(:ta, card_id), whishlist_remove_button(:il, card_id)).click
  end

  def find_copy_link_button(key = nil)
    find_element_path(key, :css, COPY_LINK_BUTTON_TA, COPY_LINK_BUTTON_IL)
  end

  def click_whishlist_back_button(key = nil)
    find_element_path(key, :css, COPY_LINK_BUTTON_TA, COPY_LINK_BUTTON_IL).click
  end

end