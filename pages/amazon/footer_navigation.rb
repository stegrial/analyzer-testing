require_relative '../page_extension'

class FooterNavigation < PageExtension


  BACK_TO_TOP_IL = "#navBackToTop"
  BACK_TO_TOP_TA = "amazon:footer:back_to_top_btn"

  GET_TO_KNOW_US_IL = "//div[contains(@class,'navFooterColHead') and text()='Get to Know Us']"
  GET_TO_KNOW_US_TA = "amazon:footer:get_to_know_us"

  MAKE_MONEY_WITH_US_IL = "//div[contains(@class,'navFooterColHead') and text()='Make Money with Us']"
  MAKE_MONEY_WITH_US_TA = "amazon:footer:make_money_with_us"

  AMAZON_PAYMENT_IL = "//div[contains(@class,'navFooterColHead') and text()='Amazon Payment Products']"
  AMAZON_PAYMENT_TA = "amazon:footer:amazon_payment_products"

  LET_US_HELP_YOU_IL = "//div[contains(@class,'navFooterColHead') and text()='Let Us Help You']"
  LET_US_HELP_YOU_TA = "amazon:footer:let_us_help_you"

  CAREERS_IL = "//a[text()='Careers']"
  CAREERS_TA = "amazon:footer:careers"

  SELL_ON_AMAZON_BUSINESS_IL = "//a[text()='Sell on Amazon Business']"
  SELL_ON_AMAZON_BUSINESS_TA = "amazon:footer:sell_on_amazon_business"

  SHOP_WITH_POINTS_IL = "//a[text()='Shop with Points']"
  SHOP_WITH_POINTS_TA = "amazon:footer:shop_with_points"

  YOUR_ACCOUNT_IL = "//a[text()='Your Account']"
  YOUR_ACCOUNT_TA = "amazon:footer:your_account"

  FOOTER_LOGO_IL = "//a[contains(@href,'footer_logo')]"
  FOOTER_LOGO_TA = "amazon:footer:footer_logo"

  LANGUAGE_LEARN_MORE_IL = "//p[@id='icp-sl-t-text']/a[text()='Learn more']"
  LANGUAGE_LEARN_MORE_TA = "amazon:footer:learn_more_link"

  LANGUAGE_BTN_IL = "a#icp-touch-link-language"
  LANGUAGE_BTN_TA = "amazon:footer:language_btn"

  WEBSITE_REGION_IL = "//h4[@id='a-popover-header-1']//*[contains(text(),'Website (Country/Region)')]"
  WEBSITE_REGION_TA = "amazon:footer:website_region"

  REGION_BTN_IL = "a#icp-touch-link-country"
  REGION_BTN_TA = "amazon:footer:region_btn"

  CANCEL_REGION_BTN_IL = "//button[contains(text(),'Cancel')]"
  CANCEL_REGION_BTN_TA = "amazon:footer:cancel_btn"

  ADVERTISING_IL = "//td[@class='navFooterDescItem']/a[text()='Amazon Advertising']"
  ADVERTISING_TA = "amazon:footer:amazon_advertising_link"


  def should_see_back_to_top_btn(key = nil)
    element = find_element(key, il_type: :css, tl: BACK_TO_TOP_TA, il: BACK_TO_TOP_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_get_to_know_us(key = nil)
    element = find_element(key, il_type: :xpath, tl: GET_TO_KNOW_US_TA, il: GET_TO_KNOW_US_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_make_money_with_us(key = nil)
    element = find_element(key, il_type: :xpath, tl: MAKE_MONEY_WITH_US_TA, il: MAKE_MONEY_WITH_US_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_amazon_payment(key = nil)
    element = find_element(key, il_type: :xpath, tl: AMAZON_PAYMENT_TA, il: AMAZON_PAYMENT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_let_us_help_you(key = nil)
    element = find_element(key, il_type: :xpath, tl: LET_US_HELP_YOU_TA, il: LET_US_HELP_YOU_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_careers_link(key = nil)
    find_element(key, il_type: :xpath, tl: CAREERS_TA, il: CAREERS_IL, check_path: $check_path).click
  end

  def click_sell_on_amazon_business(key = nil)
    find_element(key, il_type: :xpath, tl: SELL_ON_AMAZON_BUSINESS_TA, il: SELL_ON_AMAZON_BUSINESS_IL, check_path: $check_path).click
    end

  def click_shop_with_points(key = nil)
    find_element(key, il_type: :xpath, tl: SHOP_WITH_POINTS_TA, il: SHOP_WITH_POINTS_IL, check_path: $check_path).click
  end

  def click_your_account(key = nil)
    find_element(key, il_type: :xpath, tl: YOUR_ACCOUNT_TA, il: YOUR_ACCOUNT_IL, check_path: $check_path).click
  end

  def should_see_footer_logo(key = nil)
    element = find_element(key, il_type: :xpath, tl: FOOTER_LOGO_TA, il: FOOTER_LOGO_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_language_btn(key = nil)
    find_element(key, il_type: :css, tl: LANGUAGE_BTN_TA, il: LANGUAGE_BTN_IL, check_path: $check_path).click
  end

  def click_learn_more_link(key = nil)
    find_element(key, il_type: :xpath, tl: LANGUAGE_LEARN_MORE_TA, il: LANGUAGE_LEARN_MORE_IL, check_path: $check_path).click
  end

  def click_region_btn(key = nil)
    find_element(key, il_type: :css, tl: REGION_BTN_TA, il: REGION_BTN_IL, check_path: $check_path).click
  end

  def should_see_website_region(key = nil)
    element = find_element(key, il_type: :xpath, tl: WEBSITE_REGION_TA, il: WEBSITE_REGION_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_cancel_region_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CANCEL_REGION_BTN_TA, il: CANCEL_REGION_BTN_IL, check_path: $check_path).click
  end

  def click_amazon_advertising_link(key = nil)
    find_element(key, il_type: :xpath, tl: ADVERTISING_TA, il: ADVERTISING_IL, check_path: $check_path).click
  end

end
