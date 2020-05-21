require_relative '../page_extension'

class GiftsPage < PageExtension

  GIFTS_H1_IL = "//div[@class='header']/h1"
  GIFTS_H1_TA = "annieselke:gifts_page:gifts_h1"


  def should_see_gifts_h1(key = nil)
      return assert_selector(:xpath, GIFTS_H1_IL) if key == :il
      assert_selector(:xpath, ta(GIFTS_H1_TA, GIFTS_H1_IL))
  end

end