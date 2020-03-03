require 'spec_helper'
require_relative '../page_extension'


class TheTiebarFaqPage

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension


  VIEW_MY_REWARDS_IL = "(//div[text()='View My Rewards'])[1]"
  VIEW_MY_REWARDS_TA = "thetiebar:faq_page:view_my_rewards"
  VIEW_MY_REWARDS_EP = "EP:thetiebar:faq_page:view_my_rewards"

  LEARN_MORE_HERE_IL = "(//a[@href='/loyalty-rewards-program'])[1]"
  LEARN_MORE_HERE_TA = "thetiebar:faq_page:learn_more_link"
  LEARN_MORE_HERE_EP = "EP:thetiebar:faq_page:learn_more_link"

  FAQ_SECTION_IL =  "(//a[contains(text(), 'For more details, visit the FAQ section')])[1]"
  FAQ_SECTION_TA = "thetiebar:faq_page:faq_section"
  FAQ_SECTION_EP = "EP:thetiebar:faq_page:faq_section"

  RETURN_TO_THE_TIE_BAR_LINK_IL = "(//a[@href='https://thetiebar.com'])[1]"
  RETURN_TO_THE_TIE_BAR_LINK_TA = "thetiebar:faq_page:return_to_thetiebar"
  RETURN_TO_THE_TIE_BAR_LINK_EP = "EP:thetiebar:faq_page:return_to_thetiebar"

  WHAT_SIZE_NECKTIES_IL = "//zd-autocomplete-option[@tabindex='1']"
  WHAT_SIZE_NECKTIES_TA = "thetiebar:faq_page:size_neckties"
  WHAT_SIZE_NECKTIES_EP = "EP:thetiebar:faq_page:size_neckties"

  TIE_BAR_BREADCRUMBS_IL = "(//a[text()='The Tie Bar'])[1]"
  TIE_BAR_BREADCRUMBS_TA = "thetiebar:faq_page:breadcrumb_tiebar"
  TIE_BAR_BREADCRUMBS_EP = "EP:thetiebar:faq_page:breadcrumb_tiebar"

  FAQ_SEARCH_BTN_IL = "//button[@class='search-btn']"
  FAQ_SEARCH_BTN_TA = "thetiebar:faq_page:faq_search_btn"
  FAQ_SEARCH_BTN_EP = "EP:thetiebar:faq_page:faq_search_btn"

  KNOWLEDGE_BASE_NECKTIES_IL = "(//*[contains(text(), 'What size are your neckties?')])[1]"
  KNOWLEDGE_BASE_NECKTIES_TA = "thetiebar:faq_page:knowledge_size_neckties"
  KNOWLEDGE_BASE_NECKTIES_EP = "EP:thetiebar:faq_page:knowledge_size_neckties"

  FAQ_SEARCH_INPUT_IL = "//input[contains(@id, 'query')]"
  FAQ_SEARCH_INPUT_TA = "thetiebar:faq_page:faq_search_input"
  FAQ_SEARCH_INPUT_EP = "EP:thetiebar:faq_page:faq_search_input"

  INTERNATIONAL_SECTION_IL = "//h4[text()='International']"
  INTERNATIONAL_SECTION_TA = "thetiebar:faq_page:international"
  INTERNATIONAL_SECTION_EP = "EP:thetiebar:faq_page:international"

  ABOUT_THE_TIEBAR_SECTION_IL = "//h4[text()='About The Tie Bar']"
  ABOUT_THE_TIEBAR_SECTION_TA = "thetiebar:faq_page:about_the_tiebar"
  ABOUT_THE_TIEBAR_SECTION_EP = "EP:thetiebar:faq_page:about_the_tiebar"

  SIZING_SECTION_IL = "//h4[text()='Sizing']"
  SIZING_SECTION_TA = "thetiebar:faq_page:sizing"
  SIZING_SECTION_EP = "EP:thetiebar:faq_page:sizing"

  PRODUCTS_SECTION_IL = "//h4[text()='Products']"
  PRODUCTS_SECTION_TA = "thetiebar:faq_page:products"
  PRODUCTS_SECTION_EP = "EP:thetiebar:faq_page:products"

  STYLING_SECTION_IL = "//h4[text()='Styling']"
  STYLING_SECTION_TA = "thetiebar:faq_page:styling"
  STYLING_SECTION_EP = "EP:thetiebar:faq_page:styling"

  BULK_WHOLESALE_SECTION_IL = "//h4[text()='Bulk / Wholesale']"
  BULK_WHOLESALE_SECTION_TA = "thetiebar:faq_page:bulk_wholesale"
  BULK_WHOLESALE_SECTION_EP = "EP:thetiebar:faq_page:bulk_wholesale"

  RETURNS_PAYMENTS_SECTION_IL = "//h4[text()='Returns / Payments']"
  RETURNS_PAYMENTS_SECTION_TA = "thetiebar:faq_page:returns_payment"
  RETURNS_PAYMENTS_SECTION_EP = "EP:thetiebar:faq_page:returns_payment"

  SHIPPING_SECTION_IL = "//h4[text()='Shipping']"
  SHIPPING_SECTION_TA = "thetiebar:faq_page:shipping"
  SHIPPING_SECTION_EP = "EP:thetiebar:faq_page:shipping"

  HOLIDAY_SECTION_IL = "//h4[text()='Holiday']"
  HOLIDAY_SECTION_TA = "thetiebar:faq_page:holiday"
  HOLIDAY_SECTION_EP = "EP:thetiebar:faq_page:holiday"


  def click_view_my_rewards(key = nil)
    post_processing key do
      return find(ta(VIEW_MY_REWARDS_EP)).click if key == :ep
      return find(:xpath, VIEW_MY_REWARDS_IL).click if key == :il
      find(:xpath, ta(VIEW_MY_REWARDS_TA, VIEW_MY_REWARDS_IL)).click
    end
  end

  def click_learn_more_link(key = nil)
    post_processing key do
      return find(ta(LEARN_MORE_HERE_EP)).click if key == :ep
      return find(:xpath, LEARN_MORE_HERE_IL).click if key == :il
      find(:xpath, ta(LEARN_MORE_HERE_TA, LEARN_MORE_HERE_IL)).click
    end
  end

  def click_faq_section_link(key = nil)
    post_processing key do
      return find(ta(FAQ_SECTION_EP)).click if key == :ep
      return find(:xpath, FAQ_SECTION_IL).click if key == :il
      find(:xpath, ta(FAQ_SECTION_EP, FAQ_SECTION_IL)).click
    end
  end

  def click_size_neckties(key = nil)
    post_processing key do
      return find(ta(WHAT_SIZE_NECKTIES_EP)).click if key == :ep
      return find(:xpath, WHAT_SIZE_NECKTIES_IL).click if key == :il
      find(:xpath, ta(WHAT_SIZE_NECKTIES_TA, WHAT_SIZE_NECKTIES_IL)).click
    end
  end

  def click_breadcrumb_tiebar(key = nil)
    post_processing key do
      return find(ta(TIE_BAR_BREADCRUMBS_EP)).click if key == :ep
      return find(:xpath, TIE_BAR_BREADCRUMBS_IL).click if key == :il
      find(:xpath, ta(TIE_BAR_BREADCRUMBS_TA, TIE_BAR_BREADCRUMBS_IL)).click
    end
  end

  def click_faq_search_btn(key = nil)
    post_processing key do
      return find(ta(FAQ_SEARCH_BTN_EP)).click if key == :ep
      return find(:xpath, FAQ_SEARCH_BTN_IL).click if key == :il
      find(:xpath, ta(FAQ_SEARCH_BTN_TA, FAQ_SEARCH_BTN_IL)).click
    end
  end

  def click_knowledge_base_neckties(key = nil)
    post_processing key do
      return find(ta(KNOWLEDGE_BASE_NECKTIES_EP)).click if key == :ep
      return find(:xpath, KNOWLEDGE_BASE_NECKTIES_IL).click if key == :il
      find(:xpath, ta(KNOWLEDGE_BASE_NECKTIES_TA, KNOWLEDGE_BASE_NECKTIES_IL)).click
    end
  end

  def fill_faq_search_input(key = nil, value)
    post_processing key do
      return find(ta(FAQ_SEARCH_INPUT_EP)).set(value) if key == :ep
      return find(:xpath, FAQ_SEARCH_INPUT_IL).set(value) if key == :il
      find(:xpath, ta(FAQ_SEARCH_INPUT_TA, FAQ_SEARCH_INPUT_IL)).set(value)
    end
  end

  def click_international_section(key = nil)
    post_processing key do
      return find(ta(INTERNATIONAL_SECTION_EP)).click if key == :ep
      return find(:xpath, INTERNATIONAL_SECTION_IL).click if key == :il
      find(:xpath, ta(INTERNATIONAL_SECTION_TA, INTERNATIONAL_SECTION_IL)).click
    end
  end

  def click_about_the_tiebar_section(key = nil)
    post_processing key do
      return find(ta(ABOUT_THE_TIEBAR_SECTION_EP)).click if key == :ep
      return find(:xpath, ABOUT_THE_TIEBAR_SECTION_IL).click if key == :il
      find(:xpath, ta(ABOUT_THE_TIEBAR_SECTION_TA, ABOUT_THE_TIEBAR_SECTION_IL)).click
    end
  end

  def click_sizing_section(key = nil)
    post_processing key do
      return find(ta(SIZING_SECTION_EP)).click if key == :ep
      return find(:xpath, SIZING_SECTION_IL).click if key == :il
      find(:xpath, ta(SIZING_SECTION_TA, SIZING_SECTION_IL)).click
    end
  end

  def click_products_section(key = nil)
    post_processing key do
      return find(ta(PRODUCTS_SECTION_EP)).click if key == :ep
      return find(:xpath, PRODUCTS_SECTION_IL).click if key == :il
      find(:xpath, ta(PRODUCTS_SECTION_TA, PRODUCTS_SECTION_IL)).click
    end
  end

  def click_styling_section(key = nil)
    post_processing key do
      return find(ta(STYLING_SECTION_EP)).click if key == :ep
      return find(:xpath, STYLING_SECTION_IL).click if key == :il
      find(:xpath, ta(STYLING_SECTION_TA, STYLING_SECTION_IL)).click
    end
  end

  def click_bulk_wholesale_section(key = nil)
    post_processing key do
      return find(ta(BULK_WHOLESALE_SECTION_EP)).click if key == :ep
      return find(:xpath, BULK_WHOLESALE_SECTION_IL).click if key == :il
      find(:xpath, ta(BULK_WHOLESALE_SECTION_TA, BULK_WHOLESALE_SECTION_IL)).click
    end
  end

  def click_returns_payment_section(key = nil)
    post_processing key do
      return find(ta(RETURNS_PAYMENTS_SECTION_EP)).click if key == :ep
      return find(:xpath, RETURNS_PAYMENTS_SECTION_IL).click if key == :il
      find(:xpath, ta(RETURNS_PAYMENTS_SECTION_TA, RETURNS_PAYMENTS_SECTION_IL)).click
    end
  end

  def click_shipping_section(key = nil)
    post_processing key do
      return find(ta(SHIPPING_SECTION_EP)).click if key == :ep
      return find(:xpath, SHIPPING_SECTION_IL).click if key == :il
      find(:xpath, ta(SHIPPING_SECTION_TA, SHIPPING_SECTION_IL)).click
    end
  end

  def click_holiday_section(key = nil)
    post_processing key do
      return find(ta(HOLIDAY_SECTION_EP)).click if key == :ep
      return find(:xpath, HOLIDAY_SECTION_IL).click if key == :il
      find(:xpath, ta(HOLIDAY_SECTION_TA, HOLIDAY_SECTION_IL)).click
    end
  end

  def click_return_to_the_tiebar(key = nil)
    post_processing key do
      return find(ta(RETURN_TO_THE_TIE_BAR_LINK_EP)).click if key == :ep
      return find(:xpath, RETURN_TO_THE_TIE_BAR_LINK_IL).click if key == :il
      find(:xpath, ta(RETURN_TO_THE_TIE_BAR_LINK_TA, RETURN_TO_THE_TIE_BAR_LINK_IL)).click
    end
  end

end