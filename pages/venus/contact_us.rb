require_relative '../page_extension'

class ContactUs < PageExtension

  def contact_us_item(key, name, text)
    locator_by key, "//*[@class='mw-section-title' and text()='#{name}']//following-sibling::p[text()='#{text}']",
               "planetblue:contact_us:item:#{ta_name(name)}"
  end

  def should_see_contact_us_item(key = nil, name, text)
    element = find_element key, il_type: :xpath, tl: contact_us_item(:ta, name, text),
                           il: contact_us_item(:il, name, text), check_path: $check_path
    expect(element).to be_visible
  end

end