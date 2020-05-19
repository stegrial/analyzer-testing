require 'spec_helper'
require_relative '../page_extension'

class FooterPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

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
    find_element_path(key, :xpath, BLOG_LINK_TA, BLOG_LINK_IL).click
    page.go_back
  end

  def click_on_facebook_icon(key = nil)
    find_element_path(key, :xpath, SOCIAL_NETWORKS_TA[:facebook], SOCIAL_NETWORKS_IL[:facebook]).click
  end

  def click_on_twitter_icon(key = nil)
    find_element_path(key, :xpath, SOCIAL_NETWORKS_TA[:twitter], SOCIAL_NETWORKS_IL[:twitter]).click
  end

  def click_on_pinterest_icon(key = nil)
    find_element_path(key, :xpath, SOCIAL_NETWORKS_TA[:pinterest], SOCIAL_NETWORKS_IL[:pinterest]).click
  end

  def click_on_youtube_icon(key = nil)
    find_element_path(key, :xpath, SOCIAL_NETWORKS_TA[:youtube], SOCIAL_NETWORKS_IL[:youtube]).click
  end

  def click_on_instagram_icon(key = nil)
    find_element_path(key, :xpath, SOCIAL_NETWORKS_TA[:instagram], SOCIAL_NETWORKS_IL[:instagram]).click
  end

  def fill_email_subscription_name(key = nil, value)
    find_element_path(key, :xpath, EMAIL_SUBSCRIPTION_TA, EMAIL_SUBSCRIPTION_IL).set(value)
  end

  def click_email_subscription_btn(key = nil)
    find_element_path(key, :xpath, EMAIL_SUBSCRIPTION_BTN_TA, EMAIL_SUBSCRIPTION_BTN_IL).click
  end

  def click_companies(key = nil, name)
    find_element_path(key, :xpath, search_categories(:ta, name), search_categories(:il, name)).click
  end

  def click_see_details_link(key = nil)
    find_element_path(key, :xpath, SEE_DETAILS_LINK_TA, SEE_DETAILS_LINK_IL).click
  end

  def should_see_annie_selke_img(key = nil)
    post_processing key do
      return assert_selector(:xpath, ANNIE_SELKE_IMG_IL) if key == :il
      assert_selector(:xpath, ta(ANNIE_SELKE_IMG_TA, ANNIE_SELKE_IMG_IL))
    end
  end

end
