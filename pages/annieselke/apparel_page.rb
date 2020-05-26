require_relative '../page_extension'

class ApparelPage < PageExtension


  APPAREL_H1_IL = "//div[@class='header']/h1"
  APPAREL_H1_TA = "annieselke:apparel_page:apparel_h1"


  def should_see_apparel_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: APPAREL_H1_TA, il: APPAREL_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
