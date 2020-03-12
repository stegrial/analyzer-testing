require 'spec_helper'
require_relative '../page_extension'

class ProductDetails < PlanetBlue

  def _product_image_container(name)
    "//span[text()='#{name}']//ancestor::form//div[@style='flex-direction: column;']"
  end

  def product_image(key, name)
    locator_by key, "#{_product_image_container(name)}/div/div",
               "planetblue:product_details:#{ta_name(name)}:image"
  end

  def product_image_scale_button(key, name)
    locator_by key, "#{_product_image_container(name)}/div/div/div[4]/*",
               "planetblue:product_details:#{ta_name(name)}:image_scale_button"
  end

  def find_product_image(key = nil, name)
    find_element_path(key, :xpath, product_image(:ta, name), product_image(:il, name))
  end

  def product_title(key, name)
    locator_by key, "//h2[text()='#{name}']",
               "planetblue:product_details:#{ta_name(name)}:title"
  end

  def find_product_title(name)
    find_element_path(key, :xpath, product_title(:ta, name), product_title(:il, name))
  end

  def product_image_radiobutton(key, name, number)
    locator_by key, "(#{_product_image_container(name)}/div/div/div)[2]",
               "planetblue:product_details:#{ta_name(name)}:radiobutton:#{number}"
  end

  def find_product_radiobutton(name, number)
    find_element_path key, :xpath, product_image_radiobutton(:ta, name, number),
                      product_image_radiobutton(:il, name, number)
  end

  WHISHLIST_BUTTON_TA = "planetblue:product_details:like_button"
  WHISHLIST_BUTTON_IL = "[aria-label='Wishlist'] svg"

  def find_wishlist_button(key = nil)
    find_element_path key, :css, WHISHLIST_BUTTON_TA, WHISHLIST_BUTTON_IL
  end

  PRODUCT_DESIGNER_TA = "[class='jss754 jss748'] p"
  PRODUCT_DESIGNER_IL = "planetblue:product_details:designer"

  def find_product_designer(key = nil)
    find_element_path key, :css, PRODUCT_DESIGNER_TA, PRODUCT_DESIGNER_IL
  end

  PRODUCT_ID_TA = "planetblue:product_details:product_id"
  PRODUCT_ID_IL = "[class='jss754 jss748'] p[class='jss267 jss750 jss275']"

  def find_product_id(key = nil)
    find_element_path key, :css, PRODUCT_ID_TA, PRODUCT_ID_IL
  end

  PRODUCT_PRICE_TA = "planetblue:product_details:product_price"
  PRODUCT_PRICE_IL = "[class='jss754'] span[class='jss267 jss751 jss275']"

  def find_product_price(key = nil)
    find_element_path key, :xpath, PRODUCT_PRICE_TA, PRODUCT_PRICE_IL
  end

  PAYMENT_DETAILS_TA = "planetblue:product_details:payment_details"
  PAYMENT_DETAILS_IL = "[class='jss755'] > *[data-id]"

  def find_payment_details(key = nil)
    find_element_path key, :css, PAYMENT_DETAILS_TA, PAYMENT_DETAILS_IL
  end

  LEARN_MORE_LINK_TA = "planetblue:product_details:payment_details"
  LEARN_MORE_LINK_IL = "[class='jss755'] > a"

  def find_learn_more_link(key = nil)
    find_element_path key, :css, LEARN_MORE_LINK_TA, LEARN_MORE_LINK_IL
  end

  def review_stars(key, number)
    locator_by key, "div.yotpo-bottomline.pull-left.star-clickable > span > span:nth-child(#{number})",
               "planetblue:product_details:review_star:#{ta_name(number)}"
  end

  def find_review_stars(number)
    find_element_path key, :css, review_stars(:ta, number), review_stars(:il, number)
  end

  REVIEWS_NUMBER_TA = "planetblue:product_details:reviews_number"
  REVIEWS_NUMBER_IL = "a[class='text-m']"

  def find_reviews_number(key = nil)
    find_element_path key, :css, REVIEWS_NUMBER_TA, REVIEWS_NUMBER_IL
  end

  def product_content(key, text)
    locator_by key, "//span[text()='#{text}']",
               "planetblue:product_details:text_content"
  end

  def find_product_content(text)
    find_element_path key, :xpath, product_radiobutton(:ta, name, number),
                      product_radiobutton(:il, name, number)
  end

  SIZES_GUIDE_LINK_TA = ""
  SIZES_GUIDE_LINK_IL = ""

  def find_sizes_guide_link(key = nil)
    find_element_path key, :xpath, SIZES_GUIDE_LINK_TA, SIZES_GUIDE_LINK_IL
  end

  def size_item(key, size)
    locator_by key, "",
               ""
  end

  def find_size_item(size)
    find_element_path key, :xpath, product_radiobutton(:ta, name, number),
                      product_radiobutton(:il, name, number)
  end

  ADD_TO_BAG_BUTTON_TA = ""
  ADD_TO_BAG_BUTTON_IL = ""

  def find_add_to_bag_button(key = nil)
    find_element_path key, :xpath, ADD_TO_BAG_BUTTON_TA, ADD_TO_BAG_BUTTON_IL
  end

  def social_share_button(key, name)
    locator_by key, "",
               ""
  end

  def find_social_share_button(button)
    find_element_path key, :xpath, product_radiobutton(:ta, name, number),
                      product_radiobutton(:il, name, number)
  end

  def product_section_tab(key, name)
    locator_by key, "",
               ""
  end

  def find_product_section_tab(name)
    find_element_path key, :xpath, product_radiobutton(:ta, name, number),
                      product_radiobutton(:il, name, number)
  end

  def section_tab(key, name)
    locator_by key, "",
               ""
  end

  def find_also_like_item(name)
    find_element_path key, :xpath, product_radiobutton(:ta, name, number),
                      product_radiobutton(:il, name, number)
  end

  def complete_the_look_item(key, name, price)
    locator_by key, "",
               ""
  end

  def find_complete_the_look_item(name, price)
    find_element_path key, :xpath, product_radiobutton(:ta, name, number),
                      product_radiobutton(:il, name, number)
  end

end