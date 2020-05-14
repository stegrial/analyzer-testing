require 'spec_helper'
require_relative '../page_extension'

class ProductPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  TIA_MIRROR_LINK_IL = "//a[contains(@title, 'Tia Mirror')]"
  TIA_MIRROR_LINK_TA = "annieselke:product_page:tia_mirror"

  DROPDOWN_ARROW_IL = "//select[@id='variant']"
  DROPDOWN_ARROW_TA = "annieselke:product_page:size_dropdown_arrow"

  GALLERY_IMG_IL = "(//div[@class='gallery-images']//img)[2]"
  GALLERY_IMG_TA = "annieselke:product_page:gallery_img"


  def search_item(key, name)
    locator_by key,
               "//select[@id='variant']/option[@value='#{name}']",
               "annieselke:product_page:#{ta_name(name)}"
  end


  SOCIAL_NETWORKS_IL = {facebook: "//a[@id='share_facebook']",
                        twitter: "//a[@href = '//a[@id='share_twitter']",
                        pinterest: "//a[@id='share_pinterest']",
                        houzz: "//a[@id='share_houzz']"}

  SOCIAL_NETWORKS_TA = {facebook: "annieselke:product_page:social_networks:facebook",
                        twitter: "annieselke:product_page:social_networks:twitter",
                        pinterest: "annieselke:product_page:social_networks:pinterest",
                        houzz: "annieselke:product_page:social_networks:houzz"}




  def click_tia_mirror_link(key = nil)
    find_element_path(key, :xpath, TIA_MIRROR_LINK_TA, TIA_MIRROR_LINK_IL).click
  end

  def click_dropdown_arrow (key=nil)
    find_element_path(key, :xpath, DROPDOWN_ARROW_TA, DROPDOWN_ARROW_IL).click
  end

  def select_dropdown(key=nil, name)
    find_element_path(key, :xpath, search_item(:ta, name), search_item(:il, name)).click
  end


  def click_to_change_gallery_img (key=nil)
    find_element_path(key, :xpath, GALLERY_IMG_TA, GALLERY_IMG_IL).click
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

  def click_on_houzz_icon(key = nil)
    find_element_path(key, :xpath, SOCIAL_NETWORKS_TA[:houzz], SOCIAL_NETWORKS_IL[:houzz]).click
  end

end
