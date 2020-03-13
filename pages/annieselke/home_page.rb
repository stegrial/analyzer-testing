require 'spec_helper'
require_relative '../page_extension'

class Home_Page
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  CLOSE_BANNER_BTN = "//button[@title='Close Dialog']"
  CLOSE_CUPON_BANNER_BTN = "//button[@class='offer-control close']"

  SEARCH_FIELD_IL = "//input[@id='search']"
  SEARCH_FIELD_TA = "annieselke:home_page:search_input"

  LOGIN_LINK_IL = "//a[@href='/login']"
  LOGIN_LINK_TA = "annieselke:home_page:login_link"

  BLOG_LINK_IL = "//a[@href='https://blog.annieselke.com/']"
  BLOG_LINK_TA  = "annieselke:home_page:blog_link"

  EMAIL_SUBSCRIPTION_IL = "//input[@id='newsletter.email']"
  EMAIL_SUBSCRIPTION_TA = "annieselke:home_page:email_subscription"

  EMAIL_SUBSCRIPTION_BTN_IL = "//input[@id='newsletter-submit']"
  EMAIL_SUBSCRIPTION_BTN_TA = "annieselke:home_page:email_subscription_btn"

  CART_LINK_IL = "//a[@href='https://annieselke.com/cart']"
  CART_LINK_TA = "annieselke:home_page:cart_link"

  VIEW_CART_IL = "//div[@class='mini-cart-links']//a[@class='button primary']"
  VIEW_CART_TA = "annieselke:home_page:view_cart_btn"

  SOCIAL_NETWORKS_IL = {facebook: "//a[@href = 'https://www.facebook.com/annieselke/']",
                        twitter: "//a[@href = 'https://twitter.com/annieselkeco/']", pinterest: "//a[@href = 'https://www.pinterest.com/AnnieSelke/']",
                        youtube: "//a[@href = 'http://www.youtube.com/annieselkecompanies']", instagram: "//a[@href = 'https://www.instagram.com/annieselke/']"}

  SOCIAL_NETWORKS_TA = {facebook: "annieselke:home_page:social_networks:facebook",
                        twitter: "annieselke:home_page:social_networks:twitter", pinterest: "annieselke:home_page:social_networks:pinterest",
                        youtube: "annieselke:home_page:social_networks:youtube", instagram: "annieselke:home_page:social_networks:instagram"}

  COMPANIES_IL = {annieselke: "", pinecoinhill: "", dashandalbert: "", outlet: "", ideasandInspirations: ""}
  PRODUCT_GROUPS = {bugs: "", bedding: "", furniture: "", decorandpillows: "", bath: "", windows: "", apparel: "", pet: "", collections: "",
                    gifts: "", sale: ""}

  def close_banner
    within_frame(1) do
      find(:xpath, CLOSE_BANNER_BTN).click
    end
  rescue
    puts 'Banner doesnt exist'
  end

  def close_cupon_banner
    within_frame(1) do
      find(:xpath, CLOSE_CUPON_BANNER_BTN).click
    end
  rescue
    puts 'Banner doesnt exist'
  end

  def fill_search_input(key = nil, value)
    find_element_path(key, :xpath, SEARCH_FIELD_TA, SEARCH_FIELD_IL).set(value)
  end

  def click_blog_link(key = nil)
    find_element_path(key, :xpath, BLOG_LINK_TA, BLOG_LINK_IL).click
    page.go_back
  end

  def click_login_link(key = nil)
    find_element_path(key, :xpath, LOGIN_LINK_TA, LOGIN_LINK_IL).click
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

  def move_to_cart_link(key = nil)
    find_element_path(key, :xpath, CART_LINK_TA, CART_LINK_IL).hover
  end

  def click_view_cart_btn(key = nil)
    find_element_path(key, :xpath, VIEW_CART_TA, VIEW_CART_IL).click
    page.go_back
  end

  def click_cart_link(key = nil)
    find_element_path(key, :xpath, CART_LINK_TA, CART_LINK_IL).click
  end
end
