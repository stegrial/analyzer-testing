require_relative '../page_extension'

class FindAStore < PageExtension

  def store_item_details(key, title)
    locator_by key,
               "//div[@class='store-card']//h5[text()='#{title}']",
               "planetblue:find_a_store:list_item:#{ta_name(title)}"
  end

  def should_see_store_item_details(key = nil, title)
    element = find_element key, il_type: :xpath, tl: store_item_details(:ta, title),
                           il: store_item_details(:il, title), check_path: $check_path
    expect(element).to be_visible
  end

end