require_relative '../page_extension'

class HomePage < PageExtension

  ANNIE_SELKE_IMG_IL = "//img[@title='Annie Selke']"
  ANNIE_SELKE_IMG_TA = "annieselke:home_page:annie_selke_img"

  def should_see_annie_selke_img(key = nil)
    element = find_element(key, il_type: :xpath, tl: ANNIE_SELKE_IMG_TA, il: ANNIE_SELKE_IMG_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
