require 'spec_helper'
require_relative '../page_extension'

class PreOrderPage < PageExtension

  SUB_CATEGORIES_DROPDOWN_IL = "#select-subcategories"
  SUB_CATEGORIES_DROPDOWN_TA = "venus:preorder_page:sub_categories_dropdown"

  BANNER_IL = ".banner"
  BANNER_TA = 'venus:preorder_page:banner'

  LANDING_IMAGE_IL = ".landingImage"
  LANDING_IMAGE_TA = "venus:preorder_page:landing_image"


  def should_see_banner(key = nil)
    post_processing key do
      find_element(key, il_type: :css, tl: BANNER_TA, il: BANNER_IL, check_path: $check_path).click
    end
  end

  def should_see_landing_image(key = nil)
    post_processing key do
      find_element(key, il_type: :css, tl: LANDING_IMAGE_TA, il: LANDING_IMAGE_IL, check_path: $check_path).click
    end
  end

  def click_sub_categories_dropdown(key = nil)
    post_processing key do
      find_element(key, il_type: :css, tl: SUB_CATEGORIES_DROPDOWN_TA, il: SUB_CATEGORIES_DROPDOWN_IL, check_path: $check_path).click
    end
  end


end



