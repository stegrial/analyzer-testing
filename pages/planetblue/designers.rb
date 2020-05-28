require_relative '../page_extension'

class Designers < PageExtension

  def designers_list_section(key, name)
    (name == '#') ? formatted_name = 'other' : formatted_name = ta_name(name)
    locator_by key, "//ul[@class='designers-list']//h3[text()='#{name}']",
               "planetblue:designers:list_section:#{formatted_name}"
  end

  def should_see_designers_list_section(key = nil, name)
    element = find_element key, il_type: :xpath, tl: designers_list_section(:ta, name),
                 il: designers_list_section(:il, name), check_path: $check_path
    expect(element).to be_visible
  end

  def designers_list_item(key, name)
    locator_by key, "//a[contains(@href, '/collections/') and text()='#{name}']",
               "planetblue:designers:list_item:#{ta_name(name).tr('#', 'number_sign')}"
  end

  def click_designers_list_item(key = nil, name)
    find_element(key, il_type: :xpath, tl: designers_list_item(:ta, name),
                 il: designers_list_item(:il, name), check_path: $check_path).click
  end

end