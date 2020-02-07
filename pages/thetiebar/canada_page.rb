require 'spec_helper'

class TheTiebarCanada

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers


  SHOP_WEDDING_LINK_IL = "//a[@href='/wedding-ties']"
  SHOP_WEDDING_LINK_TA = "thetiebar:canada_page:wedding_shop"
  SHOP_WEDDING_LINK_EP = "EP:thetiebar:canada_page:wedding_shop"

  SHIRTS_SHOP_LINK_IL = "//a[@href='/shirts']"
  SHIRTS_SHOP_LINK_TA = "thetiebar:canada_page:shirts_shop"
  SHIRTS_SHOP_LINK_EP = "EP:thetiebar:canada_page:shirts_shop"

  THE_TIABAR_CANADA_H1_IL = "//h1[contains(text(),'The Tie Bar Canada')]"
  THE_TIABAR_CANADA_H1_TA = "thetiebar:canada_page:canada_h1"
  THE_TIABAR_CANADA_H1_EP = "EP:thetiebar:canada_page:canada_h1"


  def should_see_canada_h1(key = nil)
    return assert_selector(ta(THE_TIABAR_CANADA_H1_EP)) if key == :ep
    return assert_selector(:xpath, THE_TIABAR_CANADA_H1_IL) if key == :il
    assert_selector(:xpath, ta(THE_TIABAR_CANADA_H1_TA, THE_TIABAR_CANADA_H1_IL))
  end

  def click_wedding_shop(key = nil)
    return find(ta(SHOP_WEDDING_LINK_EP)).click if key == :ep
    return find(:xpath, SHOP_WEDDING_LINK_IL).click if key == :il
    find(:xpath, ta(SHOP_WEDDING_LINK_TA, SHOP_WEDDING_LINK_IL)).click
  end

  def click_shirts_shop(key = nil)
    return find(ta(SHIRTS_SHOP_LINK_EP)).click if key == :ep
    return find(:xpath, SHIRTS_SHOP_LINK_IL).click if key == :il
    find(:xpath, ta(SHIRTS_SHOP_LINK_TA, SHIRTS_SHOP_LINK_IL)).click
  end

end