require_relative '../page_extension'

class AdvertisingPage < PageExtension

  ADVERTISING_LOGO_IL = "//a[@title='Amazon Advertising']"
  ADVERTISING_LOGO_TA = "amazon:advertising_page:advertising_logo"

  AMAZON_ADVERTISING_H1_IL = "//h1[@class='hero__title heading']"
  AMAZON_ADVERTISING_H1_TA = "amazon:advertising_page:amazon_advertising_h1"

  MAIN_VIDEO_IL = "//div[@class='video-container']/video"
  MAIN_VIDEO_TA = "amazon:advertising_page:main_video"

  GET_STARTED_NOW_IL = "//h2[text()='Get started now']"
  GET_STARTED_NOW_TA = "amazon:advertising_page:get_started_now"

  SPONSORED_POPUP_IL = "//a[@data-popup-id='sponsored-products-popup']"
  SPONSORED_POPUP_TA = "amazon:advertising_page:sponsored_popup"

  SPONSORED_PRODUCT_H4_IL = "//h4[text()='Sponsored Products']"
  SPONSORED_PRODUCT_H4_TA = "amazon:advertising_page:sponsored_product_h4"

  LEARN_MORE_IL = "//div[@id='sponsored-products-popup']//div[@class='align-start ']/a[text()='Learn more']"
  LEARN_MORE_TA = "amazon:advertising_page:learn_more"

  MORE_PRODUCTS_IL = "//h2[text()='More advertising products']"
  MORE_PRODUCTS_TA = "amazon:advertising_page:more_product_h2"

  LEARN_MORE_PRODUCTS_IL = "(//div[@class='tile-container__inner']//a[text()='Learn More'])[2]"
  LEARN_MORE_PRODUCTS_TA = "amazon:advertising_page:learn_more_product"

  VIDEO_ADS_H1_IL = "//h1[text()='Video ads']"
  VIDEO_ADS_H1_TA = "amazon:advertising_page:video_ads_h1"

  MORE_RESOURCES_IL = "//h2[text()='More resources']"
  MORE_RESOURCES_TA = "amazon:advertising_page:more_resources"

  FAQ_IL = "//a[text()='FAQ']"
  FAQ_TA = "amazon:advertising_page:faq"

  FAQ_H1_IL = "//h1[text()='FAQ']"
  FAQ_H1_TA = "amazon:advertising_page:faq_h1"


  def should_see_advertising_logo(key = nil)
    element = find_element(key, il_type: :xpath, tl: ADVERTISING_LOGO_TA, il: ADVERTISING_LOGO_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_amazon_advertising_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: AMAZON_ADVERTISING_H1_TA, il: AMAZON_ADVERTISING_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_main_video(key = nil)
    element = find_element(key, il_type: :xpath, tl: MAIN_VIDEO_TA, il: MAIN_VIDEO_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_get_started_now(key = nil)
    element = find_element(key, il_type: :xpath, tl: GET_STARTED_NOW_TA, il: GET_STARTED_NOW_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_sponsored_popup(key = nil)
    find_element(key, il_type: :xpath, tl: SPONSORED_POPUP_TA, il: SPONSORED_POPUP_IL, check_path: $check_path).click
  end

  def should_see_sponsored_product_h4(key = nil)
    element = find_element(key, il_type: :xpath, tl: SPONSORED_PRODUCT_H4_TA, il: SPONSORED_PRODUCT_H4_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_learn_more(key = nil)
    find_element(key, il_type: :xpath, tl: LEARN_MORE_TA, il: LEARN_MORE_IL, check_path: $check_path).click
  end

  def should_see_more_product_h2(key = nil)
    element = find_element(key, il_type: :xpath, tl: MORE_PRODUCTS_TA, il: MORE_PRODUCTS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_learn_more_product(key = nil)
    find_element(key, il_type: :xpath, tl: LEARN_MORE_PRODUCTS_TA, il: LEARN_MORE_PRODUCTS_IL, check_path: $check_path).click
  end

  def should_see_video_ads_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: VIDEO_ADS_H1_TA, il: VIDEO_ADS_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_more_resources(key = nil)
    element = find_element(key, il_type: :xpath, tl: MORE_RESOURCES_TA, il: MORE_RESOURCES_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_faq_link(key = nil)
    find_element(key, il_type: :xpath, tl: FAQ_TA, il: FAQ_IL, check_path: $check_path).click
  end

  def should_see_faq_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: FAQ_H1_TA, il: FAQ_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
