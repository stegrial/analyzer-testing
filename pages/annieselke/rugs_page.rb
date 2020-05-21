require_relative '../page_extension'

class RugsPage < PageExtension

  RUGS_H1_IL = "//div[@class='header']/h1"
  RUGS_H1_TA = "annieselke:rugs_page:rugs_h1"


  def should_see_rugs_h1(key = nil)
      return assert_selector(:xpath, RUGS_H1_IL) if key == :il
      assert_selector(:xpath, ta(RUGS_H1_TA, RUGS_H1_IL))
  end

end