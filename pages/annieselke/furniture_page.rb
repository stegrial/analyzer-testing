require_relative '../page_extension'

class FurniturePage < PageExtension

  FURNITURE_H1_IL = "//div[@class='header']/h1"
  FURNITURE_H1_TA = "annieselke:furniture_page:furniture_h1"


  def should_see_furniture_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: FURNITURE_H1_TA, il: FURNITURE_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
