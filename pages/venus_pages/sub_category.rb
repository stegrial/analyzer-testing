require 'spec_helper'
require_relative '../page_extension'

class VenusSubCategory
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  def product_name(locator, name)
    case locator
    when :il then "//a[.//h2[text()='#{name}']]"
    when :ta then "venus:sub_category_page:product_list:#{name.tr('^A-Za-z0-9_', '')}"
    when :ep then "EP:venus:sub_category_page:product_list:#{name.tr('^A-Za-z0-9_', '')}"
    else p 'Locator type is not set'
    end
  end

  VIEW_DETAIL_SECOND_IL = "(//span[text()='view detail'])[2]"
  VIEW_DETAIL_SECOND_TA = 'venus:sub_category_page:view_detail_second'
  VIEW_DETAIL_SECOND_EP = 'EP:venus:sub_category_page:view_detail_second'

  SIZE_FILTER_IL = "//button[.//span[text()='Filter']]"
  SIZE_FILTER_TA = 'venus:sub_category_page:size_filter'
  SIZE_FILTER_EP = 'EP:venus:sub_category_page:size_filter'

  def filter_size(locator, size)
    case locator
    when :il then "//label[.//span[text()='#{size}']]"
    when :ta then "venus:sub_category_page:filter_size:#{size.tr('^A-Za-z0-9_', '')}"
    when :ep then "EP:venus:sub_category_page:filter_size:#{size.tr('^A-Za-z0-9_', '')}"
    else p 'Locator type is not set'
    end
  end

  VIEW_RESULTS_BTN_IL = "//button[contains(., 'View Results')]"
  VIEW_RESULTS_BTN_TA = 'venus:sub_category_page:view_results_btn'
  VIEW_RESULTS_BTN_EP = 'EP:venus:sub_category_page:view_results_btn'

  SUBCAT_DROPDOWN_IL = "//div[@data-page='Subcategory']//div[@id='select-subcategories']"
  SUBCAT_DROPDOWN_TA = 'venus:sub_category_page:subcat_dropdown'
  SUBCAT_DROPDOWN_EP = 'EP:venus:sub_category_page:subcat_dropdown'

  CLOTHING_CAT_DROPDOWN_IL = "//li[text()='Clothing']"
  CLOTHING_CAT_DROPDOWN_TA = 'venus:sub_category_page:clothing_cat'
  CLOTHING_CAT_DROPDOWN_EP = 'EP:venus:sub_category_page:clothing_cat'


  def choose_product_by_name(key = nil, name)
    post_processing key do
      return find(ta(product_name(:ep, name))).click if key == :ep
      return find(:xpath, product_name(:il, name)).click if key == :il
      find(:xpath, ta(product_name(:ta, name), product_name(:il, name))).click
    end
  end

  def click_view_detail_second(key = nil)
    post_processing key do
      return find(:xpath, ta(VIEW_DETAIL_SECOND_EP)).click if key == :ep
      return find(:xpath, VIEW_DETAIL_SECOND_IL).click if key == :il
      find(:xpath, ta(VIEW_DETAIL_SECOND_TA, VIEW_DETAIL_SECOND_IL)).click
    end
  end

  def open_size_filter(key = nil)
    post_processing key do
      return find(ta(SIZE_FILTER_EP)).click if key == :ep
      return find(:xpath, SIZE_FILTER_IL).click if key == :il
      find(:xpath, ta(SIZE_FILTER_TA, SIZE_FILTER_IL)).click
    end
  end

  def choose_filter_size(key = nil, size)
    post_processing key do
      return find(ta(filter_size(:ep, size))).click if key == :ep
      return find(:xpath, filter_size(:il, size)).click if key == :il
      find(:xpath, ta(filter_size(:ta, size), filter_size(:il, size))).click
    end
  end

  def click_view_results_btn(key = nil)
    post_processing key do
      return find(ta(VIEW_RESULTS_BTN_EP)).click if key == :ep
      return find(:xpath, VIEW_RESULTS_BTN_IL).click if key == :il
      find(:xpath, ta(VIEW_RESULTS_BTN_TA, VIEW_RESULTS_BTN_IL)).click
    end
  end

  def open_subcat_dropdown(key = nil)
    post_processing key do
      return find(ta(SUBCAT_DROPDOWN_EP)).click if key == :ep
      return find(:xpath, SUBCAT_DROPDOWN_IL).click if key == :il
      find(:xpath, ta(SUBCAT_DROPDOWN_TA, SUBCAT_DROPDOWN_IL)).click
    end
  end

  def choose_clothing_cat(key = nil)
    post_processing key do
      return find(ta(CLOTHING_CAT_DROPDOWN_EP)).click if key == :ep
      return find(:xpath, CLOTHING_CAT_DROPDOWN_IL).click if key == :il
      find(:xpath, ta(CLOTHING_CAT_DROPDOWN_TA, CLOTHING_CAT_DROPDOWN_IL)).click
    end
  end

end






