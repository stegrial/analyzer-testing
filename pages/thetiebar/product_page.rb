require 'spec_helper'

class TheTiebarProductPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  SECOND_SHIRT_PDP_IL = "(//img[contains(@alt, 'shirt')])[2]"
  SECOND_SHIRT_PDP_TA = "thetiebar:header:shirts"
  SECOND_SHIRT_PDP_EP = "EP:thetiebar:header:shirts"

  SIZE_ENABLED_BUTTON_IL = "(//button[not(@disabled)]/span/h5)[3]"
  SIZE_ENABLED_BUTTON_TA = "thetiebar:PDP:size_btn"
  SIZE_ENABLED_BUTTON_EP = "EP:thetiebar:PDP:size_btn"

  SLEEVE_LENGTH_IL = "(//button[not(@disabled)]/span/h5[contains(text(), '/')])[1]"
  SLEEVE_LENGTH_TA = "thetiebar:PDP:sleeve_length"
  SLEEVE_LENGTH_EP = "EP:thetiebar:PDP:sleeve_length"

  QUANTITY_IL = "//button[contains(@aria-label, 'subtract')]"
  QUANTITY_TA = "thetiebar:PDP:quantity"
  QUANTITY_EP = "EP:thetiebar:PDP:quantity"

  ADD_TO_CART_IL = "(//button[contains(@data-th, 'add-to-cart')])[1]"
  ADD_TO_CART_TA = "thetiebar:PDP:add_to_cart"
  ADD_TO_CART_EP = "EP:thetiebar:PDP:add_to_cart"

  FIT_TRIM_IL = "//h5[text()='Trim']"
  FIT_TRIM_TA = "thetiebar:PDP:fit_trim"
  FIT_TRIM_EP = "EP:thetiebar:PDP:fit_trim"

  BLACK_COLOR_IL = "//div[contains(@style, '#000000')]"
  BLACK_COLOR_TA = "thetiebar:PDP:black_color"
  BLACK_COLOR_EP = "EP:thetiebar:PDP:black_color"

  BLUE_COLOR_IL = "//div[contains(@style, '#0000cc')]"
  BLUE_COLOR_TA = "thetiebar:PDP:blue_color"
  BLUE_COLOR_EP = "EP:thetiebar:PDP:blue_color"

  SLIM_FIT_IL = "//div[contains(text(), 'Slim')]"
  SLIM_FIT_TA = "thetiebar:PDP:slim_fit"
  SLIM_FIT_EP = "EP:thetiebar:PDP:slim_fit"

  WOOL_MATERIAL_IL = "//p[contains(text(), 'wool')]"
  WOOL_MATERIAL_TA = "thetiebar:PDP:wool"
  WOOL_MATERIAL_EP = "EP:thetiebar:PDP:wool"

  WAIST_28_IL = "//div[contains(text(), '28')]"
  WAIST_28_TA = "thetiebar:PDP:waist28"
  WAIST_28_EP = "EP:thetiebar:PDP:waist28"

  SORT_BY_FILTER_IL = "//span[contains(text(), 'SORT BY:')]"
  SORT_BY_FILTER_TA = "thetiebar:PDP:sort_by"
  SORT_BY_FILTER_EP = "EP:thetiebar:PDP:sort_by"

  NEWEST_IL = "//li[contains(text(), 'Newest')]"
  NEWEST_TA = "thetiebar:PDP:newest"
  NEWEST_EP = "EP:thetiebar:PDP:newest"

  VIEW_IL = "//span[contains(text(), 'VIEW:')]"
  VIEW_TA = "thetiebar:PDP:view"
  VIEW_EP = "EP:thetiebar:PDP:view"

  VIEW_72_IL = "//li[contains(text(), '72')]"
  VIEW_72_TA = "thetiebar:PDP:72view"
  VIEW_72_EP = "EP:thetiebar:PDP:72view"

  def click_second_shirt_on_product(key = nil)
    return find(ta(SECOND_SHIRT_PDP_EP)).click if key == :ep
    return find(:xpath, SECOND_SHIRT_PDP_IL).click if key == :il
    find(:xpath, ta(SECOND_SHIRT_PDP_TA, SECOND_SHIRT_PDP_IL)).click
  end

  def click_size_btn(key = nil)
    return find(ta(SIZE_ENABLED_BUTTON_EP)).click if key == :ep
    return find(:xpath, SIZE_ENABLED_BUTTON_IL).click if key == :il
    find(:xpath, ta(SIZE_ENABLED_BUTTON_TA, SIZE_ENABLED_BUTTON_IL)).click
  end

  def click_fit_trim_btn(key = nil)
    return find(ta(FIT_TRIM_EP)).click if key == :ep
    return find(:xpath, FIT_TRIM_IL).click if key == :il
    find(:xpath, ta(FIT_TRIM_TA, FIT_TRIM_IL)).click
  end

  def click_sleeve_length_btn(key = nil)
    return find(ta(SLEEVE_LENGTH_EP)).click if key == :ep
    return find(:xpath, SLEEVE_LENGTH_IL).click if key == :il
    find(:xpath, ta(SLEEVE_LENGTH_TA, SLEEVE_LENGTH_IL)).click
  end

  def click_add_quantity_btn(key = nil)
    return find(ta(QUANTITY_EP)).click if key == :ep
    return find(:xpath, QUANTITY_IL).click if key == :il
    find(:xpath, ta(QUANTITY_TA, QUANTITY_IL)).click
  end

  def click_add_to_cart_btn(key = nil)
    return find(ta(ADD_TO_CART_EP)).click if key == :ep
    return find(:xpath, ADD_TO_CART_IL).click if key == :il
    find(:xpath, ta(ADD_TO_CART_TA, ADD_TO_CART_IL)).click
  end

  def click_to_select_color_blue(key = nil)
    return find(ta(BLUE_COLOR_EP)).click if key == :ep
    return find(:xpath, BLUE_COLOR_IL).click if key == :il
    find(:xpath, ta(BLUE_COLOR_TA, BLUE_COLOR_IL)).click
  end

  def click_to_select_color_black(key = nil)
    return find(ta(BLACK_COLOR_EP)).click if key == :ep
    return find(:xpath, BLACK_COLOR_IL).click if key == :il
    find(:xpath, ta(BLACK_COLOR_TA, BLACK_COLOR_IL)).click
  end

  def click_slim_fit(key = nil)
    return find(ta(SLIM_FIT_EP)).click if key == :ep
    return find(:xpath, SLIM_FIT_IL).click if key == :il
    find(:xpath, ta(SLIM_FIT_TA, SLIM_FIT_IL)).click
  end

  def click_wool_material(key = nil)
    return find(ta(WOOL_MATERIAL_EP)).click if key == :ep
    return find(:xpath, WOOL_MATERIAL_IL).click if key == :il
    find(:xpath, ta(WOOL_MATERIAL_TA, WOOL_MATERIAL_IL)).click
  end

  def click_28_waist(key = nil)
    return find(ta(WAIST_28_EP)).click if key == :ep
    return find(:xpath, WAIST_28_IL).click if key == :il
    find(:xpath, ta(WAIST_28_TA, WAIST_28_IL)).click
  end

  def click_sort_by(key = nil)
    return find(ta(SORT_BY_FILTER_EP)).click if key == :ep
    return find(:xpath, SORT_BY_FILTER_IL).click if key == :il
    find(:xpath, ta(SORT_BY_FILTER_TA, SORT_BY_FILTER_IL)).click
  end

  def click_newest_soring(key = nil)
    return find(ta(NEWEST_EP)).click if key == :ep
    return find(:xpath, NEWEST_IL).click if key == :il
    find(:xpath, ta(NEWEST_TA, NEWEST_IL)).click
  end

  def click_view(key = nil)
    return find(ta(VIEW_EP)).click if key == :ep
    return find(:xpath, VIEW_IL).click if key == :il
    find(:xpath, ta(VIEW_TA, VIEW_IL)).click
  end

  def click_view72(key = nil)
    return find(ta(VIEW_72_EP)).click if key == :ep
    return find(:xpath, VIEW_72_IL).click if key == :il
    find(:xpath, ta(VIEW_72_TA, VIEW_72_IL)).click
  end
end