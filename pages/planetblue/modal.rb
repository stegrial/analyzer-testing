require_relative '../page_extension'

class Modal < PageExtension

  CLOSE_DISCOUNT_BUTTON_IL = "cloudiqClose"
  CLOSE_DISCOUNT_BUTTON_TA = "planetblue:modal:close_discount_button"

  CLOSE_POLICIES_BUTTON_IL = "(//*[text()=\"We've Updated Our Policies\"]//ancestor::div[contains(@class, 'klaviyo-form')]//button)[1]"
  CLOSE_POLICIES_BUTTON_TA = "planetblue:modal:close_policies_button"

  def click_close_discount_button(key = nil)
    within_frame 0 do
      sleep 2 # wait for page load
      find_element(key, il_type: :id, tl: CLOSE_DISCOUNT_BUTTON_TA, il: CLOSE_DISCOUNT_BUTTON_IL, check_path: $check_path).click
    end
  end

  def click_close_policies_button(key = nil)
    sleep 2 # wait for page load
    find_element(key, il_type: :xpath, tl: CLOSE_POLICIES_BUTTON_TA, il: CLOSE_POLICIES_BUTTON_IL, check_path: $check_path).click
  end

end
