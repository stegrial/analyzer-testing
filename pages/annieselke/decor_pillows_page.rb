require_relative '../page_extension'

class DecorPillowsPage < PageExtension

  DECOR_PILLOWS_H1_IL = "//div[@class='header']/h1"
  DECOR_PILLOWS_H1_TA = "annieselke:decor_pillows_page:decor_pillows_h1"


  def should_see_decor_pillows_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: DECOR_PILLOWS_H1_TA, il: DECOR_PILLOWS_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
