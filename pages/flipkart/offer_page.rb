require_relative '../page_extension'

class OfferPageFlipkart < PageExtension


  FASHION_TOP_DEALS_H2_IL = "(//div/h2)[1]"
  FASHION_TOP_DEALS_H2_TA = "flipkart:offer_page:fashion_top_deals"

  MOBILE_NEW_LAUNCHES_IL = "(//div/h2)[2]"
  MOBILE_NEW_LAUNCHES_TA = "flipkart:offer_page:mobile_new_launches"


  def should_see_fashion_top_deals(key = nil)
    element = find_element(key, il_type: :xpath, tl: FASHION_TOP_DEALS_H2_TA, il: FASHION_TOP_DEALS_H2_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_mobile_new_launches(key = nil)
    element = find_element(key, il_type: :xpath, tl: MOBILE_NEW_LAUNCHES_TA, il: MOBILE_NEW_LAUNCHES_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
