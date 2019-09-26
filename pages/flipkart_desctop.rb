require 'spec_helper'

class Flipkart
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  WOMEN_LINK_IL = "(//span[@class='_1QZ6fC _3Lgyp8'])[4]"
  WOMEN_LINK_TA = "flip_kart:women"
  WOMEN_LINK_EP = "EP:flip_kart:women"

  DRESSES_LINK_IL = "(//a[@title='Dresses'])[1]"
  DRESSES_LINK_TA = "flip_kart:dresses"
  DRESSES_LINK_EP = "EP:flip_kart:dresses"

  SECOND_PRODUCT_LINK_IL = "(//a[@class='_3dqZjq'])[2]"
  SECOND_PRODUCT_LINK_TA = "flip_kart:second_dress"
  SECOND_PRODUCT_LINK_EP = "EP:flip_kart:second_dress"

  def click_women_link(key = nil)
    return find(:xpath, ta(WOMEN_LINK_EP)).hover if key == :ep
    return find(:xpath, WOMEN_LINK_IL).hover if key == :il
    find(:xpath, ta(WOMEN_LINK_TA, WOMEN_LINK_IL)).hover
  end

  def click_dresses_link(key = nil)
    return find(:xpath, ta(DRESSES_LINK_EP)).click if key == :ep
    return find(:xpath, DRESSES_LINK_IL).click if key == :il
    find(:xpath, ta(DRESSES_LINK_TA, DRESSES_LINK_IL)).click
  end

  def click_second_dress_link(key = nil)
    return find(:xpath, ta(SECOND_PRODUCT_LINK_EP)).click if key == :ep
    return find(:xpath, SECOND_PRODUCT_LINK_IL).click if key == :il
    find(:xpath, ta(SECOND_PRODUCT_LINK_TA, SECOND_PRODUCT_LINK_IL)).click
  end

  def escape
    find(:xpath, "//body").send_keys :escape
  end
end