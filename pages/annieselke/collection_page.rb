require_relative '../page_extension'

class CollectionsPage < PageExtension


  COLLECTIONS_H1_IL = "//div[@class='header']/h1"
  COLLECTIONS_H1_TA = "annieselke:collections_page:collections_h1"


  def should_see_collections_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: COLLECTIONS_H1_TA, il: COLLECTIONS_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
