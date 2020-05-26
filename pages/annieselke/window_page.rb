require_relative '../page_extension'

class WindowPage < PageExtension

  WINDOW_H1_IL = "//div[@class='header']/h1"
  WINDOW_H1_TA = "annieselke:window_page:window_h1"


  def should_see_window_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: WINDOW_H1_TA, il: WINDOW_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
