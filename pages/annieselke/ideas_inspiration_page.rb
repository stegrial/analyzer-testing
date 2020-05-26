require_relative '../page_extension'

class IdeasInspirationPage < PageExtension

  IDEAS_INSPIRATION_H2_IL = "//div[@class='header']/h2"
  IDEAS_INSPIRATION_H2_TA = "annieselke:ideas_inspiration_page:ideas_inspiration_h2"


  def should_see_ideas_and_ins_h2(key = nil)
    element = find_element(key, il_type: :xpath, tl: IDEAS_INSPIRATION_H2_TA, il: IDEAS_INSPIRATION_H2_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
