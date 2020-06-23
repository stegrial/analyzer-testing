require_relative '../page_extension'

class Modal < PageExtension

  CLOSE_DISCOUNT_BUTTON_IL = "cloudiqClose"
  CLOSE_DISCOUNT_BUTTON_TA = "planetblue:modal:close_discount_button"

  CLOSE_POLICIES_BUTTON_IL = "//button[@alt='Close form']"
  CLOSE_POLICIES_BUTTON_TA = "planetblue:modal:close_policies_button"

  CLOSE_CONTINUE_SHOP_BUTTON_IL = "//div[@id='geCloseBtn']"
  CLOSE_CONTINUE_SHOP_BUTTON_TA = "planetblue:modal:close_continue_shop_button"

  def click_close_discount_button(key = nil)
    within_frame 0 do
      sleep 2 # wait for page load
      find_element(key, il_type: :id, tl: CLOSE_DISCOUNT_BUTTON_TA, il: CLOSE_DISCOUNT_BUTTON_IL, check_path: $check_path).click
    end
  end

  def click_close_policies_button(key = nil)
    if page.has_xpath?("//button[@alt='Close form']")
      sleep 2 # wait for page load
      find_element(key, il_type: :xpath, tl: CLOSE_POLICIES_BUTTON_TA, il: CLOSE_POLICIES_BUTTON_IL, check_path: $check_path).click
    end
  rescue
    puts 'Policies doesnt exist'
  end

  def click_close_continue_shop_button(key = nil)
    if page.has_xpath?("//div[@id='geCloseBtn']")
    sleep 2 # wait for page load
    find_element(key, il_type: :xpath, tl: CLOSE_CONTINUE_SHOP_BUTTON_TA, il: CLOSE_CONTINUE_SHOP_BUTTON_IL, check_path: $check_path).click
    end
  rescue
    puts 'Continue shop doesnt exist'
  end

end
