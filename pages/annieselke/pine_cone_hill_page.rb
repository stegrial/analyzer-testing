require_relative '../page_extension'

class PineConeHillPage < PageExtension

  PINE_CONE_HILL_IMG_IL = "//img[@title='Pine Cone Hill']"
  PINE_CONE_HILL_IMG_TA = "annieselke:pine_cone_hill_page:pine_cone_hill_img"


  def should_see_pine_cone_hill_img(key = nil)
      return assert_selector(:xpath, PINE_CONE_HILL_IMG_IL) if key == :il
      assert_selector(:xpath, ta(PINE_CONE_HILL_IMG_TA, PINE_CONE_HILL_IMG_IL))
  end

end