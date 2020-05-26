require_relative '../page_extension'

class GiftsPage < PageExtension

  GIFTS_H1_IL = "//div[@class='header']/h1"
  GIFTS_H1_TA = "annieselke:gifts_page:gifts_h1"


  def should_see_gifts_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: GIFTS_H1_TA, il: GIFTS_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
