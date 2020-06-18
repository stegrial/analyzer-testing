require_relative '../page_extension'

class PressPageFlipkart < PageExtension


  NEWS_H1_IL = "//h1[text()='News']"
  NEWS_H1_TA = "flipkart:press_page:news_h1"

  FEATURED_H2_IL = "//h2[text()='FEATURED']"
  FEATURED_H2_TA = "flipkart:press_page:featured"

  YOU_ALSO_LIKE_H2_IL = "//h2[text()='You May Also Like']"
  YOU_ALSO_LIKE_H2_TA = "flipkart:press_page:you_also_like_h2"

  SHOP_WITH_UPTO_IL = "//div[@class='cactus-widget-posts-content']//a[contains(text(),'Shop with upto')]"
  SHOP_WITH_UPTO_TA = "flipkart:press_page:shop_with_upto"

  SHOP_WITH_UPTO_H1_IL = "//h1[contains(text(),'Shop with upto')]"
  SHOP_WITH_UPTO_H1_TA = "flipkart:press_page:shop_with_upto_h1"

  STUDIO34_PODCASTS_LIST_IL = "//h2[contains(text(),'STUDIO34 PODCASTS')]"
  STUDIO34_PODCASTS_LIST_TA = "flipkart:press_page:studio34_podcasts_list"

  OLDER_POST_IL = "//div[contains(@class,'nav-previous')]"
  OLDER_POST_TA = "flipkart:press_page:older_post"

  NEWER_POST_IL = "//div[contains(@class,'nav-next')]"
  NEWER_POST_TA = "flipkart:press_page:newer_post"

  INSTAGRAM_FEED_IL = "//h2[contains(text(),'INSTAGRAM FEED')]"
  INSTAGRAM_FEED_TA = "flipkart:press_page:instagram_feed"

  IFRAME_TWITTER_IL = "#twitter-widget-0"
  IFRAME_TWITTER_TA = "flipkart:press_page:iframe_twitter"

  TWEETAUTHOR_IL= "//a[@class='TweetAuthor-link Identity u-linkBlend']"
  TWEETAUTHOR_TA= "flipkart:press_page:TweetAuthor"

  DISCOVER_BTN_IL = "//a[text()='DISCOVER']"
  DISCOVER_BTN_TA = "flipkart:press_page:discover_btn"

  EXPLORE_DIGITAL_H1_IL= "//h1[text()='Explore Digital India with Flipkart Stories']"
  EXPLORE_DIGITAL_H1_TA= "flipkart:press_page:explore_digital_h1"

  SUBSCRIBE_EMAIL_IL = "//input[@name='subscribe-email']"
  SUBSCRIBE_EMAIL_TA = "flipkart:press_page:subscribe_email"


  def should_see_news_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: NEWS_H1_TA, il: NEWS_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_featured_h2(key = nil)
    element = find_element(key, il_type: :xpath, tl: FEATURED_H2_TA, il: FEATURED_H2_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_shop_with_upto(key = nil)
    find_element(key, il_type: :xpath, tl: SHOP_WITH_UPTO_TA, il: SHOP_WITH_UPTO_IL, check_path: $check_path).click
  end

  def should_see_shop_with_upto_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: SHOP_WITH_UPTO_H1_TA, il: SHOP_WITH_UPTO_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_podcasts_list(key = nil)
    element = find_element(key, il_type: :xpath, tl: STUDIO34_PODCASTS_LIST_TA, il: STUDIO34_PODCASTS_LIST_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_older_post_btn(key = nil)
    find_element(key, il_type: :xpath, tl: OLDER_POST_TA, il: OLDER_POST_IL, check_path: $check_path).click
  end

  def click_on_newer_post_btn(key = nil)
    find_element(key, il_type: :xpath, tl: NEWER_POST_TA, il: NEWER_POST_IL, check_path: $check_path).click
  end

  def should_see_instagram_feed(key = nil)
    element = find_element(key, il_type: :xpath, tl: INSTAGRAM_FEED_TA, il: INSTAGRAM_FEED_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_tweetauthor_in_frame(key = nil)
    within_frame( find_element(key, il_type: :css, tl: IFRAME_TWITTER_TA, il: IFRAME_TWITTER_IL, check_path: $check_path)) do
      find_element(key, il_type: :xpath, tl: TWEETAUTHOR_TA, il: TWEETAUTHOR_IL, check_path: $check_path).click
    end
  end

  def click_on_discover_btn(key = nil)
    find_element(key, il_type: :xpath, tl: DISCOVER_BTN_TA, il: DISCOVER_BTN_IL, check_path: $check_path).click
  end

  def should_see_explore_digital_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXPLORE_DIGITAL_H1_TA, il: EXPLORE_DIGITAL_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_subscribe_email(key = nil, value)
    find_element(key, il_type: :xpath, tl: SUBSCRIBE_EMAIL_TA, il: SUBSCRIBE_EMAIL_IL, check_path: $check_path).set(value)
  end

end