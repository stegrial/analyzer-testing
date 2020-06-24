require_relative '../page_extension'

class SellingPage < PageExtension


  SELLING_PAGE_IL = "//h2[contains(@class, 'heading')]"
  SELLING_PAGE_TA = "amazon:selling_page:sell_page"


  def should_see_selling_page(key = nil)
    element = find_element(key, il_type: :xpath, tl: SELLING_PAGE_TA, il: SELLING_PAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
