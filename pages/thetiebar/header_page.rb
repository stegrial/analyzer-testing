require 'spec_helper'

class TheTiebarHeader
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  LOGO_IL = "//a[@href='https://www.thetiebar.com/']"
  LOGO_TA = "thetiebar:header:logo"
  LOGO_EP = "EP:thetiebar:header:logo"

  SEARCH_FIELD_IL = "//input[contains(@aria-label, 'Desktop Search')]"
  SEARCH_FIELD_TA = "thetiebar:header:search_field"
  SEARCH_FIELD_EP = "EP:thetiebar:header:search_field"

  CART_BTN_IL = "//button[contains(@aria-label, 'Cart')]"
  CART_BTN_TA = "thetiebar:header:cart_btn"
  CART_BTN_EP = "EP:thetiebar:header:cart_btn"

  SIGNIN_BTN_IL = "//span[contains(text(), 'Sign In')]"
  SIGNIN_BTN_TA = "thetiebar:header:signin_btn"
  SIGNIN_BTN_EP = "EP:thetiebar:header:signin_btn"

  ACCOUNT_BTN_IL = "//span[contains(text(), 'Account')]"
  ACCOUNT_BTN_TA = "thetiebar:header:account_btn"
  ACCOUNT_BTN_EP = "EP:thetiebar:header:account_btn"

  REWARDS_LINK_IL = "//h4[contains(text(), 'Rewards Program!')]"
  REWARDS_LINK_TA = "thetiebar:header:rewards_program"
  REWARDS_LINK_EP = "EP:thetiebar:header:rewards_program"

  SHIRTS_CATEGORY_IL = "//span[contains(text(), 'Shirts')]"
  SHIRTS_CATEGORY_TA = "thetiebar:header:subcategory:Shirts"
  SHIRTS_CATEGORY_EP = "EP:thetiebar:header:subcategory:Shirts"

  PANTS_CATEGORY_IL = "(//span[contains(text(), 'Pants')])[1]"
  PANTS_CATEGORY_TA = "thetiebar:header:subcategory:Pants"
  PANTS_CATEGORY_EP = "EP:thetiebar:header:subcategory:Pants"

  NECKTIES_CATEGORY_IL = "(//span[contains(text(), 'Neckties')])[1]"
  NECKTIES_CATEGORY_TA = "thetiebar:header:subcategory:Neckties"
  NECKTIES_CATEGORY_EP = "EP:thetiebar:header:subcategory:Neckties"

  SKINNYTIES_CATEGORY_IL = "(//span[contains(text(), 'Skinny Ties')])[1]"
  SKINNYTIES_CATEGORY_TA = "thetiebar:header:subcategory:Skinny_ties"
  SKINNYTIES_CATEGORY_EP = "EP:thetiebar:header:subcategory:Skinny_ties"

  BOWTIES_CATEGORY_IL = "(//span[contains(text(), 'Bow Ties')])[1]"
  BOWTIES_CATEGORY_TA = "thetiebar:header:subcategory:Bow_ties"
  BOWTIES_CATEGORY_EP = "EP:thetiebar:header:subcategory:Bow_ties"

  TIEBARS_CATEGORY_IL = "(//span[contains(text(), 'Tie Bars')])[1]"
  TIEBARS_CATEGORY_TA = "thetiebar:header:subcategory:pants"
  TIEBARS_CATEGORY_EP = "EP:thetiebar:header:subcategory:pants"

  SOCKS_CATEGORY_IL = "(//span[contains(text(), 'Socks')])[1]"
  SOCKS_CATEGORY_TA = "thetiebar:header:subcategory:Socks"
  SOCKS_CATEGORY_EP = "EP:thetiebar:header:subcategory:Socks"

  POCKET_SQUARES_CATEGORY_IL = "(//span[contains(text(), 'Pocket Squares')])[1]"
  POCKET_SQUARES_CATEGORY_TA = "thetiebar:header:subcategory:Pocket_Squares"
  POCKET_SQUARES_CATEGORY_EP = "EP:thetiebar:header:subcategory:Pocket_Squares"

  ACCESSORIES_CATEGORY_IL = "(//span[contains(text(), 'Accessories')])[1]"
  ACCESSORIES_CATEGORY_TA = "thetiebar:header:subcategory:Accessories"
  ACCESSORIES_CATEGORY_EP = "EP:thetiebar:header:subcategory:Accessories"

  WEDDING_CATEGORY_IL = "(//span[contains(text(), 'Wedding')])[1]"
  WEDDING_CATEGORY_TA = "thetiebar:header:subcategory:Wedding"
  WEDDING_CATEGORY_EP = "EP:thetiebar:header:subcategory:Wedding"

  GIFTS_CATEGORY_IL = "(//span[contains(text(), 'Gifts')])[1]"
  GIFTS_CATEGORY_TA = "thetiebar:header:subcategory:Gifts"
  GIFTS_CATEGORY_EP = "EP:thetiebar:header:subcategory:Gifts"

  SIGN_OUT_LINK_IL = "//div[contains(text(), 'Sign Out')]"
  SIGN_OUT_LINK_TA = "thetiebar:header:sign_out"
  SIGN_OUT_LINK_EP = "EP:thetiebar:header:sign_out"

  def click_logo(key = nil)
    return find(ta(LOGO_EP)).click if key == :ep
    return find(:xpath, LOGO_IL).click if key == :il
    find(:xpath, ta(LOGO_TA, LOGO_IL)).click
  end

  def click_sing_in_btn(key = nil)
    return find(ta(SIGNIN_BTN_EP)).click if key == :ep
    return find(:xpath, SIGNIN_BTN_IL).click if key == :il
    find(:xpath, ta(SIGNIN_BTN_TA, SIGNIN_BTN_IL)).click
  end

  def click_account_btn(key = nil)
    return find(ta(ACCOUNT_BTN_EP)).click if key == :ep
    return find(:xpath, ACCOUNT_BTN_IL).click if key == :il
    find(:xpath, ta(ACCOUNT_BTN_TA, ACCOUNT_BTN_IL)).click
  end

  def click_sing_out_link(key = nil)
    return find(ta(SIGN_OUT_LINK_EP)).click if key == :ep
    return find(:xpath, SIGN_OUT_LINK_IL).click if key == :il
    find(:xpath, ta(SIGN_OUT_LINK_TA, SIGN_OUT_LINK_IL)).click
  end

  def click_shirts_category(key = nil)
    return find(ta(SHIRTS_CATEGORY_EP)).click if key == :ep
    return find(:xpath, SHIRTS_CATEGORY_IL).click if key == :il
    find(:xpath, ta(SHIRTS_CATEGORY_TA, SHIRTS_CATEGORY_IL)).click
  end

  def click_pants_category(key = nil)
    return find(ta(PANTS_CATEGORY_EP)).click if key == :ep
    return find(:xpath, PANTS_CATEGORY_IL).click if key == :il
    find(:xpath, ta(PANTS_CATEGORY_TA, PANTS_CATEGORY_IL)).click
  end

  def click_neckties_category(key = nil)
    return find(ta(NECKTIES_CATEGORY_EP)).click if key == :ep
    return find(:xpath, NECKTIES_CATEGORY_IL).click if key == :il
    find(:xpath, ta(NECKTIES_CATEGORY_TA, NECKTIES_CATEGORY_IL)).click
  end

  def click_skinnyties_category(key = nil)
    return find(ta(SKINNYTIES_CATEGORY_EP)).click if key == :ep
    return find(:xpath, SKINNYTIES_CATEGORY_IL).click if key == :il
    find(:xpath, ta(SKINNYTIES_CATEGORY_TA, SKINNYTIES_CATEGORY_IL)).click
  end

  def click_bowties_category(key = nil)
    return find(ta(BOWTIES_CATEGORY_EP)).click if key == :ep
    return find(:xpath, BOWTIES_CATEGORY_IL).click if key == :il
    find(:xpath, ta(BOWTIES_CATEGORY_TA, BOWTIES_CATEGORY_IL)).click
  end

  def click_tiebars_category(key = nil)
    return find(ta(TIEBARS_CATEGORY_EP)).click if key == :ep
    return find(:xpath, TIEBARS_CATEGORY_IL).click if key == :il
    find(:xpath, ta(TIEBARS_CATEGORY_TA, TIEBARS_CATEGORY_IL)).click
  end

  def click_socks_category(key = nil)
    return find(ta(SOCKS_CATEGORY_EP)).click if key == :ep
    return find(:xpath, SOCKS_CATEGORY_IL).click if key == :il
    find(:xpath, ta(SOCKS_CATEGORY_TA, SOCKS_CATEGORY_IL)).click
  end

  def click_pocket_squares_category(key = nil)
    return find(ta(POCKET_SQUARES_CATEGORY_EP)).click if key == :ep
    return find(:xpath, POCKET_SQUARES_CATEGORY_IL).click if key == :il
    find(:xpath, ta(POCKET_SQUARES_CATEGORY_TA, POCKET_SQUARES_CATEGORY_IL)).click
  end

  def click_accessories_category(key = nil)
    return find(ta(ACCESSORIES_CATEGORY_EP)).click if key == :ep
    return find(:xpath, ACCESSORIES_CATEGORY_IL).click if key == :il
    find(:xpath, ta(ACCESSORIES_CATEGORY_TA, ACCESSORIES_CATEGORY_IL)).click
  end

  def click_wedding_category(key = nil)
    return find(ta(WEDDING_CATEGORY_EP)).click if key == :ep
    return find(:xpath, WEDDING_CATEGORY_IL).click if key == :il
    find(:xpath, ta(WEDDING_CATEGORY_TA, WEDDING_CATEGORY_IL)).click
  end

  def click_gifts_category(key = nil)
    return find(ta(GIFTS_CATEGORY_EP)).click if key == :ep
    return find(:xpath, GIFTS_CATEGORY_IL).click if key == :il
    find(:xpath, ta(GIFTS_CATEGORY_TA, GIFTS_CATEGORY_IL)).click
  end

  def fill_search_input(key = nil, value)
    return find(ta(SEARCH_FIELD_EP)).set(value) if key == :ep
    return find(:xpath, SEARCH_FIELD_IL).set(value) if key == :il
    find(:xpath, ta(SEARCH_FIELD_TA, SEARCH_FIELD_IL)).set(value)
  end

  def click_enter_search_result(key = nil)
    return find(ta(SEARCH_FIELD_EP)).native.send_keys(:enter) if key == :ep
    return find(:xpath, SEARCH_FIELD_IL).native.send_keys(:enter) if key == :il
    find(:xpath, ta(SEARCH_FIELD_TA, SEARCH_FIELD_IL)).native.send_keys(:enter)
  end


end