require 'spec_helper'
require_relative '../page_extension'

class VenusCategory < PageExtension

  CAT_DROPDOWN_IL = "//div[@data-page='Category']//div[@id='select-subcategories']"
  CAT_DROPDOWN_TA = 'venus:category_page:cat_dropdown'

  def subcat_name(locator, name)
    case locator
    when :il then "(//li[text()='#{name[1]}'])[1]"
    when :ta then "venus:category_page:cat_dropdown:#{ta_name(name[0])}#{ta_name(name[1])}"
    else p 'Locator type is not set'
    end
  end


  def open_cat_dropdown(key = nil)
    post_processing key do
      find_element(key, il_type: :xpath, tl: CAT_DROPDOWN_TA, il: CAT_DROPDOWN_IL, check_path: $check_path).click
    end
  end

  def choose_subcat_by_first_name(key = nil, name)
    post_processing key do
      find_element(key, il_type: :xpath, tl: subcat_name(:ta, name), il: subcat_name(:il, name), check_path: $check_path).click
    end
  end


end



