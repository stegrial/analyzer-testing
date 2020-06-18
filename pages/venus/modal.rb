require 'spec_helper'
require_relative '../page_extension'

class Modal < PageExtension

  AGREE_BUTTON_IL = "#root #cc-agreement"
  AGREE_BUTTON_TA = 'venus:cookies_modal:agree_button'


  def click_agree_button(key = nil)
    find_element(key, il_type: :css, tl: AGREE_BUTTON_TA, il: AGREE_BUTTON_IL, check_path: $check_path).click
  end

end
