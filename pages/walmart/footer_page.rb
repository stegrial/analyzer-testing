require_relative '../page_extension'

class FooterPageWalmart < PageExtension


  NEWSLETTER_SIGNUP_IL = "#hf-email-signup-btn"
  NEWSLETTER_SIGNUP_TA = "walmart:footer_page:newsletter_signup"

  INPUT_ERROR_IL = "#hf-email-input-error"
  INPUT_ERROR_TA = "walmart:footer_page:input_error"

  EMAIL_INPUT_IL = "#hf-email-input"
  EMAIL_INPUT_TA = "walmart:footer_page:email_input"

  FACEBOOK_ICON_IL = "//*[@id='js-global-footer-wrapper']//*[@title='facebook']"
  FACEBOOK_ICON_TA =  "walmart:footer_page:facebook_icon"

  TWITTER_ICON_IL = "//*[@id='js-global-footer-wrapper']//*[@title='twitter']"
  TWITTER_ICON_TA =  "walmart:footer_page:twitter_icon"

  PINTEREST_ICON_IL = "//*[@id='js-global-footer-wrapper']//*[@title='pinterest']"
  PINTEREST_ICON_TA =  "walmart:footer_page:pinterest_icon"

  YOUTUBE_ICON_IL = "//*[@id='js-global-footer-wrapper']//*[@title='youtube']"
  YOUTUBE_ICON_TA =  "walmart:footer_page:youtube_icon"

  INSTAGRAM_ICON_IL = "//*[@id='js-global-footer-wrapper']//*[@title='instagram']"
  INSTAGRAM_ICON_TA =  "walmart:footer_page:instagram_icon"

  MOBILE_APPS_ICON_IL = "//*[@id='js-global-footer-wrapper']//*[@title='Walmart mobile apps']"
  MOBILE_APPS_ICON_TA =  "walmart:footer_page:mobile_apps"

  MONEY_CENTER_IL = "//a[contains(@aria-label,'MoneyCenter')]"
  MONEY_CENTER_TA = "walmart:footer_page:money_center"

  DIGITAL_MUSEUM_IL= "//a[contains(@aria-label,'Digital Museum')]"
  DIGITAL_MUSEUM_TA= "walmart:footer_page:digital_museum"

  OUR_ADS_IL = "//a[contains(@aria-label,'Our Ads')]"
  OUR_ADS_TA = "walmart:footer_page:our_ads"

  RETURNS_IL = "//a[contains(@aria-label,'Returns')]"
  RETURNS_TA =  "walmart:footer_page:returns"

  NINTENDO_IL = "//a[contains(@aria-label,'Nintendo Switch')]"
  NINTENDO_TA =  "walmart:footer_page:nintendo_switch"

  COPYRIGHT_TEXT_IL = "//*[@data-tl-id='footer-GlobalFooterCopyright-text']"
  COPYRIGHT_TEXT_TA = "walmart:footer_page:copyright_text"

  REFERENCE_ID_IL = "#copyright-reference-id"
  REFERENCE_ID_TA = "walmart:footer_page:reference_id"

  def click_newsletter_signup(key = nil)
    find_element(key, il_type: :css, tl: NEWSLETTER_SIGNUP_TA, il: NEWSLETTER_SIGNUP_IL, check_path: $check_path).click
  end

  def should_see_input_error(key = nil)
    element = find_element(key, il_type: :css, tl: INPUT_ERROR_TA, il: INPUT_ERROR_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_email_input(key = nil, value)
    find_element(key, il_type: :css, tl: EMAIL_INPUT_TA, il: EMAIL_INPUT_IL, check_path: $check_path).set(value)
  end

  def should_see_facebook_icon(key = nil)
    element = find_element(key, il_type: :xpath, tl: FACEBOOK_ICON_TA, il: FACEBOOK_ICON_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_twitter_icon(key = nil)
    element = find_element(key, il_type: :xpath, tl: TWITTER_ICON_TA, il: TWITTER_ICON_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_pinterest_icon(key = nil)
    element = find_element(key, il_type: :xpath, tl: PINTEREST_ICON_TA, il: PINTEREST_ICON_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_instagram_icon(key = nil)
    element = find_element(key, il_type: :xpath, tl: INSTAGRAM_ICON_TA, il: INSTAGRAM_ICON_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_mobile_apps(key = nil)
    element = find_element(key, il_type: :xpath, tl: MOBILE_APPS_ICON_TA, il: MOBILE_APPS_ICON_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_money_center(key = nil)
    find_element(key, il_type: :xpath, tl: MONEY_CENTER_TA, il: MONEY_CENTER_IL, check_path: $check_path).click
  end

  def click_digital_museum(key = nil)
    find_element(key, il_type: :xpath, tl: DIGITAL_MUSEUM_TA, il: DIGITAL_MUSEUM_IL, check_path: $check_path).click
  end

  def click_our_ads(key = nil)
    find_element(key, il_type: :xpath, tl: OUR_ADS_TA, il: OUR_ADS_IL, check_path: $check_path).click
  end

  def click_returns(key = nil)
    find_element(key, il_type: :xpath, tl: RETURNS_TA, il: RETURNS_IL, check_path: $check_path).click
  end

  def click_nintendo_switch(key = nil)
    find_element(key, il_type: :xpath, tl: NINTENDO_TA, il: NINTENDO_IL, check_path: $check_path).click
  end

  def should_see_copyright_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: COPYRIGHT_TEXT_TA, il: COPYRIGHT_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_reference_id(key = nil)
    element = find_element(key, il_type: :css, tl: REFERENCE_ID_TA, il: REFERENCE_ID_IL, check_path: $check_path)
    expect(element).to be_visible
  end
end