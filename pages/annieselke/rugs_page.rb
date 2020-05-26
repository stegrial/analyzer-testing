require_relative '../page_extension'

class RugsPage < PageExtension

  RUGS_H1_IL = "//div[@class='header']/h1"
  RUGS_H1_TA = "annieselke:rugs_page:rugs_h1"


  def should_see_rugs_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: RUGS_H1_TA, il: RUGS_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
