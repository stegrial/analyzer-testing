require_relative '../page_extension'

class WindowPage < PageExtension

  WINDOW_H1_IL = "//div[@class='header']/h1"
  WINDOW_H1_TA = "annieselke:window_page:window_h1"


  def should_see_window_h1(key = nil)
      return assert_selector(:xpath, WINDOW_H1_IL) if key == :il
      assert_selector(:xpath, ta(WINDOW_H1_TA, WINDOW_H1_IL))
  end

end