require_relative '../page_extension'

class BeddingPage < PageExtension

  BEDDING_H1_IL = "//div[@class='header']/h1"
  BEDDING_H1_TA = "annieselke:bedding_page:bedding_h1"


  def should_see_bedding_h1(key = nil)
      return assert_selector(:xpath, BEDDING_H1_IL) if key == :il
      assert_selector(:xpath, ta(BEDDING_H1_TA, BEDDING_H1_IL))
  end

end