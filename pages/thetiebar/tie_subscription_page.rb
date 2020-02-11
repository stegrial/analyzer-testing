require 'spec_helper'

class TheTiebarSubscriptionPage

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage


  SKINNY_TIES_25_IL = "//input[@id='SCTIE2512']"
  SKINNY_TIES_25_TA = "thetiebar:custom_page:skinny_ties_25"
  SKINNY_TIES_25_EP = "EP:thetiebar:custom_page:skinny_ties_25"

  NECK_TIES_325_IL = "//input[@id='SCTIE32506']"
  NECK_TIES_325_TA = "thetiebar:custom_page:neck_ties_325"
  NECK_TIES_325_EP = "EP:thetiebar:custom_page:neck_ties_325"

  BOW_TIES_12_IL = "//input[@id='SCBWTST12']"
  BOW_TIES_12_TA = "thetiebar:custom_page:bow_ties_12"
  BOW_TIES_12_EP = "EP:thetiebar:custom_page:bow_ties_12"

  PAIRS_SOCKS_12_IL = "//input[@id='SCSCK12']"
  PAIRS_SOCKS_12_TA = "thetiebar:custom_page:pairs_socks_12"
  PAIRS_SOCKS_12_EP = "EP:thetiebar:custom_page:pairs_socks_12"

  ADD_TO_CART1_IL = "(//button[@name='add'])[1]"
  ADD_TO_CART1_TA = "thetiebar:custom_page:add1"
  ADD_TO_CART1_EP = "EP:thetiebar:custom_page:add1"

  ADD_TO_CART2_IL = "(//button[@name='add'])[2]"
  ADD_TO_CART2_TA = "thetiebar:custom_page:add2"
  ADD_TO_CART2_EP = "EP:thetiebar:custom_page:add2"

  ADD_TO_CART3_IL = "(//button[@name='add'])[3]"
  ADD_TO_CART3_TA = "thetiebar:custom_page:add3"
  ADD_TO_CART3_EP = "EP:thetiebar:custom_page:add3"

  ADD_TO_CART4_IL = "(//button[@name='add'])[4]"
  ADD_TO_CART4_TA = "thetiebar:custom_page:add4"
  ADD_TO_CART4_EP = "EP:thetiebar:custom_page:add4"

  CLICK_FREE_PLACE_IL = "//div[contains(@class,'mw-header397')]"
  CLICK_FREE_PLACE_TA = "thetiebar:custom_page:free_place"
  CLICK_FREE_PLACE_EP = "EP:thetiebar:custom_page:free_place"

  def click_skinny_ties_25(key = nil)
    post_processing key do
      return find(ta(SKINNY_TIES_25_EP)).click if key == :ep
      return find(:xpath, SKINNY_TIES_25_IL).click if key == :il
      find(:xpath, ta(SKINNY_TIES_25_TA, SKINNY_TIES_25_IL)).click
    end
  end

  def click_neck_ties_325(key = nil)
    post_processing key do
      return find(ta(NECK_TIES_325_EP)).click if key == :ep
      return find(:xpath, NECK_TIES_325_IL).click if key == :il
      find(:xpath, ta(NECK_TIES_325_TA, NECK_TIES_325_IL)).click
    end
  end

  def click_bow_ties_12(key = nil)
    post_processing key do
      return find(ta(BOW_TIES_12_EP)).click if key == :ep
      return find(:xpath, BOW_TIES_12_IL).click if key == :il
      find(:xpath, ta(BOW_TIES_12_TA, BOW_TIES_12_IL)).click
    end
  end

  def click_pairs_socks_12(key = nil)
    post_processing key do
      return find(ta(PAIRS_SOCKS_12_EP)).click if key == :ep
      return find(:xpath, PAIRS_SOCKS_12_IL).click if key == :il
      find(:xpath, ta(PAIRS_SOCKS_12_TA, PAIRS_SOCKS_12_IL)).click
    end
  end

  def click_add_1(key = nil)
    post_processing key do
      return find(ta(ADD_TO_CART1_EP)).click if key == :ep
      return find(:xpath, ADD_TO_CART1_IL).click if key == :il
      find(:xpath, ta(ADD_TO_CART1_TA, ADD_TO_CART1_IL)).click
    end
  end

  def click_add_2(key = nil)
    post_processing key do
      return find(ta(ADD_TO_CART2_EP)).click if key == :ep
      return find(:xpath, ADD_TO_CART2_IL).click if key == :il
      find(:xpath, ta(ADD_TO_CART2_TA, ADD_TO_CART2_IL)).click
    end
  end

  def click_add_3(key = nil)
    post_processing key do
      return find(ta(ADD_TO_CART3_EP)).click if key == :ep
      return find(:xpath, ADD_TO_CART3_IL).click if key == :il
      find(:xpath, ta(ADD_TO_CART3_TA, ADD_TO_CART3_IL)).click
    end
  end

  def click_add_4(key = nil)
    post_processing key do
      return find(ta(ADD_TO_CART4_EP)).click if key == :ep
      return find(:xpath, ADD_TO_CART4_IL).click if key == :il
      find(:xpath, ta(ADD_TO_CART4_TA, ADD_TO_CART4_IL)).click
    end
  end

  def click_free_place(key = nil)
    post_processing key do
      return find(ta(CLICK_FREE_PLACE_EP)).click if key == :ep
      return find(:xpath, CLICK_FREE_PLACE_IL).click if key == :il
      find(:xpath, ta(CLICK_FREE_PLACE_TA, CLICK_FREE_PLACE_IL)).click
    end
  end

end