require 'spec_helper'
require_relative '../../helpers/special_methods'


class TheTiebarMainPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage


  SING_UP_INPUT_IL = "//input[@id='signUpEmail']"
  SING_UP_INPUT_TA = "thetiebar:main_page:singup_input"
  SING_UP_INPUT_EP = "EP:thetiebar:main_page:singup_input"

  JOIN_BTN_IL = "//span[contains(text(), 'Join')]"
  JOIN_BTN_TA = "thetiebar:main_page:join_btn"
  JOIN_BTN_EP = "EP:thetiebar:main_page:join_btn"

  CONGRATS_TEXT_IL = "//p[contains(text(), 'on the list, enjoy.')]"
  CONGRATS_TEXT_TA = "thetiebar:main_page:congrats_text"
  CONGRATS_TEXT_EP = "EP:thetiebar:main_page:congrats_text"

  TERMS_TO_USE_LINK_IL = "//a[contains(text(), 'terms of use')]"
  TERMS_TO_USE_LINK_TA =  "thetiebar:main_page:terms_to_use_link"
  TERMS_TO_USE_LINK_EP = "EP:thetiebar:main_page:terms_to_use_link"

  PRIVACY_POLICE_LINK_IL = "//a[contains(text(), 'privacy policy')]"
  PRIVACY_POLICE_LINK_TA = "thetiebar:main_page:privacy_police_link"
  PRIVACY_POLICE_LINK_EP = "EP:thetiebar:main_page:privacy_police_link"

  def fill_singup_field(key = nil, value)
    post_processing key do
      return find(ta(SING_UP_INPUT_EP)).set(value) if key == :ep
      return find(:xpath, SING_UP_INPUT_IL).set(value) if key == :il
      find(:xpath, ta(SING_UP_INPUT_TA, SING_UP_INPUT_IL)).set(value)
    end
  end

  def click_join_btn(key = nil)
    post_processing key do
      return find(ta(JOIN_BTN_EP)).click if key == :ep
      return find(:xpath, JOIN_BTN_IL).click if key == :il
      find(:xpath, ta(JOIN_BTN_TA, JOIN_BTN_IL)).click
    end
  end

  def check_congrats_text(key=nil)
    post_processing key do
      return assert_selector(ta(CONGRATS_TEXT_EP)) if key == :ep
      return assert_selector(:xpath, CONGRATS_TEXT_IL) if key == :il
      assert_selector(:xpath, ta(CONGRATS_TEXT_TA, CONGRATS_TEXT_IL))
    end
  end

  def click_terms_to_use(key = nil)
    post_processing key do
      return find(ta(TERMS_TO_USE_LINK_EP)).click if key == :ep
      return find(:xpath, TERMS_TO_USE_LINK_IL).click if key == :il
      find(:xpath, ta(TERMS_TO_USE_LINK_TA, TERMS_TO_USE_LINK_IL)).click
    end
  end

  def click_privacy_police(key = nil)
    post_processing key do
      return find(ta(PRIVACY_POLICE_LINK_EP)).click if key == :ep
      return find(:xpath, PRIVACY_POLICE_LINK_IL).click if key == :il
      find(:xpath, ta(PRIVACY_POLICE_LINK_TA, PRIVACY_POLICE_LINK_IL)).click
    end
  end

end
