require_relative '../page_extension'

class BeddingPage < PageExtension

  BEDDING_H1_IL = "//div[@class='header']/h1"
  BEDDING_H1_TA = "annieselke:bedding_page:bedding_h1"


  def should_see_bedding_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: BEDDING_H1_TA, il: BEDDING_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
