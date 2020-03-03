require 'spec_helper'
require_relative '../../helpers/special_methods'


class TheTiebarHolidaysPage

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage


  BOYS_CHRISTMAS_TIES_IL = "//img[contains(@alt, 'Boys Christmas Ties and bow ties')]"
  BOYS_CHRISTMAS_TIES_TA = "thetiebar:holiday_page:boys_christmas_ties"
  BOYS_CHRISTMAS_TIES_EP = "EP:thetiebar:holiday_page:boys_christmas_ties"

  THANKSGIVING_TIES_IL = "//img[contains(@alt, 'Thanksgiving Ties')]"
  THANKSGIVING_TIES_TA = "thetiebar:holiday_page:thanksgiving_ties"
  THANKSGIVING_TIES_EP = "EP:thetiebar:holiday_page:thanksgiving_ties"

  BOYS_EASTER_TIES_IL = "//img[contains(@alt, 'Boys Easter Ties')]"
  BOYS_EASTER_TIES_TA = "thetiebar:holiday_page:easter_ties"
  BOYS_EASTER_TIES_EP = "EP:thetiebar:holiday_page:easter_ties"

  NAUTICAL_TIES_IL = "//img[contains(@alt, 'Nautical Ties and Accessories')]"
  NAUTICAL_TIES_TA = "thetiebar:holiday_page:Nautical_ties"
  NAUTICAL_TIES_EP = "EP:thetiebar:holiday_page:Nautical_ties"

  BOYS_CHRISTMAS_TIES_H1_IL = "//h1[contains(text(),'Christmas Ties')]"
  BOYS_CHRISTMAS_TIES_H1_TA = "thetiebar:holiday_page:pdp:christmas_h1"
  BOYS_CHRISTMAS_TIES_H1_EP = "EP:thetiebar:holiday_page:pdp:christmas_h1"

  THANKSGIVING_TIES_H1_IL = "//h1[contains(text(),'Thanksgiving Ties & Accessories')]"
  THANKSGIVING_TIES_H1_TA = "thetiebar:holiday_page:pdp:thanksgiving_ties_h1"
  THANKSGIVING_TIES_H1_EP = "EP:thetiebar:holiday_page:pdp:thanksgiving_ties_h1"

  BOYS_EASTER_TIES_H1_IL = "//h1[contains(text(),'Easter Ties & Bow Ties For Boys')]"
  BOYS_EASTER_TIES_H1_TA = "thetiebar:holiday_page:pdp:easter_ties_h1"
  BOYS_EASTER_TIES_H1_EP = "EP:thetiebar:holiday_page:pdp:easter_ties_h1"

  NAUTICAL_TIES_H1_IL = "//h1[contains(text(),'Nautical Ties & Accessories')]"
  NAUTICAL_TIES_H1_TA = "thetiebar:holiday_page:pdp:Nautical_ties_h1"
  NAUTICAL_TIES_H1_EP = "EP:thetiebar:holiday_page:pdp:Nautical_ties_h1"


  def click_boys_christmas_ties_icon(key = nil)
    post_processing key do
      return find(ta(BOYS_CHRISTMAS_TIES_EP)).click if key == :ep
      return find(:xpath, BOYS_CHRISTMAS_TIES_IL).click if key == :il
      find(:xpath, ta(BOYS_CHRISTMAS_TIES_TA, BOYS_CHRISTMAS_TIES_IL)).click
    end
  end

  def click_thanksgiving_ties_icon(key = nil)
    post_processing key do
      return find(ta(THANKSGIVING_TIES_EP)).click if key == :ep
      return find(:xpath, THANKSGIVING_TIES_IL).click if key == :il
      find(:xpath, ta(THANKSGIVING_TIES_TA, THANKSGIVING_TIES_IL)).click
    end
  end

  def click_boys_easter_ties_icon(key = nil)
    post_processing key do
      return find(ta(BOYS_EASTER_TIES_EP)).click if key == :ep
      return find(:xpath, BOYS_EASTER_TIES_IL).click if key == :il
      find(:xpath, ta(BOYS_EASTER_TIES_TA, BOYS_EASTER_TIES_IL)).click
    end
  end

  def click_nautical_ties_icon(key = nil)
    post_processing key do
      return find(ta(NAUTICAL_TIES_EP)).click if key == :ep
      return find(:xpath, NAUTICAL_TIES_IL).click if key == :il
      find(:xpath, ta(NAUTICAL_TIES_TA, NAUTICAL_TIES_IL)).click
    end
  end

  def should_see_boys_christmas_h1(key = nil)
    post_processing key do
      return assert_selector(ta(BOYS_CHRISTMAS_TIES_H1_EP)) if key == :ep
      return assert_selector(:xpath, BOYS_CHRISTMAS_TIES_H1_IL) if key == :il
      assert_selector(:xpath, ta(BOYS_CHRISTMAS_TIES_H1_TA, BOYS_CHRISTMAS_TIES_H1_IL))
    end
  end

  def should_see_thanksgiving_h1(key = nil)
    post_processing key do
      return assert_selector(ta(THANKSGIVING_TIES_H1_EP)) if key == :ep
      return assert_selector(:xpath, THANKSGIVING_TIES_H1_IL) if key == :il
      assert_selector(:xpath, ta(THANKSGIVING_TIES_H1_TA, THANKSGIVING_TIES_H1_IL))
    end
  end

  def should_see_boys_easter_h1(key = nil)
    post_processing key do
      return assert_selector(ta(BOYS_EASTER_TIES_H1_EP)) if key == :ep
      return assert_selector(:xpath, BOYS_EASTER_TIES_H1_IL) if key == :il
      assert_selector(:xpath, ta(BOYS_EASTER_TIES_H1_TA, BOYS_EASTER_TIES_H1_IL))
    end
  end

  def should_see_nautical_h1(key = nil)
    post_processing key do
      return assert_selector(ta(NAUTICAL_TIES_H1_EP)) if key == :ep
      return assert_selector(:xpath, NAUTICAL_TIES_H1_IL) if key == :il
      assert_selector(:xpath, ta(NAUTICAL_TIES_H1_TA, NAUTICAL_TIES_H1_IL))
    end
  end

end