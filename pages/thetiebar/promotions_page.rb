require 'spec_helper'
require_relative '../page_extension'

class TheTiebarPromoPage

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension


  SHOP_NEW_ARRIVALS_BTN_IL = "//a[@id='promo-btn']"
  SHOP_NEW_ARRIVALS_BTN_TA = "thetiebar:promo_page:shop_new_arrivals_btn"
  SHOP_NEW_ARRIVALS_BTN_EP = "EP:thetiebar:promo_page:shop_new_arrivals_btn"

  WHATS_NEW_H1_IL = "//h1[contains(text(),'Ties, Socks, Pocket Squares & More')]"
  WHATS_NEW_H1_TA = "thetiebar:whats_new_page:whats_new"
  WHATS_NEW_H1_EP = "EP:thetiebar:whats_new_page:whats_new"


  def should_see_whats_new_h1(key = nil)
    post_processing key do
      return assert_selector(ta(WHATS_NEW_H1_EP)) if key == :ep
      return assert_selector(:xpath, WHATS_NEW_H1_IL) if key == :il
      assert_selector(:xpath, ta(WHATS_NEW_H1_TA, WHATS_NEW_H1_IL))
    end
  end

  def click_new_arrivals_btn(key = nil)
    post_processing key do
      return find(ta(SHOP_NEW_ARRIVALS_BTN_EP)).click if key == :ep
      return find(:xpath, SHOP_NEW_ARRIVALS_BTN_IL).click if key == :il
      find(:xpath, ta(SHOP_NEW_ARRIVALS_BTN_TA, SHOP_NEW_ARRIVALS_BTN_IL)).click
    end
  end

end