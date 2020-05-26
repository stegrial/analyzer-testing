require_relative '../page_extension'

class TheTiebarCanada < PageExtension

  SHOP_WEDDING_LINK_IL = "//div[@id='canada-content']//a[@href='/wedding-ties']"
  SHOP_WEDDING_LINK_TA = "thetiebar:canada_page:wedding_shop"

  SHIRTS_SHOP_LINK_IL = "//a[@href='/shirts']"
  SHIRTS_SHOP_LINK_TA = "thetiebar:canada_page:shirts_shop"

  THE_TIABAR_CANADA_H1_IL = "//h1[text()='Tie Bar Canada']"
  THE_TIABAR_CANADA_H1_TA = "thetiebar:canada_page:canada_h1"


  def should_see_canada_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: THE_TIABAR_CANADA_H1_TA, il: THE_TIABAR_CANADA_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, THE_TIABAR_CANADA_H1_IL) if key == :il
    # assert_selector(:xpath, ta(THE_TIABAR_CANADA_H1_TA, THE_TIABAR_CANADA_H1_IL))
  end

  def click_wedding_shop(key = nil)
    find_element(key, il_type: :xpath, tl: SHOP_WEDDING_LINK_TA, il: SHOP_WEDDING_LINK_IL, check_path: $check_path).click
  end

  def click_shirts_shop(key = nil)
    find_element(key, il_type: :xpath, tl: SHIRTS_SHOP_LINK_TA, il: SHIRTS_SHOP_LINK_IL, check_path: $check_path).click
  end

end
