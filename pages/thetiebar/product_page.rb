require 'spec_helper'
require_relative '../page_extension'

class TheTiebarProductPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension


  SECOND_SHIRT_PDP_IL = "(//img[contains(@alt, 'shirt')])[2]"
  SECOND_SHIRT_PDP_TA = "thetiebar:header:shirts"
  SECOND_SHIRT_PDP_EP = "EP:thetiebar:header:shirts"

  SECOND_SOCKS_PDP_IL = "(//img[contains(@alt, 'socks')])[2]"
  SECOND_SOCKS_PDP_TA = "thetiebar:header:socks"
  SECOND_SOCKS_PDP_EP = "EP:thetiebar:header:socks"

  SIZE_145_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='14.5']"
  SIZE_145_TA = "thetiebar:PDP:145_size_btn"
  SIZE_145_EP = "EP:thetiebar:PDP:145_size_btn"

  SIZE_15_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='15']"
  SIZE_15_TA = "thetiebar:PDP:15_size_btn"
  SIZE_15_EP = "EP:thetiebar:PDP:15_size_btn"

  SIZE_155_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='15.5']"
  SIZE_155_TA = "thetiebar:PDP:155_size_btn"
  SIZE_155_EP = "EP:thetiebar:PDP:155_size_btn"

  SIZE_16_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='16']"
  SIZE_16_TA = "thetiebar:PDP:16_size_btn"
  SIZE_16_EP = "EP:thetiebar:PDP:16_size_btn"

  SIZE_165_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='16.5']"
  SIZE_165_TA = "thetiebar:PDP:165_size_btn"
  SIZE_165_EP = "EP:thetiebar:PDP:165_size_btn"

  SIZE_17_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='17']"
  SIZE_17_TA = "thetiebar:PDP:17_size_btn"
  SIZE_17_EP = "EP:thetiebar:PDP:17_size_btn"

  SIZE_175_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='17.5']"
  SIZE_175_TA = "thetiebar:PDP:175_size_btn"
  SIZE_175_EP = "EP:thetiebar:PDP:175_size_btn"

  SIZE_18_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='18']"
  SIZE_18_TA = "thetiebar:PDP:18_size_btn"
  SIZE_18_EP = "EP:thetiebar:PDP:18_size_btn"

  SIZE_185_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='18.5']"
  SIZE_185_TA = "thetiebar:PDP:185_size_btn"
  SIZE_185_EP = "EP:thetiebar:PDP:185_size_btn"

  SLEEVE_LENGTH_IL = "(//button[not(@disabled)]/span/h5[contains(text(), '/')])[1]"
  SLEEVE_LENGTH_TA = "thetiebar:PDP:sleeve_length"
  SLEEVE_LENGTH_EP = "EP:thetiebar:PDP:sleeve_length"

  QUANTITY_IL = "(//button[contains(@aria-label, 'subtract')])[1]"
  QUANTITY_TA = "thetiebar:PDP:quantity"
  QUANTITY_EP = "EP:thetiebar:PDP:quantity"

  ADD_TO_CART_IL = "(//h4[contains(text(), 'Add to Cart')])[1]"
  # ADD_TO_CART_IL = "(//button[contains(@data-th, 'add-to-cart')])[1]"
  ADD_TO_CART_TA = "thetiebar:PDP:add_to_cart"
  ADD_TO_CART_EP = "EP:thetiebar:PDP:add_to_cart"

  FIT_TRIM_IL = "//h6[text()='Trim']"
  FIT_TRIM_TA = "thetiebar:PDP:fit_trim"
  FIT_TRIM_EP = "EP:thetiebar:PDP:fit_trim"

  BLACK_COLOR_IL = "//div[contains(@style, '#000000')]"
  BLACK_COLOR_TA = "thetiebar:PDP:black_color"
  BLACK_COLOR_EP = "EP:thetiebar:PDP:black_color"

  BLUE_COLOR_IL = "//div[contains(@style, '#0000cc')]"
  BLUE_COLOR_TA = "thetiebar:PDP:blue_color"
  BLUE_COLOR_EP = "EP:thetiebar:PDP:blue_color"

  SLIM_FIT_IL = "//p[contains(text(), 'slim')]"
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

  SHIRTS_H1_IL = "//h1[contains(text(),'Dress Shirts')]"
  SHIRTS_H1_TA = "thetiebar:PDP:shirts_h1"
  SHIRTS_H1_EP = "EP:thetiebar:PDP:shirts_h1"

  WEDDING_TIES_H1_IL = "//h1[contains(text(),'Wedding Ties')]"
  WEDDING_TIES_H1_TA = "thetiebar:PDP:wedding_shop_h1"
  WEDDING_TIES_H1_EP = "EP:thetiebar:PDP:wedding_shop_h1"

  def should_see_wedding_ties_h1(key = nil)
    post_processing key do
      return assert_selector(ta(WEDDING_TIES_H1_EP)) if key == :ep
      return assert_selector(:xpath, WEDDING_TIES_H1_IL) if key == :il
      assert_selector(:xpath, ta(WEDDING_TIES_H1_TA, WEDDING_TIES_H1_IL))
    end
  end

  def should_see_shirts_h1(key = nil)
    post_processing key do
      return assert_selector(ta(SHIRTS_H1_EP)) if key == :ep
      return assert_selector(:xpath, SHIRTS_H1_IL) if key == :il
      assert_selector(:xpath, ta(SHIRTS_H1_TA, SHIRTS_H1_IL))
    end
  end

  def click_second_shirt_on_product(key = nil)
    post_processing key do
      return find(ta(SECOND_SHIRT_PDP_EP)).click if key == :ep
      return find(:xpath, SECOND_SHIRT_PDP_IL).click if key == :il
      find(:xpath, ta(SECOND_SHIRT_PDP_TA, SECOND_SHIRT_PDP_IL)).click
    end
  end

  def click_size_btn(key = nil)
    post_processing key do
      return find(ta(SIZE_ENABLED_BUTTON_EP)).click if key == :ep
      return find(:xpath, SIZE_ENABLED_BUTTON_IL).click if key == :il
      find(:xpath, ta(SIZE_ENABLED_BUTTON_TA, SIZE_ENABLED_BUTTON_IL)).click
    end
  end

  def click_fit_trim_btn(key = nil)
    post_processing key do
      return find(ta(FIT_TRIM_EP)).click if key == :ep
      return find(:xpath, FIT_TRIM_IL).click if key == :il
      find(:xpath, ta(FIT_TRIM_TA, FIT_TRIM_IL)).click
    end
  end

  def click_add_quantity_btn(key = nil)
    post_processing key do
      return find(ta(QUANTITY_EP)).click if key == :ep
      return find(:xpath, QUANTITY_IL).click if key == :il
      find(:xpath, ta(QUANTITY_TA, QUANTITY_IL)).click
    end
  end

  def click_add_to_cart_btn(key = nil)
    post_processing key do
      return find(ta(ADD_TO_CART_EP)).click if key == :ep
      return find(:xpath, ADD_TO_CART_IL).click if key == :il
      find(:xpath, ta(ADD_TO_CART_TA, ADD_TO_CART_IL)).click
    end
  end

  def click_to_select_color_blue(key = nil)
    post_processing key do
      return find(ta(BLUE_COLOR_EP)).click if key == :ep
      return find(:xpath, BLUE_COLOR_IL).click if key == :il
      find(:xpath, ta(BLUE_COLOR_TA, BLUE_COLOR_IL)).click
    end
  end

  def click_to_select_color_black(key = nil)
    post_processing key do
      return find(ta(BLACK_COLOR_EP)).click if key == :ep
      return find(:xpath, BLACK_COLOR_IL).click if key == :il
      find(:xpath, ta(BLACK_COLOR_TA, BLACK_COLOR_IL)).click
    end
  end

  def click_slim_fit(key = nil)
    post_processing key do
      return find(ta(SLIM_FIT_EP)).click if key == :ep
      return find(:xpath, SLIM_FIT_IL).click if key == :il
      find(:xpath, ta(SLIM_FIT_TA, SLIM_FIT_IL)).click
    end
  end

  def click_wool_material(key = nil)
    post_processing key do
      return find(ta(WOOL_MATERIAL_EP)).click if key == :ep
      return find(:xpath, WOOL_MATERIAL_IL).click if key == :il
      find(:xpath, ta(WOOL_MATERIAL_TA, WOOL_MATERIAL_IL)).click
    end
  end

  def click_28_waist(key = nil)
    post_processing key do
      return find(ta(WAIST_28_EP)).click if key == :ep
      return find(:xpath, WAIST_28_IL).click if key == :il
      find(:xpath, ta(WAIST_28_TA, WAIST_28_IL)).click
    end
  end

  def click_sort_by(key = nil)
    post_processing key do
      return find(ta(SORT_BY_FILTER_EP)).click if key == :ep
      return find(:xpath, SORT_BY_FILTER_IL).click if key == :il
      find(:xpath, ta(SORT_BY_FILTER_TA, SORT_BY_FILTER_IL)).click
    end
  end

  def click_newest_soring(key = nil)
    post_processing key do
      return find(ta(NEWEST_EP)).click if key == :ep
      return find(:xpath, NEWEST_IL).click if key == :il
      find(:xpath, ta(NEWEST_TA, NEWEST_IL)).click
    end
  end

  def click_view(key = nil)
    post_processing key do
      return find(ta(VIEW_EP)).click if key == :ep
      return find(:xpath, VIEW_IL).click if key == :il
      find(:xpath, ta(VIEW_TA, VIEW_IL)).click
    end
  end

  def click_view72(key = nil)
    post_processing key do
      return find(ta(VIEW_72_EP)).click if key == :ep
      return find(:xpath, VIEW_72_IL).click if key == :il
      find(:xpath, ta(VIEW_72_TA, VIEW_72_IL)).click
    end
  end

  def click_to_select_neck_size
    if  page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//h6[text()='14.5']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//h6[text()='14.5']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//h6[text()='15']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//h6[text()='15']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//h6[text()='15.5']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//h6[text()='15.5']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//h6[text()='16']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//h6[text()='16']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//h6[text()='16.5']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//h6[text()='16.5']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//h6[text()='17']")
      find(:xpath,"//button[not(contains(@tabindex, '-1'))]//h6[text()='17.7']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//h6[text()='17.5']")
      find(:xpath,"//button[not(contains(@tabindex, '-1'))]//h6[text()='17']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//h6[text()='18']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//h6[text()='17']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//h6[text()='18.5']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//h6[text()='17']").click
    else
      p "No sizes available"
    end
  end

  def click_sleeve_length_btn
    if  page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//h6[text()='32/33']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//h6[text()='32/33']").click

    elsif page.has_xpath?("//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h6[text()='34/35']")
      find(:xpath, "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h6[text()='34/35']").click

    elsif page.has_xpath?("//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h6[text()='36/37']")
      find(:xpath, "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h6[text()='36/37']").click
    else
      p "No sleeve length sizes available"

    end
  end

  def click_second_socks(key = nil)
    post_processing key do
      return find(ta(SECOND_SOCKS_PDP_EP)).click if key == :ep
      return find(:xpath, SECOND_SOCKS_PDP_IL).click if key == :il
      find(:xpath, ta(SECOND_SOCKS_PDP_TA, SECOND_SOCKS_PDP_IL)).click
    end
  end
end