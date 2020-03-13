require 'spec_helper'
require_relative '../page_extension'

class Designers < PlanetBlue

  def designers_list_section(key, name)
    locator_by key, "//ul[@class='designers-list']//h3[text()='#{name}']",
               "planetblue:designers:list_section:#{ta_name(name)}"
  end

  def find_designers_list_section(key = nil, name)
    find_element_path key, :xpath, designers_list_section(:ta, name), designers_list_section(:il, name)
  end

  def designers_list_item(key, name)
    locator_by key, "//a[contains(@href, '/collections/') and text()='#{name}']",
               "planetblue:designers:list_item:#{ta_name(name).tr('#', 'number_sign')}"
  end

  def click_designers_list_item(key = nil, name)
    find_element_path(key, :xpath, designers_list_item(:ta, name),
                      designers_list_item(:il, name)).click
  end

end