require_relative '../page_extension'

class Whishlist < PageExtension

  INPUT_FIELD_WITH_LINK_TA = "planetblue:whishlist:input_field_with_link"
  INPUT_FIELD_WITH_LINK_IL = "input.giftreggie-permalink.form-control"

  COPY_LINK_BUTTON_TA = "planetblue:whishlist:copy_link_button"
  COPY_LINK_BUTTON_IL = "button[data-copy-link]"

  WISHLIST_BACK_BUTTON_TA = "planetblue:whishlist:back_button"
  WISHLIST_BACK_BUTTON_IL = ".wishlist__back-button"

  def should_see_input_field_with_link(key = nil)
    element = find_element(key, il_type: :css, tl: INPUT_FIELD_WITH_LINK_TA,
                 il: INPUT_FIELD_WITH_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def product_card(key, number)
    locator_by key, "//*[contains(@id, 'product-card')][#{number}]", "planetblue:product_card:#{number}:container"
  end

  def whishlist_remove_button(key, number)
    locator_by key, "//*[contains(@class, 'product-card')][#{number}]" + "//*[contains(@class, 'wishlist__remove-button')]", "planetblue:product_card:#{number}:remove_button"
  end

  def should_see_product_card(key = nil, number)
    element = find_element(key, il_type: :xpath, tl: product_card(:ta, number),
                           il: product_card(:il, number), check_path: $check_path)
    expect(element).to be_visible
  end

  def click_whishlist_remove_button(key = nil, card_id)
    find_element(key, il_type: :xpath, tl: whishlist_remove_button(:ta, card_id),
                 il: whishlist_remove_button(:il, card_id), check_path: $check_path).click
  end

  def should_see_copy_link_button(key = nil)
    element = find_element(key, il_type: :css, tl: COPY_LINK_BUTTON_TA,
                           il: COPY_LINK_BUTTON_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_whishlist_back_button(key = nil)
    find_element(key, il_type: :css, tl: WISHLIST_BACK_BUTTON_TA,
                 il: WISHLIST_BACK_BUTTON_IL, check_path: $check_path).click
  end

end
