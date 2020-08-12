require_relative '../page_extension'

class ForumPage < PageExtension

  HEADER_FOR_TEXT_IL = "//span[text()='Forum']"
  HEADER_FOR_TEXT_TA = "sencha:forum_page:header_for_text"


  def should_see_header_forum_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: HEADER_FOR_TEXT_TA, il: HEADER_FOR_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
