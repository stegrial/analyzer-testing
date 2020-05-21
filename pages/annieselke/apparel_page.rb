require_relative '../page_extension'

class ApparelPage < PageExtension


  APPAREL_H1_IL = "//div[@class='header']/h1"
  APPAREL_H1_TA = "annieselke:apparel_page:apparel_h1"


  def should_see_apparel_h1(key = nil)
      return assert_selector(:xpath, APPAREL_H1_IL) if key == :il
      assert_selector(:xpath, ta(APPAREL_H1_TA, APPAREL_H1_IL))
  end

end