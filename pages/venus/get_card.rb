require 'spec_helper'
require_relative '../page_extension'

class GetCardPage < PageExtension

  APPLY_BUTTON_IL = "#ctl00_Body1_hlProceedLink"
  APPLY_BUTTON_TA = "venus:get_card_page:apply_button"

  def click_apply_button(key = nil)
    find_element(key, il_type: :css, tl: APPLY_BUTTON_TA, il: APPLY_BUTTON_IL, check_path: $check_path).click
  end

  def should_see_benefits(key = nil, name)
    element = find_element(key, il_type: :xpath, tl: "venus:benefits:#{ta_name(name)}",
                 il: "//*[contains(@class, 'vcc-benefits-header') and text() = '#{name}']", check_path: $check_path)
    expect(element).to be_visible
  end

end