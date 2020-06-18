require_relative '../page_extension'

class LeftSideMenu < PageExtension


  CUSTOMER_NAME_IL = "#hmenu-customer-name"
  CUSTOMER_NAME_TA = "amazon:left_side_menu:customer_name"

  SHOP_BY_CATEGORY_IL = "//div[contains(@class, 'hmenu-title') and text()='shop by category']"
  SHOP_BY_CATEGORY_TA = "amazon:left_side_menu:shop_by_category_text"

  WOMEN_FASHION_LINK_IL = "//a[@data-menu-id='22']/*[contains(text(), 'Fashion')]"
  WOMEN_FASHION_LINK_TA = "amazon:left_side_menu:women_fashion"

  WOMEN_FASHION_IL = "(//div[contains(text(),'fashion') and @class='hmenu-item hmenu-title'])[1]"
  WOMEN_FASHION_TA = "amazon:left_side_menu:women_fashion_text"

  JEWELERY_IL = "(//a[text()='Jewelry'])[1]"
  JEWELERY_TA = "amazon:left_side_menu:jewelry"


  def should_see_customer_name(key = nil)
    element = find_element(key, il_type: :css, tl: CUSTOMER_NAME_TA, il: CUSTOMER_NAME_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_by_category_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: SHOP_BY_CATEGORY_TA, il: SHOP_BY_CATEGORY_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_women_fashion_link(key = nil)
    find_element(key, il_type: :xpath, tl: WOMEN_FASHION_LINK_TA, il: WOMEN_FASHION_LINK_IL, check_path: $check_path).click
  end

  def should_see_women_fashion_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: WOMEN_FASHION_TA, il: WOMEN_FASHION_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_jewelry_link(key = nil)
    find_element(key, il_type: :xpath, tl: JEWELERY_TA, il: JEWELERY_IL, check_path: $check_path).click
  end

end
