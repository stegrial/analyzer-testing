require_relative '../page_extension'

class TheTiebarFooterPage < PageExtension

  CONTACT_IL = "//div[contains(., 'Need Help')]//a[contains(., 'Contact')]"
  CONTACT_TA = "thetiebar:footer_page:need_help_section:contact"

  SHIPPING_IL = "//div[contains(., 'Need Help')]//a[contains(., 'Shipping')]"
  SHIPPING_TA = "thetiebar:footer_page:need_help_section:shipping"

  RETURNS_IL = "//div[contains(., 'Need Help')]//a[contains(., 'Returns')]"
  RETURNS_TA = "thetiebar:footer_page:need_help_section:returns"

  TRACK_MY_ORDER_IL = "//div[contains(., 'Need Help')]//a[contains(., 'Track My Order')]"
  TRACK_MY_ORDER_TA = "thetiebar:footer_page:need_help_section:track_my_order"

  ABOUT_US_IL = "//div[contains(., 'Need Help')]//a[contains(., 'About Us')]"
  ABOUT_US_TA = "thetiebar:footer_page:need_help_section:about_us"

  ABOUT_OUR_STORES_IL = "//div[contains(., 'Need Help')]//a[contains(., 'About Our Stores')]"
  ABOUT_OUR_STORES_TA = "thetiebar:footer_page:need_help_section:about_our_stores"

  FAQ_IL = "//div[contains(., 'Need Help')]//a[contains(., 'FAQ')]"
  FAQ_TA = "thetiebar:footer_page:need_help_section:faq"

  CAREERS_IL = "//div[contains(., 'Need Help')]//a[contains(., 'Careers')]"
  CAREERS_TA = "thetiebar:footer_page:need_help_section:Careers"

  CANADA_IL = "//div[contains(., 'Need Help')]//a[contains(., 'Canada')]"
  CANADA_TA = "thetiebar:footer_page:need_help_section:Canada"

  PROMOTIONS_IL = "//div[contains(., 'Need Help')]//a[contains(., 'Promotions')]"
  PROMOTIONS_TA = "thetiebar:footer_page:need_help_section:promotions"

  HOLIDAY_TIES_IL = "//a[@href='https://www.thetiebar.com/pages/holiday-ties']"
  HOLIDAY_TIES_TA = "thetiebar:footer_page:Holiday_ties"

  CONTACT_US_H1_IL = "//h1[contains(text(),'contact us')]"
  CONTACT_US_H1_TA = "thetiebar:contact_page:contact_us"

  SHIPPING_H1_IL = "//h1[text()='shipping']"
  SHIPPING_H1_TA = "thetiebar:shipping_page:shipping_h1"

  RETURNS_H1_IL = "//h1[text()='returns']"
  RETURNS_H1_TA = "thetiebar:returns_page:returns_h1"

  TRACK_MY_ORDER_H1_IL = "//h1[text()='track my order']"
  TRACK_MY_ORDER_H1_TA = "thetiebar:track_page:track_my_order_h1"

  ABOUT_US_H1_IL = "//h1[contains(text(),'about Tie Bar')]"
  ABOUT_US_H1_TA = "thetiebar:about_page:about_tiebar_h1"

  FAQ_H1_IL = "//h1[text()='FAQ']"
  FAQ_H1_TA = "thetiebar:faq_page:FAQ_h1"

  CURRENT_OPEN_POSITIONS_H1_IL = "//h1[text()='current open positions']"
  CURRENT_OPEN_POSITIONS_H1_TA = "thetiebar:jobs_page:current_posittions_h1"

  PROMOTIONS_H1_IL = "//h1[text()='Tie Bar promotions']"
  PROMOTIONS_H1_TA = "thetiebar:promocode_page:promotions_h1"


  def click_contact(key = nil)
    find_element(key, il_type: :xpath, tl: CONTACT_TA, il: CONTACT_IL, check_path: $check_path).click
  end

  def click_shipping(key = nil)
    find_element(key, il_type: :xpath, tl: SHIPPING_TA, il: SHIPPING_IL, check_path: $check_path).click
  end

  def click_returns(key = nil)
    find_element(key, il_type: :xpath, tl: RETURNS_TA, il: RETURNS_IL, check_path: $check_path).click
  end

  def click_track_my_orders(key = nil)
    find_element(key, il_type: :xpath, tl: TRACK_MY_ORDER_TA, il: TRACK_MY_ORDER_IL, check_path: $check_path).click
  end

  def click_about_us(key = nil)
    find_element(key, il_type: :xpath, tl: ABOUT_US_TA, il: ABOUT_US_IL, check_path: $check_path).click
  end

  def click_about_our_stores(key = nil)
    find_element(key, il_type: :xpath, tl: ABOUT_OUR_STORES_TA, il: ABOUT_OUR_STORES_IL, check_path: $check_path).click
  end

  def click_faq(key = nil)
    find_element(key, il_type: :xpath, tl: FAQ_TA, il: FAQ_IL, check_path: $check_path).click
  end

  def click_careers(key = nil)
    find_element(key, il_type: :xpath, tl: CAREERS_TA, il: CAREERS_IL, check_path: $check_path).click
  end

  def click_canada(key = nil)
    find_element(key, il_type: :xpath, tl: CANADA_TA, il: CANADA_IL, check_path: $check_path).click
  end

  def click_promotions(key = nil)
    find_element(key, il_type: :xpath, tl: PROMOTIONS_TA, il: PROMOTIONS_IL, check_path: $check_path).click
  end

  def click_holiday_ties(key = nil)
    find_element(key, il_type: :xpath, tl: HOLIDAY_TIES_TA, il: HOLIDAY_TIES_IL, check_path: $check_path).click
  end

  def should_see_contact_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: CONTACT_US_H1_TA, il: CONTACT_US_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, CONTACT_US_H1_IL) if key == :il
    # assert_selector(:xpath, ta(CONTACT_US_H1_TA, CONTACT_US_H1_IL))
  end

  def should_see_shipping_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: SHIPPING_H1_TA, il: SHIPPING_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, SHIPPING_H1_IL) if key == :il
    # assert_selector(:xpath, ta(SHIPPING_H1_TA, SHIPPING_H1_IL))
  end

  def should_see_returns_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: RETURNS_H1_TA, il: RETURNS_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, RETURNS_H1_IL) if key == :il
    # assert_selector(:xpath, ta(RETURNS_H1_TA, RETURNS_H1_IL))
  end

  def should_see_track_my_order_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: TRACK_MY_ORDER_H1_TA, il: TRACK_MY_ORDER_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, TRACK_MY_ORDER_H1_IL) if key == :il
    # assert_selector(:xpath, ta(TRACK_MY_ORDER_H1_TA, TRACK_MY_ORDER_H1_IL))
  end

  def should_see_about_us_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: ABOUT_US_H1_TA, il: ABOUT_US_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, ABOUT_US_H1_IL) if key == :il
    # assert_selector(:xpath, ta(ABOUT_US_H1_TA, ABOUT_US_H1_IL))
  end

  def should_see_faq_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: FAQ_H1_TA, il: FAQ_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, FAQ_H1_IL) if key == :il
    # assert_selector(:xpath, ta(FAQ_H1_TA, FAQ_H1_IL))
  end

  def should_see_current_posittions_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: CURRENT_OPEN_POSITIONS_H1_TA, il: CURRENT_OPEN_POSITIONS_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, CURRENT_OPEN_POSITIONS_H1_IL) if key == :il
    # assert_selector(:xpath, ta(CURRENT_OPEN_POSITIONS_H1_TA, CURRENT_OPEN_POSITIONS_H1_IL))
  end

  def should_see_promotions_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: PROMOTIONS_H1_TA, il: PROMOTIONS_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, PROMOTIONS_H1_IL) if key == :il
    # assert_selector(:xpath, ta(PROMOTIONS_H1_TA, PROMOTIONS_H1_IL))
  end

end
