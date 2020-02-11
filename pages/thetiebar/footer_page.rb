require 'spec_helper'
require_relative '../../helpers/special_methods'


class TheTiebarFooterPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage


  CONTACT_IL = "(//span[text()='Contact'])[2]"
  CONTACT_TA = "thetiebar:footer_page:need_help_section:contact"
  CONTACT_EP = "EP:thetiebar:footer_page:need_help_section:contact"

  SHIPPING_IL = "(//span[text()='Shipping'])[2]"
  SHIPPING_TA = "thetiebar:footer_page:need_help_section:shipping"
  SHIPPING_EP = "EP:thetiebar:footer_page:need_help_section:shipping"

  RETURNS_IL = "(//span[text()='Returns'])[2]"
  RETURNS_TA = "thetiebar:footer_page:need_help_section:returns"
  RETURNS_EP = "EP:thetiebar:footer_page:need_help_section:returns"

  TRACK_MY_ORDER_IL = "(//span[text()='Track My Order'])[2]"
  TRACK_MY_ORDER_TA = "thetiebar:footer_page:need_help_section:track_my_order"
  TRACK_MY_ORDER_EP = "EP:thetiebar:footer_page:need_help_section:track_my_order"

  ABOUT_US_IL = "(//span[text()='About Us'])[2]"
  ABOUT_US_TA = "thetiebar:footer_page:need_help_section:about_us"
  ABOUT_US_EP = "EP:thetiebar:footer_page:need_help_section:about_us"

  ABOUT_OUR_STORES_IL = "(//span[text()='About Our Stores'])[2]"
  ABOUT_OUR_STORES_TA = "thetiebar:footer_page:need_help_section:about_our_stores"
  ABOUT_OUR_STORES_EP = "EP:thetiebar:footer_page:need_help_section:about_our_stores"

  FAQ_IL = "(//span[text()='FAQ'])[2]"
  FAQ_TA = "thetiebar:footer_page:need_help_section:faq"
  FAQ_EP = "EP:thetiebar:footer_page:need_help_section:faq"

  CAREERS_IL = "(//span[text()='Careers'])[2]"
  CAREERS_TA = "thetiebar:footer_page:need_help_section:Careers"
  CAREERS_EP = "EP:thetiebar:footer_page:need_help_section:Careers"

  CANADA_IL = "(//span[text()='Canada'])[2]"
  CANADA_TA = "thetiebar:footer_page:need_help_section:Careers"
  CANADA_EP = "EP:thetiebar:footer_page:need_help_section:Careers"

  PROMOTIONS_IL = "(//span[text()='Promotions'])[2]"
  PROMOTIONS_TA = "thetiebar:footer_page:need_help_section:promotions"
  PROMOTIONS_EP = "EP:thetiebar:footer_page:need_help_section:promotions"

  HOLIDAY_TIES_IL = "(//a[contains(@href,'holiday-ties')])[2]"
  HOLIDAY_TIES_TA = "thetiebar:footer_page:Holiday_ties"
  HOLIDAY_TIES_EP = "EP:thetiebar:footer_page:Holiday_ties"

  CONTACT_US_H1_IL = "//h1[contains(text(),'CONTACT US')]"
  CONTACT_US_H1_TA = "thetiebar:contact_page:contact_us"
  CONTACT_US_H1_EP = "EP:thetiebar:contact_page:contact_us"

  SHIPPING_H1_IL = "//h1[contains(text(),'SHIPPING')]"
  SHIPPING_H1_TA = "thetiebar:shipping_page:shipping_h1"
  SHIPPING_H1_EP = "EP:thetiebar:shipping_page:shipping_h1"

  RETURNS_H1_IL = "//h1[contains(text(),'RETURNS')]"
  RETURNS_H1_TA = "thetiebar:returns_page:returns_h1"
  RETURNS_H1_EP = "EP:thetiebar:returns_page:returns_h1"

  TRACK_MY_ORDER_H1_IL = "//h1[contains(text(),'Track My Order')]"
  TRACK_MY_ORDER_H1_TA = "thetiebar:track_page:track_my_order_h1"
  TRACK_MY_ORDER_H1_EP = "EP:thetiebar:track_page:track_my_order_h1"

  ABOUT_US_H1_IL = "//h1[contains(text(),'ABOUT THE TIE BAR')]"
  ABOUT_US_H1_TA = "thetiebar:about_page:about_tiebar_h1"
  ABOUT_US_H1_EP = "EP:thetiebar:about_page:about_tiebar_h1"

  FAQ_H1_IL = "//h1[contains(text(),'FAQ')]"
  FAQ_H1_TA = "thetiebar:faq_page:FAQ_h1"
  FAQ_H1_EP = "EP:thetiebar:faq_page:FAQ_h1"

  CURRENT_OPEN_POSITIONS_H1_IL = "//h1[contains(text(),'CURRENT OPEN POSITIONS')]"
  CURRENT_OPEN_POSITIONS_H1_TA = "thetiebar:jobs_page:current_posittions_h1"
  CURRENT_OPEN_POSITIONS_H1_EP = "EP:thetiebar:jobs_page:current_posittions_h1"

  PROMOTIONS_H1_IL = "//h1[contains(text(),'The Tie Bar Promotions')]"
  PROMOTIONS_H1_TA = "thetiebar:promocode_page:promotions_h1"
  PROMOTIONS_H1_EP = "EP:thetiebar:promocode_page:promotions_h1"


  def click_contact(key = nil)
    post_processing key do
      return find(ta(CONTACT_EP)).click if key == :ep
      return find(:xpath, CONTACT_IL).click if key == :il
      find(:xpath, ta(CONTACT_TA, CONTACT_IL)).click
    end
  end

  def click_shipping(key = nil)
    post_processing key do
      return find(ta(SHIPPING_EP)).click if key == :ep
      return find(:xpath, SHIPPING_IL).click if key == :il
      find(:xpath, ta(SHIPPING_TA, SHIPPING_IL)).click
    end
  end

  def click_returns(key = nil)
    post_processing key do
      return find(ta(RETURNS_EP)).click if key == :ep
      return find(:xpath, RETURNS_IL).click if key == :il
      find(:xpath, ta(RETURNS_TA, RETURNS_IL)).click
    end
  end

  def click_track_my_orders(key = nil)
    post_processing key do
      return find(ta(TRACK_MY_ORDER_EP)).click if key == :ep
      return find(:xpath, TRACK_MY_ORDER_IL).click if key == :il
      find(:xpath, ta(TRACK_MY_ORDER_TA, TRACK_MY_ORDER_IL)).click
    end
  end

  def click_about_us(key = nil)
    post_processing key do
      return find(ta(ABOUT_US_EP)).click if key == :ep
      return find(:xpath, ABOUT_US_IL).click if key == :il
      find(:xpath, ta(ABOUT_US_TA, ABOUT_US_IL)).click
    end
  end

  def click_about_our_stores(key = nil)
    post_processing key do
      return find(ta(ABOUT_OUR_STORES_EP)).click if key == :ep
      return find(:xpath, ABOUT_OUR_STORES_IL).click if key == :il
      find(:xpath, ta(ABOUT_OUR_STORES_TA, ABOUT_OUR_STORES_IL)).click
    end
  end

  def click_faq(key = nil)
    post_processing key do
      return find(ta(FAQ_EP)).click if key == :ep
      return find(:xpath, FAQ_IL).click if key == :il
      find(:xpath, ta(FAQ_TA, FAQ_IL)).click
    end
  end

  def click_careers(key = nil)
    post_processing key do
      return find(ta(CAREERS_EP)).click if key == :ep
      return find(:xpath, CAREERS_IL).click if key == :il
      find(:xpath, ta(CAREERS_TA, CAREERS_IL)).click
    end
  end

  def click_canada(key = nil)
    post_processing key do
      return find(ta(CANADA_EP)).click if key == :ep
      return find(:xpath, CANADA_IL).click if key == :il
      find(:xpath, ta(CANADA_TA, CANADA_IL)).click
    end
  end

  def click_promotions(key = nil)
    post_processing key do
      return find(ta(PROMOTIONS_EP)).click if key == :ep
      return find(:xpath, PROMOTIONS_IL).click if key == :il
      find(:xpath, ta(PROMOTIONS_TA, PROMOTIONS_IL)).click
    end
  end

  def click_holiday_ties(key = nil)
    post_processing key do
      return find(ta(HOLIDAY_TIES_EP)).click if key == :ep
      return find(:xpath, HOLIDAY_TIES_IL).click if key == :il
      find(:xpath, ta(HOLIDAY_TIES_TA, HOLIDAY_TIES_IL)).click
    end
  end


  def should_see_contact_h1(key = nil)
    post_processing key do
      return assert_selector(ta(CONTACT_US_H1_EP)) if key == :ep
      return assert_selector(:xpath, CONTACT_US_H1_IL) if key == :il
      assert_selector(:xpath, ta(CONTACT_US_H1_TA, CONTACT_US_H1_IL))
    end
  end

  def should_see_shipping_h1(key = nil)
    post_processing key do
      return assert_selector(ta(SHIPPING_H1_EP)) if key == :ep
      return assert_selector(:xpath, SHIPPING_H1_IL) if key == :il
      assert_selector(:xpath, ta(SHIPPING_H1_TA, SHIPPING_H1_IL))
    end
  end

  def should_see_returns_h1(key = nil)
    post_processing key do
      return assert_selector(ta(RETURNS_H1_EP)) if key == :ep
      return assert_selector(:xpath, RETURNS_H1_IL) if key == :il
      assert_selector(:xpath, ta(RETURNS_H1_TA, RETURNS_H1_IL))
    end
  end

  def should_see_track_my_order_h1(key = nil)
    post_processing key do
      return assert_selector(ta(TRACK_MY_ORDER_H1_EP)) if key == :ep
      return assert_selector(:xpath, TRACK_MY_ORDER_H1_IL) if key == :il
      assert_selector(:xpath, ta(TRACK_MY_ORDER_H1_TA, TRACK_MY_ORDER_H1_IL))
    end
  end

  def should_see_about_us_h1(key = nil)
    post_processing key do
      return assert_selector(ta(ABOUT_US_H1_EP)) if key == :ep
      return assert_selector(:xpath, ABOUT_US_H1_IL) if key == :il
      assert_selector(:xpath, ta(ABOUT_US_H1_TA, ABOUT_US_H1_IL))
    end
  end

  def should_see_faq_h1(key = nil)
    post_processing key do
      return assert_selector(ta(FAQ_H1_EP)) if key == :ep
      return assert_selector(:xpath, FAQ_H1_IL) if key == :il
      assert_selector(:xpath, ta(FAQ_H1_TA, FAQ_H1_IL))
    end
  end

  def should_see_current_posittions_h1(key = nil)
    post_processing key do
      return assert_selector(ta(CURRENT_OPEN_POSITIONS_H1_EP)) if key == :ep
      return assert_selector(:xpath, CURRENT_OPEN_POSITIONS_H1_IL) if key == :il
      assert_selector(:xpath, ta(CURRENT_OPEN_POSITIONS_H1_TA, CURRENT_OPEN_POSITIONS_H1_IL))
    end
  end

  def should_see_promotions_h1(key = nil)
    post_processing key do
      return assert_selector(ta(PROMOTIONS_H1_EP)) if key == :ep
      return assert_selector(:xpath, PROMOTIONS_H1_IL) if key == :il
      assert_selector(:xpath, ta(PROMOTIONS_H1_TA, PROMOTIONS_H1_IL))
    end
  end

end