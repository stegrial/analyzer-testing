require_relative '../page_extension'

class TravelPageFlipkart < PageExtension


  TRAVEL_PAGE_IL = "//div[contains(text(),'Travel') and @class='_1C_HYs']"
  TRAVEL_PAGE_TA = "flipkart:travel_page:travel_Page"


  def should_see_travel_page(key = nil)
    element = find_element(key, il_type: :xpath, tl: TRAVEL_PAGE_TA, il: TRAVEL_PAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end