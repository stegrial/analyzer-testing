require_relative '../page_extension'

class SupportPage < PageExtension

  HEADER_SUP_TEXT_IL = "//h1[contains(@class, 'entry-title')]"
  HEADER_SUP_TEXT_TA = "sencha:support_page:header_sup_text"

  IMG_HEADER_IL = "//img[@class='lazyloaded']"
  IMG_HEADER_TA = "sencha:support_page:img_header"


  def should_see_header_sup_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: HEADER_SUP_TEXT_TA, il: HEADER_SUP_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_img_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: IMG_HEADER_TA, il: IMG_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
