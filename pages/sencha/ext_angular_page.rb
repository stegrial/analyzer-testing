require_relative '../page_extension'

class ExtAngularPage < PageExtension

  HERO_HEADER_IL = "//div[@id='heroHeader']/h1"
  HERO_HEADER_TA = "sencha:ext_angular_page:hero_header"

  HERO_TEXT_IL = "//div[@id='heroText']/p"
  HERO_TEXT_TA = "sencha:ext_angular_page:hero_text"


  def should_see_hero_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: HERO_HEADER_TA, il: HERO_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_hero_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: HERO_TEXT_TA, il: HERO_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
