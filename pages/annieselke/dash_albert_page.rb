require_relative '../page_extension'

class DashAlbertPage < PageExtension


  DASH_AN_ALBERT_IMG_IL = "//img[@title='Dash & Albert']"
  DASH_AN_ALBERT_IMG_TA = "annieselke:dash_albert_page:dash_an_albert_img"


  def should_see_dash_an_albert_img(key = nil)
    element = find_element(key, il_type: :xpath, tl: DASH_AN_ALBERT_IMG_TA, il: DASH_AN_ALBERT_IMG_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
