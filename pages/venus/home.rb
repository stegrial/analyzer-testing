require 'spec_helper'
require_relative '../page_extension'

class VenusHome < PageExtension

  THIRD_BANNER_IL = "(//a[@title='Shop Now'])[3]"
  THIRD_BANNER_TA = 'venus:home_page:third_banner'


  def should_see_third_bunner(key = nil)
    element = find_element(key, il_type: :xpath, tl: THIRD_BANNER_TA, il: THIRD_BANNER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_third_banner(key = nil)
    find_element(key, il_type: :xpath, tl: THIRD_BANNER_TA, il: THIRD_BANNER_IL, check_path: $check_path).click
  end

end
