require_relative '../page_extension'

class ProductDetails < PageExtension

  PRODUCT_DESIGNER_TA = "planetblue:product_details:designer"
  PRODUCT_DESIGNER_IL = "//*[@style='min-height: 125px;']/div/div[2]/p"

  PRODUCT_ID_TA = "planetblue:product_details:product_id"
  PRODUCT_ID_IL = "[style='min-height: 125px;'] > div > *:nth-child(3) > p"

  PRODUCT_PRICE_TA = "planetblue:product_details:product_price"
  PRODUCT_PRICE_IL = "#maincontent [style='min-height: 125px;'] > div > *:nth-child(4) > span"

  PAYMENT_DETAILS_TA = "planetblue:product_details:payment_details"
  PAYMENT_DETAILS_IL = "[style='min-height: 125px;'] *[data-id]"

  LEARN_MORE_LINK_TA = "planetblue:product_details:payment_details"
  LEARN_MORE_LINK_IL = "[style='min-height: 125px;'] *[data-id] > a"

  REVIEWS_NUMBER_TA = "planetblue:product_details:reviews_number"
  REVIEWS_NUMBER_IL = "a.text-m"

  SIZES_GUIDE_LINK_TA = "planetblue:product_details:size_guide_link"
  SIZES_GUIDE_LINK_IL = "//a/button/span[text()='Size Guide']"

  ADD_TO_BAG_BUTTON_TA = "planetblue:product_details:add_to_cart_button"
  ADD_TO_BAG_BUTTON_IL = "//span[text()='Add to Bag']"

  CHECKOUT_BUTTON_TA = "planetblue:product_details:checkout_button"
  CHECKOUT_BUTTON_IL = "[style='flex-direction: column;'] button[data-th='add-to-cart']"

  CHECKOUT_CONFIRM_BUTTON_TA = "planetblue:product_details:checkout_confirm_button"
  CHECKOUT_CONFIRM_BUTTON_IL = "input[name='checkout']"

  WHISHLIST_BUTTON_TA = "planetblue:whishlist_button"
  WHISHLIST_BUTTON_IL = "button[aria-label='Wishlist']"

  WHISHLIST_PROGRESS_BAR_BUTTON_TA = "planetblue:whishlist_progressbar_button"
  WHISHLIST_PROGRESS_BAR_BUTTON_IL = "[role='progressbar']"

  def _product_image_container(name)
    "//span[text()='#{name}']//ancestor::form//div[@style='flex-direction: column;']"
  end

  def product_image(key, name)
    locator_by key, "#{_product_image_container(name)}/div/div",
               "planetblue:product_details:#{ta_name(name)}:image"
  end

  def should_see_product_image(key = nil, name)
    element = find_element(key, il_type: :xpath, tl: product_image(:ta, name),
                 il: product_image(:il, name), check_path: $check_path)
    expect(element).to be_visible
  end

  def product_image_scale_button(key, name)
    locator_by key, "#{_product_image_container(name)}/div/div/div[4]/*",
               "planetblue:product_details:#{ta_name(name)}:image_scale_button"
  end

  def should_see_product_scale_image(key = nil, name)
    element = find_element(key, il_type: :xpath, tl: product_image_scale_button(:ta, name),
                           il: product_image_scale_button(:il, name), check_path: $check_path)
    expect(element).to be_visible
  end

  def product_title(key, name)
    locator_by key, "//h2[text()='#{name}']",
               "planetblue:product_details:#{ta_name(name)}:title"
  end

  def should_see_product_title(key = nil, name)
    element = find_element(key, il_type: :xpath, tl: product_title(:ta, name),
                           il: product_title(:il, name), check_path: $check_path)
    expect(element).to be_visible
  end

  def product_image_radiobutton(key, name, number)
    locator_by key, "(#{_product_image_container(name)}/div/div/div)[2]",
               "planetblue:product_details:#{ta_name(name)}:radiobutton:#{number}"
  end

  def should_see_product_radiobutton(key = nil, name, number)
    element = find_element key, il_type: :xpath, tl: product_image_radiobutton(:ta, name, number),
                           il: product_image_radiobutton(:il, name, number), check_path: $check_path
    expect(element).to be_visible
  end

  def should_see_product_designer(key = nil)
    element = find_element key, il_type: :xpath, tl: PRODUCT_DESIGNER_TA, il: PRODUCT_DESIGNER_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def should_see_progressbar(key = nil)
    element = find_element key, il_type: :css, tl: WHISHLIST_PROGRESS_BAR_BUTTON_TA,
                           il: WHISHLIST_PROGRESS_BAR_BUTTON_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def click_whishlist_button(key = nil)
    find_element(key, il_type: :css, tl: WHISHLIST_BUTTON_TA, il: WHISHLIST_BUTTON_IL, check_path: $check_path).click
  end

  def should_see_product_id(key = nil)
    element = find_element key, il_type: :css, tl: PRODUCT_ID_TA, il: PRODUCT_ID_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def should_see_product_price(key = nil)
    element = find_element key, il_type: :css, tl: PRODUCT_PRICE_TA, il: PRODUCT_PRICE_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def should_see_payment_details(key = nil)
    element = find_element key, il_type: :css, tl: PAYMENT_DETAILS_TA, il: PAYMENT_DETAILS_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def should_see_learn_more_link(key = nil)
    element = find_element key, il_type: :css, tl: LEARN_MORE_LINK_TA, il: LEARN_MORE_LINK_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def should_see_reviews_number(key = nil)
    element = find_element key, il_type: :css, tl: REVIEWS_NUMBER_TA, il: REVIEWS_NUMBER_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def should_see_sizes_guide_link(key = nil)
    element = find_element key, il_type: :xpath, tl: SIZES_GUIDE_LINK_TA, il: SIZES_GUIDE_LINK_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def size_item(key, size)
    locator_by key, "[amp-bind*='moovAmpState.size.selected.id==\"#{size}\"']",
               "planetblue:product_details:size_item:#{size}"
  end

  def should_see_size_item(key = nil, size)
    element = find_element(key, il_type: :css, tl: size_item(:ta, size),
                           il: size_item(:il, size), check_path: $check_path)
    expect(element).to be_visible
  end

  def click_add_to_bag_button(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_BAG_BUTTON_TA, il: ADD_TO_BAG_BUTTON_IL, check_path: $check_path).click
  end

  def click_checkout_button(key = nil)
    find_element(key, il_type: :css, tl: CHECKOUT_BUTTON_TA, il: CHECKOUT_BUTTON_IL, check_path: $check_path).click
  end

  def click_checkout_confirm_button(key = nil)
    find_element(key, il_type: :css, tl: CHECKOUT_CONFIRM_BUTTON_TA,
                 il: CHECKOUT_CONFIRM_BUTTON_IL, check_path: $check_path).click
  end

  def social_share_button(key, name)
    locator_by key, "a[name='#{name}']",
               "planetblue:product_details:social_share_button:#{ta_name(name)}"
  end

  def should_see_social_share_button(key = nil, name)
    element = find_element key, il_type: :css, tl: social_share_button(:ta, name),
                 il: social_share_button(:il, name), check_path: $check_path
    expect(element).to be_visible
  end

  def bottom_section_item(key, section, name)
    locator_by key, "//h2[text()='#{section}']/../..//h4[text()='#{name}']",
               "planetblue:product_details:bottom_section_item:#{ta_name(section)}:#{ta_name(name)}"
  end

  def should_see_bottom_section_item(key = nil, section, name)
    element = find_element key, il_type: :xpath, tl: bottom_section_item(:ta, section, name),
                 il: bottom_section_item(:il, section, name), check_path: $check_path
    expect(element).to be_visible
  end

def bottom_section_item_price(key, section, name, price)
    locator_by key, "//h2[text()='#{section}']/../..//h4[text()='#{name}']//following-sibling::h6[contains(text(), '#{price}')]",
               "planetblue:product_details:bottom_section_item:#{ta_name(section)}:#{ta_name(name)}:price:#{ta_name(price)}"
  end

  def should_see_bottom_section_item_price(key = nil, section, name, price)
    element = find_element key, il_type: :xpath, tl: bottom_section_item_price(:ta, section, name, price),
                 il: bottom_section_item_price(:il, section, name, price), check_path: $check_path
    expect(element).to be_visible
  end

  def alert_dialog_login_link(key)
    locator_by key, "//a[@href='/account/login' and text()='log in']",
               "planetblue:product_details:alert_dialog_login_link"
  end

  def click_alert_dialog_login_link(key = nil)
    find_element(key, il_type: :xpath, tl: alert_dialog_login_link(:ta),
                 il: alert_dialog_login_link(:il), check_path: $check_path).click
  end

end
