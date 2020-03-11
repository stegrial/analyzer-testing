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

  def product_image_radiobutton(key, name, number)
    locator_by key, "(#{_product_image_container(name)}/div/div/div)[2]",
               "planetblue:product_details:#{ta_name(name)}:radiobutton:#{number}"
  end

  # Actions

  def find_product_image(key = nil, name)
    find_element_path(key, :xpath, product_image(:ta, name), product_image(:il, name))
  end

  def find_product_image(key = nil, name)
    find_element_path(key, :xpath, product_image(:ta, name), product_image(:il, name))
  end

  def find_product_image(key = nil, name)
    find_element_path(key, :xpath, product_image(:ta, name), product_image(:il, name))
  end

end