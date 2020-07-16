require 'spec_helper'
require_relative '../page_extension'

class VenusSubCategory < PageExtension

  def product_name(locator, name)
    case locator
    when :il then "//a[.//h2[text()='#{name}']]"
    when :ta then "venus:sub_category_page:product_list:#{name.tr('^A-Za-z0-9_', '')}"
    else p 'Locator type is not set'
    end
  end

  VIEW_DETAIL_SECOND_IL = "(//span[text()='view detail'])[2]"
  VIEW_DETAIL_SECOND_TA = 'venus:sub_category_page:view_detail_second'

  SIZE_FILTER_IL = "//button[.//span[text()='Filter']]"
  SIZE_FILTER_TA = 'venus:sub_category_page:size_filter'

  def filter_size(locator, size)
    case locator
    when :il then "//label[.//span[text()='#{size}']]"
    when :ta then "venus:sub_category_page:filter_size:#{size.tr('^A-Za-z0-9_', '')}"
    else p 'Locator type is not set'
    end
  end

  VIEW_RESULTS_BTN_IL = "//button[contains(., 'View Results')]"
  VIEW_RESULTS_BTN_TA = 'venus:sub_category_page:view_results_btn'

  SUBCAT_DROPDOWN_IL = "//div[@data-page='Subcategory']//div[@id='select-subcategories']"
  SUBCAT_DROPDOWN_TA = 'venus:sub_category_page:subcat_dropdown'

  CLOTHING_CAT_DROPDOWN_IL = "//li[text()='Clothing']"
  CLOTHING_CAT_DROPDOWN_TA = 'venus:sub_category_page:clothing_cat'


  def choose_product_by_name(key = nil, name)
      find_element(key, il_type: :xpath, tl: product_name(:ta, name), il: product_name(:il, name), check_path: $check_path).click
  end

  def click_view_detail_second(key = nil)
    find_element(key, il_type: :xpath, tl: VIEW_DETAIL_SECOND_TA, il: VIEW_DETAIL_SECOND_IL, check_path: $check_path).click
  end

  def open_size_filter(key = nil)
    find_element(key, il_type: :xpath, tl: SIZE_FILTER_TA, il: SIZE_FILTER_IL, check_path: $check_path).click
  end

  def choose_filter_size(key = nil, size)
    find_element(key, il_type: :xpath, tl: filter_size(:ta, size), il: filter_size(:il, size), check_path: $check_path).click
  end

  def click_view_results_btn(key = nil)
    find_element(key, il_type: :xpath, tl: VIEW_RESULTS_BTN_TA, il: VIEW_RESULTS_BTN_IL, check_path: $check_path).click
  end

  def open_subcat_dropdown(key = nil)
    find_element(key, il_type: :xpath, tl: SUBCAT_DROPDOWN_TA, il: SUBCAT_DROPDOWN_IL, check_path: $check_path).click
  end

  def choose_clothing_cat(key = nil)
    find_element(key, il_type: :xpath, tl: CLOTHING_CAT_DROPDOWN_TA, il: CLOTHING_CAT_DROPDOWN_IL, check_path: $check_path).click
  end

end






