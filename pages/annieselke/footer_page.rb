require_relative '../page_extension'

class FooterPage < PageExtension

  BLOG_LINK_IL = "(//a[@href='https://blog.annieselke.com/'])[3]"
  BLOG_LINK_TA = "annieselke:footer_page:blog_link"

  EMAIL_SUBSCRIPTION_IL = "//input[@id='newsletter.email']"
  EMAIL_SUBSCRIPTION_TA = "annieselke:footer_page:email_subscription"

  EMAIL_SUBSCRIPTION_BTN_IL = "//input[@id='newsletter-submit']"
  EMAIL_SUBSCRIPTION_BTN_TA = "annieselke:footer_page:email_subscription_btn"

  SOCIAL_NETWORKS_IL = {facebook: "//div[@class='social']/a[@class='facebook']",
                        twitter: "//a[@href = 'https://twitter.com/annieselkeco/']", pinterest: "//a[@href = 'https://www.pinterest.com/AnnieSelke/']",
                        youtube: "//a[@href = 'http://www.youtube.com/annieselkecompanies']", instagram: "//a[@href = 'https://www.instagram.com/annieselke/']"}

  SOCIAL_NETWORKS_TA = {facebook: "annieselke:footer_page:social_networks:facebook",
                        twitter: "annieselke:footer_page:social_networks:twitter", pinterest: "annieselke:footer_page:social_networks:pinterest",
                        youtube: "annieselke:footer_page:social_networks:youtube", instagram: "annieselke:footer_page:social_networks:instagram"}

  SEE_DETAILS_LINK_IL = "//a[text()=' SEE DETAILS ▸']"
  SEE_DETAILS_LINK_TA = "annieselke:home_page:see_details_link"


  def search_categories(key, name)
    locator_by key,
               "//a[@title='#{name}']",
               "annieselke:footer_page:categories:#{ta_name(name)}"
  end


  def click_blog_link(key = nil)
    find_element(key, il_type: :xpath, tl: BLOG_LINK_TA, il: BLOG_LINK_IL, check_path: $check_path).click
    page.go_back
  end

  def click_on_facebook_icon(key = nil)
    find_element(key, il_type: :xpath, tl: SOCIAL_NETWORKS_TA[:facebook], il: SOCIAL_NETWORKS_IL[:facebook], check_path: $check_path).click
  end

  def click_on_twitter_icon(key = nil)
    find_element(key, il_type: :xpath, tl: SOCIAL_NETWORKS_TA[:twitter], il: SOCIAL_NETWORKS_IL[:twitter], check_path: $check_path).click
  end

  def click_on_pinterest_icon(key = nil)
    find_element(key, il_type: :xpath, tl: SOCIAL_NETWORKS_TA[:pinterest], il: SOCIAL_NETWORKS_IL[:pinterest], check_path: $check_path).click
  end

  def click_on_youtube_icon(key = nil)
    find_element(key, il_type: :xpath, tl: SOCIAL_NETWORKS_TA[:youtube], il: SOCIAL_NETWORKS_IL[:youtube], check_path: $check_path).click
  end

  def click_on_instagram_icon(key = nil)
    find_element(key, il_type: :xpath, tl: SOCIAL_NETWORKS_TA[:instagram], il: SOCIAL_NETWORKS_IL[:instagram], check_path: $check_path).click
  end

  def fill_email_subscription_name(key = nil, value)
    find_element(key, il_type: :xpath, tl: EMAIL_SUBSCRIPTION_TA, il: EMAIL_SUBSCRIPTION_IL, check_path: $check_path).set(value)
  end

  def click_email_subscription_btn(key = nil)
    find_element(key, il_type: :xpath, tl: EMAIL_SUBSCRIPTION_BTN_TA, il: EMAIL_SUBSCRIPTION_BTN_IL, check_path: $check_path).click
  end

  def click_companies(key = nil, name)
    find_element(key, il_type: :xpath, tl: search_categories(:ta, name), il: search_categories(:il, name), check_path: $check_path).click
  end

  def click_see_details_link(key = nil)
    find_element(key, il_type: :xpath, tl: SEE_DETAILS_LINK_TA, il: SEE_DETAILS_LINK_IL, check_path: $check_path).click
  end

  def should_see_annie_selke_img(key = nil)
    element = find_element(key, il_type: :xpath, tl: ANNIE_SELKE_IMG_TA, il: ANNIE_SELKE_IMG_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
