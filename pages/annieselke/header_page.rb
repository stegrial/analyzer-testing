require 'spec_helper'
require_relative '../page_extension'

class HeaderPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  SEARCH_FIELD_IL = "//input[@id='search']"
  SEARCH_FIELD_TA = "annieselke:header_page:search_input"

  LOGIN_LINK_IL = "//a[@href='/login']"
  LOGIN_LINK_TA = "annieselke:header_page:login_link"

  CART_LINK_IL = "//a[@href='https://annieselke.com/cart']"
  CART_LINK_TA = "annieselke:header_page:cart_link"

  VIEW_CART_IL = "//div[@class='mini-cart-links']//a[@class='button primary']"
  VIEW_CART_TA = "annieselke:header_page:view_cart_btn"

  RUGS_LINK_IL = "//a[contains(@class, 'Rugs')]"
  RUGS_LINK_TA = "annieselke:header_page:rugs_link"

  BEDDING_LINK_IL = "//a[contains(@class, 'Bedding')]"
  BEDDING_LINK_TA = "annieselke:header_page:bedding_link"

  FURNITURE_LINK_IL = "//a[contains(@class, 'Furniture')]"
  FURNITURE_LINK_TA = "annieselke:header_page:furniture_link"

  DECOR_PILLOWS_LINK_IL = "//a[contains(@class, 'Décor & Pillows')]"
  DECOR_PILLOWS_LINK_TA = "annieselke:header_page:decor_pillows_link"

  BATH_LINK_IL = "//a[contains(@class, 'Bath')]"
  BATH_LINK_TA = "annieselke:header_page:bath_link"

  WINDOW_LINK_IL = "//a[contains(@class, 'Window')]"
  WINDOW_LINK_TA = "annieselke:header_page:window_link"

  APPAREL_LINK_IL = "//a[contains(@class, 'Apparel')]"
  APPAREL_LINK_TA = "annieselke:header_page:apparel_link"

  PET_LINK_IL = "//a[contains(@class, 'Pet')]"
  PET_LINK_TA = "annieselke:header_page:pet_link"

  COLLECTIONS_LINK_IL = "//a[contains(@class, 'Collections')]"
  COLLECTIONS_LINK_TA = "annieselke:header_page:collections_link"

  GIFTS_LINK_IL = "//a[contains(@class, 'Gifts')]"
  GIFTS_LINK_TA = "annieselke:header_page:gifts_link"

  SALE_LINK_IL = "//a[contains(@class, 'The Outlet')]"
  SALE_LINK_TA = "annieselke:header_page:sale_link"

  PINE_CONE_HILL_LINK_IL = "//a[contains(@class, 'pineconehill')]"
  PINE_CONE_HILL_LINK_TA = "annieselke:header_page:pine_cone_hill_link"

  DASH_AN_ALBERT_LINK_IL = "(//a[contains(@class, 'dashandalbert')])[1]"
  DASH_AN_ALBERT_LINK_TA = "annieselke:header_page:dash_an_albert_link"

  THE_OUTLET_LINK_IL = "(//a[contains(@class, 'outlet')])[1]"
  THE_OUTLET_LINK_TA = "annieselke:header_page:the_outlet_link"

  IDEAS_INSPIRATION_LINK_IL = "//a[contains(@href, 'ideas-inspiration')]"
  IDEAS_INSPIRATION_LINK_TA = "annieselke:header_page:ideas_inspiration_link"

  ANNIE_SELKE_LINK_IL = "//a[@title='Annie Selke']"
  ANNIE_SELKE_LINK_TA = "annieselke:header_page:annie_selke_link"


  def fill_search_input(key = nil, value)
    find_element_path(key, :xpath, SEARCH_FIELD_TA, SEARCH_FIELD_IL).set(value)
  end

  def click_login_link(key = nil)
    find_element_path(key, :xpath, LOGIN_LINK_TA, LOGIN_LINK_IL).click
  end

  def move_to_cart_link(key = nil)
    find_element_path(key, :xpath, CART_LINK_TA, CART_LINK_IL).hover
  end

  def click_cart_link(key = nil)
    find_element_path(key, :xpath, CART_LINK_TA, CART_LINK_IL).click
  end

  def click_view_cart_btn(key = nil)
    find_element_path(key, :xpath, VIEW_CART_TA, VIEW_CART_IL).click
    page.go_back
  end

  def click_rugs_link(key = nil)
    find_element_path(key, :xpath, RUGS_LINK_TA, RUGS_LINK_IL).click
  end

  def click_bedding_link(key = nil)
    find_element_path(key, :xpath, BEDDING_LINK_TA, BEDDING_LINK_IL).click
  end

  def click_furniture_link(key = nil)
    find_element_path(key, :xpath, FURNITURE_LINK_TA, FURNITURE_LINK_IL).click
  end

  def click_decor_pillows_link(key = nil)
    find_element_path(key, :xpath, DECOR_PILLOWS_LINK_TA, DECOR_PILLOWS_LINK_IL).click
  end

  def click_bath_link(key = nil)
    find_element_path(key, :xpath, BATH_LINK_TA, BATH_LINK_IL).click
  end

  def click_window_link(key = nil)
    find_element_path(key, :xpath, WINDOW_LINK_TA, WINDOW_LINK_IL).click
  end

  def click_apparel_link(key = nil)
    find_element_path(key, :xpath, APPAREL_LINK_TA, APPAREL_LINK_IL).click
  end

  def click_pet_link(key = nil)
    find_element_path(key, :xpath, PET_LINK_TA, PET_LINK_IL).click
  end

  def click_collections_link(key = nil)
    find_element_path(key, :xpath, COLLECTIONS_LINK_TA, COLLECTIONS_LINK_IL).click
  end

  def click_gifts_link(key = nil)
    find_element_path(key, :xpath, GIFTS_LINK_TA, GIFTS_LINK_IL).click
  end

  def click_sale_link(key = nil)
    find_element_path(key, :xpath, SALE_LINK_TA, SALE_LINK_IL).click
  end

  def click_pine_cone_hill_link(key = nil)
    find_element_path(key, :xpath, PINE_CONE_HILL_LINK_TA, PINE_CONE_HILL_LINK_IL).click
  end

  def click_dash_an_albert_link(key = nil)
    find_element_path(key, :xpath, DASH_AN_ALBERT_LINK_TA, DASH_AN_ALBERT_LINK_IL).click
  end

  def click_the_outlet_link(key = nil)
    find_element_path(key, :xpath, THE_OUTLET_LINK_TA, THE_OUTLET_LINK_IL).click
  end

  def click_ideals_inspiration_link(key = nil)
    find_element_path(key, :xpath, IDEAS_INSPIRATION_LINK_TA, IDEAS_INSPIRATION_LINK_IL).click
  end

  def click_annie_selke_link(key = nil)
    find_element_path(key, :xpath, ANNIE_SELKE_LINK_TA, ANNIE_SELKE_LINK_IL).click
  end

end