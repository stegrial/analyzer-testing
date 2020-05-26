require_relative '../page_extension'

class OutletPage < PageExtension

  OUTLET_IMG_IL = "//img[@title='Annie Selke Outlet']"
  OUTLET_IMG_TA = "annieselke:outlet_page:outlet_img"


  def should_see_outlet_img(key = nil)
    element = find_element(key, il_type: :xpath, tl: OUTLET_IMG_TA, il: OUTLET_IMG_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
