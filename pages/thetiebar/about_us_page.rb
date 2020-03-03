require 'spec_helper'
require_relative '../page_extension'


class TheTiebarAboutUs

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  NEXT_IMG_SLIDER_IL = "//*[contains(@class, 'main-carousel-next')]"
  NEXT_IMG_SLIDER_TA = "thetiebar:about_us:next_btn"
  NEXT_IMG_SLIDER_EP = "EP:thetiebar:about_us:next_btn"

  PREVIOUS_IMG_SLIDER_IL = "//*[contains(@class, 'main-carousel-previous')]"
  PREVIOUS_IMG_SLIDER_TA = "thetiebar:about_us:previous_btn"
  PREVIOUS_IMG_SLIDER_EP = "EP:thetiebar:about_us:previous_btn"

  NEXT_HISTORY_SLIDER_IL = "//*[contains(@class, 'history-carousel-next')]"
  NEXT_HISTORY_SLIDER_TA = "thetiebar:about_us:next_history_btn"
  NEXT_HISTORY_SLIDER_EP = "EP:thetiebar:about_us:next_history_btn"

  PREVIOUS_HISTORY_SLIDER_IL = "//*[contains(@class, 'history-carousel-previous')]"
  PREVIOUS_HISTORY_SLIDER_TA = "thetiebar:about_us:previous_history_btn"
  PREVIOUS_HISTORY_SLIDER_EP = "EP:thetiebar:about_us:previous_history_btn"

  FIND_STORE_BTN_IL = "//div[text()='Find a store near you']"
  FIND_STORE_BTN_TA = "thetiebar:about_us:find_store_btn"
  FIND_STORE_BTN_EP = "EP:thetiebar:about_us:find_store_btn"

  ABOUT_OUR_STORES_H1_IL = "//h1[contains(text(),'About Our Tie Bar Stores')]"
  ABOUT_OUR_STORES_H1_TA = "thetiebar:returns_page:about_our_stores_h1"
  ABOUT_OUR_STORES_H1_EP = "EP:thetiebar:returns_page:about_our_stores_h1"


  def click_next_slider(key = nil)
    post_processing key do
      return find(ta(NEXT_IMG_SLIDER_EP)).click if key == :ep
      return find(:xpath, NEXT_IMG_SLIDER_IL).click if key == :il
      find(:xpath, ta(NEXT_IMG_SLIDER_TA, NEXT_IMG_SLIDER_IL)).click
    end
  end

  def click_previous_slider(key = nil)
    post_processing key do
      return find(ta(PREVIOUS_IMG_SLIDER_EP)).click if key == :ep
      return find(:xpath, PREVIOUS_IMG_SLIDER_IL).click if key == :il
      find(:xpath, ta(PREVIOUS_IMG_SLIDER_TA, PREVIOUS_IMG_SLIDER_IL)).click
      end
  end

  def click_next_history_slider(key = nil)
    post_processing key do
      return find(ta(NEXT_HISTORY_SLIDER_EP)).click if key == :ep
      return find(:xpath, NEXT_HISTORY_SLIDER_IL).click if key == :il
      find(:xpath, ta(NEXT_HISTORY_SLIDER_TA, NEXT_HISTORY_SLIDER_IL)).click
    end
  end

  def click_previous_history_slider(key = nil)
    post_processing key do
      return find(ta(PREVIOUS_HISTORY_SLIDER_EP)).click if key == :ep
      return find(:xpath, PREVIOUS_HISTORY_SLIDER_IL).click if key == :il
      find(:xpath, ta(PREVIOUS_HISTORY_SLIDER_TA, PREVIOUS_HISTORY_SLIDER_IL)).click
    end
  end

  def click_find_store_btn(key = nil)
    post_processing key do
      return find(ta(FIND_STORE_BTN_EP)).click if key == :ep
      return find(:xpath, FIND_STORE_BTN_IL).click if key == :il
      find(:xpath, ta(FIND_STORE_BTN_TA, FIND_STORE_BTN_IL)).click
    end
  end

  def should_see_about_our_stores_h1(key = nil)
    post_processing key do
      return assert_selector(ta(ABOUT_OUR_STORES_H1_EP)) if key == :ep
      return assert_selector(:xpath, ABOUT_OUR_STORES_H1_IL) if key == :il
      assert_selector(:xpath, ta(ABOUT_OUR_STORES_H1_TA, ABOUT_OUR_STORES_H1_IL))
    end
  end

end