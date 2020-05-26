require_relative '../page_extension'

class PineConeHillPage < PageExtension

  PINE_CONE_HILL_IMG_IL = "//img[@title='Pine Cone Hill']"
  PINE_CONE_HILL_IMG_TA = "annieselke:pine_cone_hill_page:pine_cone_hill_img"


  def should_see_pine_cone_hill_img(key = nil)
    element = find_element(key, il_type: :xpath, tl: PINE_CONE_HILL_IMG_TA, il: PINE_CONE_HILL_IMG_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
