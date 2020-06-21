require_relative '../page_extension'

class PlanetBlue < PageExtension

  CLOSE_DROPDOWN_BUTTON_TA = "planetblue:category_dropdown:close_button"
  CLOSE_DROPDOWN_BUTTON_IL = "[role] button svg"

  APPLY_BUTTON_TA = "planetblue:category_dropdown:apply_button"
  APPLY_BUTTON_IL = "(//span[text()='Apply']/parent::button)[2]"

  BACK_TO_TOP_BUTTON_TA = "blueplanet:back_to_top_button"
  BACK_TO_TOP_BUTTON_IL = "button[title='back to top']"

  LOAD_MORE_BUTTON_TA = "blueplanet:load_more_button"
  LOAD_MORE_BUTTON_IL = "//*[text()='LOAD MORE']"

  HEADER_LOGO_TA = "planetblue:header_logo"
  HEADER_LOGO_IL = "a.header-logo"

  def category_dropdown(key, name)
    locator_by key, "//div[@style='align-items: center; flex-direction: row;']//span[text()='#{name}']",
               "planetblue:category_dropdown:#{ta_name(name)}"
  end

  def sort_dropdown_value(key, value)
    locator_by key, "//span[text()='#{value}']/parent::button",
               "planetblue:category_dropdown:sort_value:#{ta_name(value)}"
  end

  def select_from_sort_dropdown(key = nil, value)
    find_element(key, il_type: :xpath, tl: category_dropdown(:ta, 'Sort'),
                 il: category_dropdown(:il, 'Sort'), check_path: $check_path).click
    find_element(key, il_type: :xpath, tl: sort_dropdown_value(:ta, value),
                 il: sort_dropdown_value(:il, value), check_path: $check_path).click
  end

  def refine_category_block(key, value)
    locator_by key, "(//h6[text()='#{value}']/parent::*/parent::*/parent::*)[2]",
               "planetblue:category_dropdown:refine_category_block:#{value}"
  end

  def should_see_refine_category_block(key = nil, value)
    element = find_element(key, il_type: :xpath, tl: refine_category_block(:ta, value),
                 il: refine_category_block(:il, value), check_path: $check_path)
    expect(element).to be_visible
  end

  def refine_dropdown_checkbox(key, refine_category, value)
    locator_by key,
               "//*[text()='#{refine_category}']/parent::*/parent::*/parent::*//span[text()='#{value}']",
               "planetblue:category_dropdown:refine_dropdown_value:#{refine_category}:#{ta_name(value)}"
  end

  def should_see_refine_dropdown_checkbox(key = nil, section, value)
    element = find_element(key, il_type: :xpath, tl: refine_dropdown_checkbox(:ta, section, value),
                           il: refine_dropdown_checkbox(:il, section, value), check_path: $check_path)
    expect(element).to be_visible
  end

  def select_from_refine_dropdown(key = nil, section, values)
    find_element(key, il_type: :xpath, tl: category_dropdown(:ta, 'REFINE'),
                 il: category_dropdown(:il, 'REFINE'), check_path: $check_path).click
    sleep 5 # wait for page load
    find_element(key, il_type: :xpath, tl: refine_category_block(:ta, section),
                 il: refine_category_block(:il, section), check_path: $check_path).click
    values.each do |value|
      find_element(key, il_type: :xpath, tl: refine_dropdown_checkbox(:ta, section, value),
                   il: refine_dropdown_checkbox(:il, section, value), check_path: $check_path).click
    end
    # find_element(key, il_type: :css, tl: CLOSE_DROPDOWN_BUTTON_TA,
    #              il: CLOSE_DROPDOWN_BUTTON_IL, check_path: $check_path).click
    find_element(key, il_type: :xpath, tl: APPLY_BUTTON_TA, il: APPLY_BUTTON_IL, check_path: $check_path).click
  end

  def _collection_item(name, link = nil)
    return "//li//a[@aria-label='#{name}']//ancestor::li" if link == nil
    "//li//a[contains(@href, '#{link}')]//ancestor::li"
  end

  def collection_item_link(key, name)
    locator_by key, "#{_collection_item name}//ancestor::div[@style='align-items: stretch; flex-direction: column;']",
               "planetblue:collection_item:#{ta_name(name)}:link"
  end

  def collection_item_title(key, name)
    locator_by key, "#{_collection_item name}//div[text()='#{name}']",
               "planetblue:collection_item:#{ta_name(name)}:title"
  end

  def collection_item_image(key, name)
    locator_by key, "#{_collection_item name}//img[@alt='#{name}']",
               "planetblue:collection_item:#{ta_name(name)}:image"
  end

  def find_collection_item_details(key = nil, name)
    [
        find_element(key, il_type: :xpath, tl: collection_item_link(:ta, name),
                     il: collection_item_link(:il, name), check_path: $check_path),
        find_element(key, il_type: :xpath, tl: collection_item_title(:ta, name),
                     il: collection_item_title(:il, name), check_path: $check_path),
        find_element(key, il_type: :xpath, tl: collection_item_image(:ta, name),
                     il: collection_item_image(:il, name), check_path: $check_path),
    ].each { |element|
      expect(element).to be_visible
    }
  end

  def collection_item_by_link(key, name, link)
    locator_by key, "(#{_collection_item name, link}//a[@data-th='product-link'])[1]",
               "planetblue:collection_item:#{ta_name(name)}_by_link_#{ta_name(link)}"
  end

  def collection_item_by_num(key, number)
    locator_by key, "(//*[contains(@style, 'flex-direction:')]//a//img)[#{number}]",
               "planetblue:collection_item:number_#{number}"
  end

  def should_see_collection_item(key = nil, name, link)
    element = find_element(key, il_type: :xpath, tl: collection_item_by_link(:ta, name, link),
                           il: collection_item_by_link(:il, name, link), check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_collection_item_by_num(key = nil, number)
    element = find_element(key, il_type: :xpath, tl: collection_item_by_num(:ta, number),
                           il: collection_item_by_num(:il, number), check_path: $check_path)
    expect(element).to be_visible
  end

  def click_collection_item(key = nil, name, link)
    find_element(key, il_type: :xpath, tl: collection_item_by_link(:ta, name, link),
                 il: collection_item_by_link(:il, name, link), check_path: $check_path).click
  end

  def click_collection_item_by_num(key = nil, number)
    find_element(key, il_type: :xpath, tl: collection_item_by_num(:ta, number),
                il: collection_item_by_num(:il, number), check_path: $check_path).click
  end

  def click_back_to_top_button(key = nil)
    find_element(key, il_type: :css, tl: BACK_TO_TOP_BUTTON_TA, il: BACK_TO_TOP_BUTTON_IL, check_path: $check_path).click
  end

  def click_load_more_button(key = nil)
    find_element(key, il_type: :xpath, tl: LOAD_MORE_BUTTON_TA, il: LOAD_MORE_BUTTON_IL, check_path: $check_path).click
  end

  def social_link(key = nil, name)
    locator_by key, "a[name='#{name}']", "planetblue:social_link:#{ta_name(name)}"
  end

  def should_see_social_link(key = nil, name)
    element = find_element(key, il_type: :css, tl: social_link(:ta, name),
                           il: social_link(:il, name), check_path: $check_path)
    expect(element).to be_visible
  end

  def click_social_link(key = nil, name)
    find_element(key, il_type: :css, tl: social_link(:ta, name),
                 il: social_link(:il, name), check_path: $check_path).click
  end

  def total_items(key = nil, number)
    locator_by key, "//div[@style='align-items: center; flex-direction: row;']/span[contains(text(), '#{number}')]",
               "planetblue:total_items"
  end

  def should_see_total_items(key = nil, number)
    element = find_element(key, il_type: :xpath, tl: total_items(:ta, number),
                           il: total_items(:il, number), check_path: $check_path)
    expect(element).to be_visible
  end

  def page_header(key, title)
    locator_by key, "//h1[text()=\"#{title}\"]|//h3[text()=\"#{title}\"]",
               "planetblue:page_header_title:#{ta_name(title)}"
  end

  def should_see_page_header(key = nil, title)
    element = find_element key, il_type: :xpath, tl: page_header(:ta, title),
                           il: page_header(:il, title), check_path: $check_path
    expect(element).to be_visible
  end

  def navbar_link(key, title)
    locator_by key, "//span[contains(text(), '#{title}')]/ancestor::a",
               "planetblue:navbar:link:#{ta_name(title)}"
  end

  def click_navbar_link(key = nil, value)
    find_element(key, il_type: :xpath, tl: navbar_link(:ta, value),
                 il: navbar_link(:il, value), check_path: $check_path).click
  end

  def breadcrumb(key, name, with_link)
    with_link ? el = "//form//a[text()='#{name}']" : el = "//form//span[text()='#{name}']"
    locator_by key, el,"planetblue:breadcrumbs:#{ta_name(name)}"
  end

  def should_see_breadcrumb(key = nil, value, with_link)
    element = find_element(key, il_type: :xpath, tl: breadcrumb(:ta, value, with_link),
                           il: breadcrumb(:il, value, with_link), check_path: $check_path)
    expect(element).to be_visible
  end

  def content_card_button(key, name)
    locator_by key, "//h3[@class='content-card__title' and text()='#{name}']",
               "planetblue:content_card_button:#{ta_name(name)}"
  end

  def find_content_card_button(key = nil, name)
    element = find_element(key, il_type: :xpath, tl: content_card_button(:ta, name),
                           il: content_card_button(:il, name), check_path: $check_path)
    expect(element).to be_visible
  end

  def click_content_card_button(key = nil, name)
    find_element(key, il_type: :xpath, tl: content_card_button(:ta, name),
                 il: content_card_button(:il, name), check_path: $check_path).click
  end

  def click_header_logo(key = nil)
    find_element(key, il_type: :css, tl: HEADER_LOGO_TA, il: HEADER_LOGO_IL, check_path: $check_path).click
  end

end
