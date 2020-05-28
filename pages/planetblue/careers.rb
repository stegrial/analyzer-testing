require_relative '../page_extension'

class Careers < PageExtension

  CAREERS_HEADER_TA = "planetblue:careers:header"
  CAREERS_HEADER_IL = ".page-hero-page-careers"

  def should_see_careers_header(key = nil)
    element = find_element key, il_type: :css, tl: CAREERS_HEADER_TA, il: CAREERS_HEADER_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def career_item(key, store, name)
    locator_by key, "//*[@class='careers-block']//h4[text()='#{store}']//following-sibling::ul//*[text()='#{name}']",
               "planetblue:careers:item"
  end

  def should_see_career_item(key = nil, store, name)
    element = find_element key, il_type: :xpath, tl: career_item(:ta, store, name),
                           il: career_item(:il, store, name), check_path: $check_path
    expect(element).to be_visible
  end

end