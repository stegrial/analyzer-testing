require_relative '../page_extension'

class BathPage < PageExtension


  BATH_H1_IL = "//div[@class='header']/h1"
  BATH_H1_TA = "annieselke:bath_page:bath_h1"


  def should_see_bath_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: BATH_H1_TA, il: BATH_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
