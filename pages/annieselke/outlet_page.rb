require_relative '../page_extension'

class OutletPage < PageExtension

  OUTLET_IMG_IL = "//img[@title='Annie Selke Outlet']"
  OUTLET_IMG_TA = "annieselke:outlet_page:outlet_img"


  def should_see_outlet_img(key = nil)
      return assert_selector(:xpath, OUTLET_IMG_IL) if key == :il
      assert_selector(:xpath, ta(OUTLET_IMG_TA, OUTLET_IMG_IL))
  end

end