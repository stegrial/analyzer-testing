require 'spec_helper'
require_relative '../page_extension'

class FindAStore < PlanetBlue

  def store_item_details(key, title)
    locator_by key,
               "//div[@class='store-card']//h5[text()='#{title}']",
               "planetblue:find_a_store:list_item:#{ta_name(title)}"
  end

  def find_store_item_details(key, title)
    find_element_path key, :xpath, store_item_details(:ta, title), store_item_details(:il, title)
  end

end